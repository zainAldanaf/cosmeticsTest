import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constant/AppText.dart';
import '../core/constant/colors.dart';
import '../core/custom/CustomButton.dart';

class RadioBottomSheetWidget extends StatefulWidget {
  String title;
  RadioBottomSheetWidget(this.title);

  @override
  State<RadioBottomSheetWidget> createState() => _RadioBottomSheetWidgetState();
}

class _RadioBottomSheetWidgetState extends State<RadioBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    int selectedValue = 1;
    return   Container(
      color: AppColors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          RadioListTile<int>(
            title: Text(AppText.high_price),
            value: 1,
            groupValue: selectedValue,
            onChanged: (value) {
              //Navigator.pop(context);
              // Do something with the selected value
              selectedValue = value!;
              setState(() {

              });
            },
          ),
          RadioListTile<int>(
            title: Text(AppText.least_price),
            value: 2,
            groupValue: selectedValue,
            onChanged: (value) {
              // Navigator.pop(context);
              // Do something with the selected value
              selectedValue = value!;
              setState(() {

              });
            },
          ),
          RadioListTile<int>(
            title: Text(AppText.recentlyAdded),
            value: 3,
            groupValue: selectedValue,
            onChanged: (value) {
              //Navigator.pop(context);
              // Do something with the selected value
              selectedValue = value!;
              setState(() {

              });


            },
          ),
          CustomButtonPink(text: AppText.orderBtn, onPressed: () { Navigator.pop(context);},)

        ],
      ),
    );
  }
}