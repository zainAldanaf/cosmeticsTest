
import 'package:cosmeticstest/core/constant/AppText.dart';
import 'package:cosmeticstest/core/custom/CustomButton.dart';
import 'package:cosmeticstest/core/custom/CustomFormTextfield.dart';
import 'package:cosmeticstest/core/custom/customText.dart';
import 'package:cosmeticstest/core/custom/customTextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/Images.dart';
import '../../../core/constant/colors.dart';

class ChangePassword extends StatefulWidget{
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  final TextEditingController textEditingController3 = TextEditingController();

  String _inputText = '';
  bool _isFocused = false;
  String? _textFieldValue;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Form is valid. Value: $_textFieldValue');
    }
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Center (
      child: Column(
        children: [
        SizedBox(height: 60,),
      Image.asset(AppImages.splashImage , width: 200, height: 200,),

          Form( key: _formKey,
            child:

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),

                  child: boldText(text:AppText.changePass, fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: CustomFormTextFeild(
                    keyboardType: TextInputType.visiblePassword,
                    validate: (v) {
                      if (v == null || v.isEmpty) {
                        return AppText.validateWrongTxt;
                      }else if(v.length < 8){
                        return AppText.validateWrongpass;
                      }else{
                        return null;
                      }
                    },
                    onChanged: (value) {
                      _textFieldValue = value;
                      setState(() {
                        _inputText = value;
                        _isFocused = true;
                      });
                    }, controller: textEditingController, hint:AppText.passTxtFeild, prefixIcon: Icon(Icons.lock_open_sharp),
                  ),
                ),
                 SizedBox(height:20),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: CustomFormTextFeild(
                    keyboardType: TextInputType.visiblePassword,
                    validate: (v) {
                      if (v == null || v.isEmpty) {
                        return AppText.validateWrongTxt;
                      }else if(v.length < 8){
                        return AppText.validateWrongpass;
                      }else{
                        return null;
                      }
                    },
                    onChanged: (value) {
                      _textFieldValue = value;
                      setState(() {
                        _inputText = value;
                        _isFocused = true;
                      });
                    }, controller: textEditingController2, hint:AppText.passTxtFeild, prefixIcon: Icon(Icons.lock_open_sharp),
                  ),
                ),
                const SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: CustomFormTextFeild(
                    keyboardType: TextInputType.visiblePassword,
                    validate: (v) {
                      if (v == null || v.isEmpty) {
                        return AppText.validateWrongTxt;
                      }else if(v.length < 8){
                        return AppText.validateWrongpass;
                      }else{
                        return null;
                      }
                    },
                    onChanged: (value) {
                      _textFieldValue = value;
                      setState(() {
                        _inputText = value;
                        _isFocused = true;
                      });
                    }, controller: textEditingController3, hint:AppText.passTxtFeild, prefixIcon: Icon(Icons.lock_open_sharp),
                  ),
                ),
                const SizedBox(height: 50,),
                CustomButtonPink(text: AppText.confirm, onPressed: _submitForm)

              ],
            ),




            ), ]),
  ),
    )
  );
  }
}