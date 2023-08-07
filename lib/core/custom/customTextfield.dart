import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class textFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Widget? prefixIcon;

  const textFieldCustom({required this.controller,required this.hint, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        // Define the text color of the input text
        color: Colors.black,
        fontSize: 14,
      ),
      decoration: InputDecoration(

          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightPink),
          ),
          // Define the hint text and icon for the input field
          hintText: hint,
          prefixIcon: prefixIcon,
          hintStyle: const TextStyle(
            color: Colors.black,// Define the hint text color
          ),
          ),);
    }
}

class ConfirmationTextField extends StatelessWidget{
  late final ValueChanged<String> onChanged;
  late final TextEditingController controller;
  late final FormFieldValidator validate;


  ConfirmationTextField(
      {
        required this.onChanged,
        required this.controller,
        required this.validate});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validate,

      autofocus: true,
      showCursor: false,
      readOnly: false,

      keyboardType: TextInputType.number,
      style: Theme
        .of(context)
        .textTheme
        .headlineLarge,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly

      ],
      decoration: InputDecoration(
        counter: const Offstage(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(width:1, color: AppColors.pink),
          borderRadius: BorderRadius.circular(12),

        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red, // Set the error border color to red
            width: 2,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red, // Set the error border color to red
            width: 2,
          ),
        ),
      ),
    );
  }

}