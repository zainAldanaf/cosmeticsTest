import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/AppText.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/custom/CustomAppBar.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  final List<Map<String, dynamic>> noti_items = [
    {'icon': Icons.notifications_active_outlined, 'text': AppText.notification_msg},
    {'icon': Icons.notifications_active_outlined, 'text': AppText.notification_msg},
    {'icon': Icons.notifications_active_outlined, 'text': AppText.notification_msg},
    // Add more items here
  ];
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: CustomAppBar(AppText.notification),
        body:
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView.separated(
            itemBuilder:(BuildContext context, int index){
              return ListTile(
                trailing: CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: Icon(noti_items[index]['icon'],color: AppColors.pink,),
                ),
                title: Text(noti_items[index]['text']),
                leading: Icon(Icons.arrow_back_outlined),
                onTap: () {
                  // Handle item tap here
                  print('Item tapped: ${noti_items[index]['text']}');
                },

              );
            },

            itemCount:noti_items.length,
            separatorBuilder: (BuildContext context, int index) { return Divider(); } ,),
        ),
      );
  }
}