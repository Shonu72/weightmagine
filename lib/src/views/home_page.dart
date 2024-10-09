import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:weightmagine/core/theme/colors.dart';
import 'package:weightmagine/core/theme/themes.dart';
import 'package:weightmagine/core/utils/constants/app_string_constant.dart';
import 'package:weightmagine/core/utils/helpers.dart';
import 'package:weightmagine/services/notification/notification_service.dart';
import 'package:weightmagine/services/routes/route_path.dart';
import 'package:weightmagine/src/controllers/weight_controller.dart';
import 'package:weightmagine/src/models/weight_model.dart';
import 'package:weightmagine/src/views/widgets/custom_button.dart';
import 'package:weightmagine/src/views/widgets/custom_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController weightController = TextEditingController();
    final WeightController controller = Get.find<WeightController>();
    final notificationService = Get.find<NotificationService>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () {
                return Text('Hey ${controller.userName.value} 👋',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w600));
              },
            ),
            Text(AppStringConstant.progressText,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 16.sp)),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Helpers.saveUser(key: "haveFilledName", value: false);
                controller.deleteAllWeights();
                Helpers.removeUsername();
                context.go(RoutePaths.onboarding);
              },
              icon: const Icon(Icons.logout)),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () async {
              DateTime initialDateTime = DateTime.now();
              DateTime? pickedDateTime = await showDatePicker(
                context: context,
                initialDate: initialDateTime,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );

              if (pickedDateTime != null) {
                // Show time picker after selecting the date
                TimeOfDay initialTime = TimeOfDay.now();
                final isDarkMode =
                    Theme.of(context).brightness == Brightness.dark;
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: initialTime,
                  helpText: AppStringConstant.selectReminderText,
                  builder: (context, child) {
                    return Theme(
                      data: isDarkMode
                          ? AppTheme.darkTheme.copyWith(
                              textTheme: const TextTheme(
                                displayMedium: TextStyle(fontSize: 36),
                              ),
                            )
                          : AppTheme.lightTheme.copyWith(
                              textTheme: const TextTheme(
                              displayMedium: TextStyle(fontSize: 36),
                            )),
                      child: MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: false),
                        child: child!,
                      ),
                    );
                  },
                );

                if (pickedTime != null) {
                  DateTime selectedDateTime = DateTime(
                    pickedDateTime.year,
                    pickedDateTime.month,
                    pickedDateTime.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );
                  print('Selected Date and Time: $selectedDateTime');
                  controller
                      .scheduleWeightReminderNotification(selectedDateTime);
                }
              }
            },
          ),
          SizedBox(
            width: 4.w,
          )
        ],
      ),
      body: Column(
        children: [
          const Divider(color: Colors.transparent),
          Expanded(
            child: Obx(
              () {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.transparent,
                  ),
                  itemCount: controller.weights.length,
                  itemBuilder: (context, index) {
                    final weight = controller.weights[index];
                    final DateTime parsedDate = DateTime.parse(weight.date);
                    final formattedDate =
                        DateFormat('dd:MM:yyyy').format(parsedDate);
                    final formattedTime =
                        DateFormat('hh:mm a').format(parsedDate);
                    return Dismissible(
                      key: Key(weight.id.toString()),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction) async {
                        await controller.deleteWeight(weight.id);

                        Helpers.toast(AppStringConstant.recordDeleteText);
                        controller.weights.remove(weight);
                      },
                      child: ListTile(
                        leading: const Icon(Icons.calendar_today),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            width: 0.2,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.white
                                    : AppColors.black,
                          ),
                        ),
                        title: RichText(
                          text: TextSpan(
                            text: AppStringConstant.recordedWeight,
                            style: Theme.of(context).textTheme.displayMedium,
                            children: [
                              TextSpan(
                                text: '${weight.weight} kg',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text('On $formattedDate at $formattedTime',
                            style: Theme.of(context).textTheme.displaySmall),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            // Add weights
            showDialog(
              context: context,
              builder: (context) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 140,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    surfaceTintColor: Colors.grey,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStringConstant.addWeightText,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                        ),
                      ],
                    ),
                    content: SizedBox(
                      height: 140,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: weightController,
                            hintText: AppStringConstant.enterWeight,
                            prefixIcon: const Icon(Icons.monitor_weight),
                            obscureText: false,
                            ontap: () {},
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter weight";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          CustomButton(
                            name: "Add",
                            onTap: () async {
                              if (weightController.text.isNotEmpty) {
                                final weight =
                                    double.parse(weightController.text);

                                final weightModel = WeightModel(
                                    id: DateTime.now().millisecondsSinceEpoch,
                                    date: DateTime.now().toString(),
                                    weight: weight);

                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    surfaceTintColor: Colors.transparent,
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const CircularProgressIndicator(),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Updating',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? AppColors.white
                                                    : AppColors.black,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                                controller.addOrUpdateWeight(weightModel);
                                Helpers.toast(
                                    AppStringConstant.recordedWeightUpdateText);
                                await Future.delayed(
                                    const Duration(seconds: 1));

                                Navigator.pop(context);
                                Navigator.pop(context);
                                weightController.clear();
                              } else {
                                Helpers.toast(AppStringConstant.enterWeight);
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Image(
            image: const AssetImage('assets/add.png'),
            height: 3.5.h,
            width: 3.5.h,
            color: AppColors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
