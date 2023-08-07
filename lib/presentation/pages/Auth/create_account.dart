import 'package:cosmeticstest/core/constant/AppText.dart';
import 'package:cosmeticstest/core/constant/Images.dart';
import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:cosmeticstest/core/custom/customText.dart';
import 'package:cosmeticstest/presentation/pages/Auth/SignUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/custom/CustomButton.dart';
import '../../../core/custom/CustomFormTextfield.dart';
import '../../../widgets/TermsWidget.dart';

class CreateAccount extends StatefulWidget{
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {


  final TextEditingController mobile = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController  Confirmpass = TextEditingController();

  bool _isChecked = false;
  String? _selectedItem;
  String _inputText = '';
  bool _isFocused = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _textFieldValue;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Form is valid. Value: $_textFieldValue');
    }
  }
  List<String> countries = ['مصر', 'فلسطين', 'سوريا', 'لبنان',"اردن"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center (
        child: Form(
          key: _formKey,
          child: Column(
          children: [
            Image.asset(AppImages.splashImage, width: 110, height: 110,),
            boldText(text:AppText.creatAccount, fontWeight: FontWeight.bold, fontSize: 20),

            const SizedBox(
              height: 20,
            ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 2),
                child: CustomFormTextFeild(
                  controller: name,
                  onChanged: (value){},
                  validate: (v) {
                    if (v == null || v.isEmpty) {
                      return AppText.validateWrongTxt;
                    }
                  },
                  hint: AppText.nameTxtFeild , prefixIcon: const Icon(Icons.person_3_outlined),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
/*
              Padding(
                padding:
                const EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'اضغط لاختيار دولة',
                      prefixIcon: Icon(
                        Icons.flag,
                        color: AppColors.lightPink,
                      ),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors
                              .lightPink, // Change the border color here
                        ),
                      )),
                  onTap: () async {
                    await showModalBottomSheet<int>(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildItemPicker();
                      },
                    );
                    print("$_selectedItem");
                  },
                ),
              ),
*/
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 15.0, right: 15.0),
                child: CustomFormTextFeild(
                  controller: mobile,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  validate: (value) {
                  if (value!.isEmpty) {
                    return AppText.validateWrongNo;
                  } else if (!RegExp(r'^05\d{8}$').hasMatch(value)) {
                    return AppText.validateWrongNo;
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                  }
                  return null;
                  },
                  onChanged: (value) {
                    _textFieldValue = value;
                    setState(() {
                      _inputText = value;
                      _isFocused = true;
                    });
                  }, hint: AppText.numTxtFeild, prefixIcon: const Icon(Icons.phone_android),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 2),
                child: CustomFormTextFeild(
                  validate: (v) {
                    if (v == null || v.isEmpty) {
                      return AppText.validateWrongTxt;
                    }else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v)){
                      return AppText.validateWrongemail;
                    }else{
                      return null;
                    }
                  },
                  controller: email,
                  onChanged: (value) {
                    _textFieldValue = value;
                    setState(() {
                      _inputText = value;
                      _isFocused = true;
                    });
                  },
                  hint: AppText.emailTxtFeild,
                  prefixIcon: const Icon(Icons.alternate_email) ,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 2),
                child: CustomFormTextFeild(
                  obscureText: true,
                  validate: (v) {
                    if (v == null || v.isEmpty) {
                      return AppText.validateWrongTxt;
                    }else if(v.length < 8){
                      return AppText.validateWrongpass;
                    }else{
                      return null;
                    }
                  },
                  controller: pass,
                  onChanged: (String value) {
                    _textFieldValue = value;

                  setState(() {
                    _inputText = value;
                    _isFocused = true;
                  });},
                  hint: AppText.passTxtFeild,
                  prefixIcon: const Icon(Icons.lock_open_sharp),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 2),
              child: CustomFormTextFeild(
                validate: (v) {
                  if (v == null || v.isEmpty) {
                    return AppText.validateWrongTxt;
                  }else if(RegExp(r'[0-9]').hasMatch(v)){
                    return AppText.validateWrongpass;
                  }else{
                    return null;
                  }
                },
                controller: Confirmpass,
                onChanged: (String value) {
                  _textFieldValue = value;
                  setState(() {
                    _inputText = value;
                    _isFocused = true;
                  });},
                hint: AppText.passTxtFeild,
                prefixIcon:const Icon(Icons.lock_open_sharp),
              ),
            ),

              // conf pass
            SizedBox(height: 15,),
                CheckboxListTile(
                  title: Text(AppText.AcceptTearms,textAlign: TextAlign.end,),
                  value: _isChecked,
                  onChanged: (bool? value) {
           //     customshowModalBottomSheet(TermsWidget( controllerScroll: scrollController ,));
                    showModalBottomSheet(context: context,
                        backgroundColor: AppColors.white,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder( // <-- SEE HERE
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),)
                        ,builder: (BuildContext context)   =>  DraggableScrollableSheet(
                        initialChildSize: 0.6, //set this as you want
                        maxChildSize: 0.9, //set this as you want
                        minChildSize: 0.5, //set this as you want
                        expand: false,
                        builder: (context, scrollController) {

                          return TermsWidget( controllerScroll: scrollController ,/*onTapConfierm(value){}*/); //whatever you're returning, does not have to be a Container
                        }
                    ));
                    setState(() {
                      _isChecked = value ?? false;
                    });},
                ),
                /*TextButton(
                  onPressed: () {

                  },
                  child: Text(AppText.AcceptConditions),
                ),
*/
            SizedBox(
              height: 5,
            ),

            CustomButtonPink(onPressed: _submitForm ,
                text: AppText.creatAccount,
              ),]
            ),
          ),
        ),
      )
    );
  }
}