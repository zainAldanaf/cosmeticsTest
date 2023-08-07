import 'package:cosmeticstest/core/constant/AppText.dart';
import 'package:cosmeticstest/presentation/pages/Auth/SignUpScreen.dart';
import 'package:cosmeticstest/presentation/pages/Auth/changePassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/constant/Images.dart';
import '../../../core/constant/colors.dart';
import '../../../core/custom/CustomButton.dart';
import '../../../core/custom/customText.dart';
import '../../../core/custom/customTextfield.dart';

class ConfirmAccount extends StatefulWidget {
  ConfirmAccount({Key? key}) : super(key: key);

  @override
  State<ConfirmAccount> createState() => _ConfirmAccountState();
}

class _ConfirmAccountState extends State<ConfirmAccount> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController Pincontroller = TextEditingController();

  String _inputText = '';
  bool _isFocused = false;

  String? _textFieldValue;

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
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              AppImages.splashImage,
              width: 250,
              height: 250,
            ),
            const SizedBox(
              height: 15,
            ),
            boldText(
              text: AppText.ActivateAccount,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
             child: PinCodeTextField(
                appContext: context,
                length: 4, // Set the length of the code
                onChanged: (value) {
                  // Handle code changes
                  print('Code changed: $value');
                },
                onCompleted: (value) {
                  // Handle code submission
                  print('Code submitted: $value');
                },
                // Customize the appearance of the input field
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 80,
                  fieldWidth: 80,
                  activeFillColor: Colors.white,
                  activeColor: Colors.blue,
                  selectedColor: Colors.blue,
                  inactiveColor: Colors.grey,
                ),
              ),
            ),

           SizedBox(height: 70,),
          titleText(title: AppText.ActivateAccountMsg,),
               SizedBox(height: 30,),
              CustomButtonPink(text: AppText.confirm,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePassword(),
                    ),
                  );
                  setState(() {});
              },),
                   SizedBox(height: 30,),

                  CustomBackTextButton(text: AppText.back,
                  onPressed:  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                    setState(() {});
                  },
                )
          ]),
        )));
  }
}
