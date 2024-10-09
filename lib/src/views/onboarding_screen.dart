import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weightmagine/core/theme/colors.dart';
import 'package:weightmagine/core/utils/constants/app_string_constant.dart';
import 'package:weightmagine/src/views/widgets/custom_button.dart';
import 'package:weightmagine/src/views/widgets/custom_textfield.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void dispose() {
    nameController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStringConstant.welcomeText,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            CustomTextField(
              controller: nameController,
              hintText: AppStringConstant.enterName,
              prefixIcon: const Icon(Icons.person),
              obscureText: false,
              ontap: () {},
              keyboardType: TextInputType.name,
              validator: (val) => val!.isEmpty ? 'Name cannot be empty' : null,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: weightController,
              hintText: AppStringConstant.enterWeight,
              prefixIcon: const Icon(Icons.line_weight),
              obscureText: false,
              ontap: () {},
              keyboardType: TextInputType.number,
              validator: (val) =>
                  val!.isEmpty ? 'Weight cannot be empty' : null,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStringConstant.reminderText,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                TextButton(
                  onPressed: () async {
                    TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );
                    if (picked != null && picked != selectedTime) {
                      setState(() {
                        selectedTime = picked;
                      });
                    }
                  },
                  child: Text(
                      '${AppStringConstant.pickTimeText} ${selectedTime.format(context)}', // Display chosen time
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 15.sp)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
                name: "Next", textColor: AppColors.white, onTap: () {}),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}
