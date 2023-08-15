import 'package:cosmeticstest/core/constant/AppText.dart';
import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:cosmeticstest/core/custom/CustomFormTextfield.dart';
import 'package:cosmeticstest/presentation/pages/Auth/create_account.dart';
import 'package:cosmeticstest/presentation/pages/Auth/forgetPassword.dart';
import 'package:cosmeticstest/presentation/pages/NavigationBarScreen/NavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/Images.dart';
import '../../../core/custom/CustomButton.dart';
import '../NavigationBarScreen/HomeScreen.dart';


class SignUpScreen extends StatefulWidget{
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController pass = TextEditingController();


  bool password=true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _textFieldValue;
  String _inputText = '';
  bool _isFocused = false;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Form is valid. Value: $_textFieldValue');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    AppImages.splashImage,
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Form(key:_formKey,
                    child:Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:15.0,right: 15.0),
                          child: CustomFormTextFeild(
                            controller: mobile,
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return AppText.validateWrongNo;
                              }else if(!RegExp(r'^05\d{8}$').hasMatch(value)){
                                return AppText.validateWrongNo;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _textFieldValue = value;
                              setState(() {
                                _inputText = value;
                                _isFocused = true;
                              });
                            },
                          hint:AppText.numTxtFeild, prefixIcon: const Icon(Icons.phone_android), ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left:15.0,right: 15.0),
                          child: CustomFormTextFeild(
                            keyboardType: TextInputType.visiblePassword,
                            validate: (v) {
                              if (v == null || v.isEmpty) {
                                return AppText.validateWrongTxt;
                              }else if(v.length < 8){
                                return AppText.validateWrongpass;
                              }else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NavigationBarScreen(),
                                  ),
                                );
                                setState(() {});
                              }
                            },
                              onChanged: (value) {

                                _textFieldValue = value;
                                setState(() {
                                  _inputText = value;
                                  _isFocused = true;
                                });
                              },
                            controller: pass,
                            hint:AppText.passTxtFeild,
                            prefixIcon: Icon(Icons.lock_open_sharp), ),
                        ),
                      ],
                    ),
                  ),
              ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPassword(),
                        ),
                      );
                    },
                    child: Text(AppText.forgetPassword,
                        style: const TextStyle(color: AppColors.lightPink,)),
                  ),
                  const SizedBox(height: 20),
                  CustomButtonPink(
                    onPressed:  _submitForm,
                    text:AppText.signup,
                  ),
                  const SizedBox(height: 14),
                  CustomButtonLightpink(
                    onPressed:(){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAccount(),
                      ),
                    );
                 },
                    text: AppText.creatAccount,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
          ),
        ));

 }
}