import 'dart:developer';

import 'package:camp_app/styles/app_colors.dart';
import 'package:camp_app/styles/button_styles.dart';
import 'package:flutter/material.dart';

import 'activity.dart';
import 'event.dart';

//import 'event.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  DateTime? selectedDate = DateTime.now();

  bool isAllActivity = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 64,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Активности",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 36,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 48,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: isAllActivity ? activity : activitySelected,
                    onPressed: () {
                      setState(() {
                        isAllActivity = !isAllActivity;
                      });
                    },
                    child: Text(
                      "Закрепленные",
                      style: TextStyle(fontSize: 16, color: isAllActivity ? AppColors.textDark : AppColors.background),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: isAllActivity ? activitySelected : activity,
                    onPressed: () {
                      setState(() {
                        isAllActivity = !isAllActivity;
                      });
                    },
                    child: Text(
                      "Все активности",
                      style: TextStyle(fontSize: 16, color: isAllActivity ? AppColors.background : AppColors.textDark),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16, top: 16),
                itemBuilder: (context, index) {
                  return Activity(
                    isAttached: index == 2,
                    title: "Активность",
                    description: "Quisque at vulputate nunc. Mauris nec nisi quis massa commodo feugiat nec vitae sapien. Nulla hendrerit mauris eget neque dapibus consectetur. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla mollis risus vestibulum neque sollicitudin, a lobortis enim aliquam.",
                    onTap: () {},
                  );
                },
                itemCount: 10,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}