import 'package:cosmeticstest/core/constant/AppText.dart';
import 'package:cosmeticstest/core/constant/Images.dart';
import 'package:cosmeticstest/core/custom/CustomFormTextfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';
import '../../../core/custom/CustomButton.dart';
import '../../../core/custom/customText.dart';
import 'confirmAccount.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();

}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController mobile = TextEditingController();
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
        body: SingleChildScrollView(
          child: Center(

      child: Column(children: [
              const SizedBox(height: 50,),
              Image.asset(AppImages.splashImage,width: 150,height: 150,),

              const SizedBox(height: 35,),
               boldText(text:AppText.forgetPassword, fontWeight: FontWeight.bold, fontSize: 20),

              const SizedBox(height: 15,),
        Form( key:_formKey,
          child:
          Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0),
              child: CustomFormTextFeild(
                controller: mobile,
                maxLength: 10,
                keyboardType: TextInputType.number,
                validate: (value) {
                  if (value!.isEmpty) {
                    return AppText.validateWrongNo;
                  } else if (!RegExp(r'^05\d{8}$').hasMatch(value)) {
                    return AppText.validateWrongNo;
                  }else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmAccount(),
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
                }, hint: AppText.numTxtFeild, prefixIcon: Icon(Icons.phone_android),
              ),
            ),),
              const SizedBox(height: 50),

              titleText(
                title:  AppText.forgetPassMsg,
              ),
              const SizedBox(
                height: 30.0,
              ),
              CustomButtonPink(
                text: AppText.send,
                onPressed: _submitForm
              ),
              const SizedBox(height: 14),

      ]),
    ),
        ));
  }
}
