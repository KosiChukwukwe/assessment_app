import 'dart:math';

import 'package:assessment_app/features/onboarding/presentation/pages/login_screen.dart';
import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmailLink extends StatefulWidget {
  const EmailLink({Key? key}) : super(key: key);

  @override
  State<EmailLink> createState() => _EmailLinkState();
}

class _EmailLinkState extends State<EmailLink> {
  @override
  Widget build(BuildContext context) {
    final height = min(MediaQuery.of(context).size.height * 0.5, 580).toDouble();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: height,
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
                'A Link has been sent to your Email for verification',
                style:  TextStyle(
                  fontSize: 14,
                  color: AppColors.navyBlue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Center(
              child: Text(
                'Don\'t forget to check your spam folders too',
                style:  TextStyle(
                  fontSize: 14,
                  color: AppColors.navyBlue,
                ),
              ),
            ),
            const Gap(88),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navyBlue,
                ),

                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
