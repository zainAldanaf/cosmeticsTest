
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/AppText.dart';
import '../constant/colors.dart';

 class CustomFormTextFeild extends StatelessWidget{

   final ValueChanged<String> onChanged;
   final TextEditingController controller;
   final FormFieldValidator validate;
   final String hint;
   final Widget? prefixIcon;
   TextInputType? keyboardType;
   int? maxLength;
   bool? obscureText;

   bool _isFocused = false;


       CustomFormTextFeild({
     required this.onChanged,
     required this.controller,
     required this.validate,
     required this.hint,
     required this.prefixIcon,
     this.maxLength,
     this.keyboardType,
     this.obscureText

   } );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validate,

      decoration: InputDecoration(
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _isFocused
                ? AppColors.lightPink
                : AppColors.lightGray,
            width: 1,
          ),
        ),
        errorBorder:  const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
            // Set the error border color to red
            width: 2,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
            // Set the error border color to red
            width: 2,
          ),
        ),
        hintText: hint,
        prefixIcon: prefixIcon,
      ),
    );
  }

}