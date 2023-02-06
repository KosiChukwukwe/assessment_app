import 'dart:math';

import 'package:assessment_app/features/home/presentation/pages/home_screen.dart';
import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../pages/login_screen.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height = min(MediaQuery.of(context).size.height * 0.5, 580).toDouble();
    final focusedBorderColor = AppColors.navyBlue;
    final fillColor = AppColors.navyBlue;
    final borderColor = AppColors.textColor;

    final defaultPinTheme = PinTheme(
      width: 44,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor),
      ),
      textStyle: const TextStyle(
        color: AppColors.plainWhite
      )
    );
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: focusedBorderColor),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: fillColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: focusedBorderColor),
      ),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          color: AppColors.plainWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Gap(32),
            const Center(
              child: Text(
                'A One-Time Code has been sent to your Number',
                style:  TextStyle(
                  fontSize: 14,
                  color: AppColors.navyBlue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Center(
              child: Text(
                'Enter OTP Sent To Your Number',
                style:  TextStyle(
                fontSize: 14,
                color: AppColors.navyBlue,
              ),
              ),
            ),
            const Gap(32),
            Center(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: pinController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(12),
                        width: 7,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(88),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState!.validate()){
                  //   await auth.login(
                  //     OTP: pinController.text,
                  // }
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyBlue,
                ),

                child: const Text("Verify Phone Number"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
