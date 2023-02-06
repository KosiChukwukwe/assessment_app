import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  TextEditingController emailController = TextEditingController();
  //Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconButton(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.navyBlue,
                    )),
                const Center(
                  child: Text(
                    'Forgot Your Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: AppColors.lightGreen,
                    ),
                  ),
                ),
                const Gap(12),
                Center(
                  child: Text(
                    'Don\'t worry, it happens. Please enter the \nEmail address associated with your account \nto receive password reset instruction.\nDo well to also check your spam folder for the email. ',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textColor.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(30),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email Address',
                    hintText: 'Enter Email Address',
                  ),
                ),
                const Gap(30),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // await auth.resetPassword(email: emailController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navyBlue,
                    ),

                    child: const Text("Send"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
