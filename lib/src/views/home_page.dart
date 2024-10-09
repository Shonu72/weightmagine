import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weightmagine/core/theme/colors.dart';
import 'package:weightmagine/core/theme/themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController weightController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hey HK 👋',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w600)),
            Text("Your progress on weight",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 16.sp)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () async {
              TimeOfDay initialTime = TimeOfDay.now();
              final isDarkMode =
                  Theme.of(context).brightness == Brightness.dark;
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: initialTime,
                helpText: "Select Notification Reminder Time:",
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
                // Will update time in the database here and show toast
                print('Selected Time: ${pickedTime.format(context)}');
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
          const Divider(thickness: 0.4),
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                const weight = 50;
                return ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: RichText(
                    text: TextSpan(
                      text: 'Recorded weight: ', // Regular text
                      style: Theme.of(context).textTheme.displayMedium,
                      children: [
                        TextSpan(
                          text: '$weight kg', // Bold weight text
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Text('On 10/12/12 at 12:02 am',
                      style: Theme.of(context).textTheme.displaySmall),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: FloatingActionButton(
          onPressed: () {
            // Add weights
          },
          backgroundColor: AppColors.primaryColor,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
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
