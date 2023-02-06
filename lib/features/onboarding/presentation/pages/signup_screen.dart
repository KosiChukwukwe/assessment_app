import 'package:assessment_app/features/onboarding/presentation/widgets/OTP_verification.dart';
import 'package:assessment_app/logic/auth.dart';
import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/email_link_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  Auth auth = Auth();
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Text(
                    'Create Your Account',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: AppColors.lightGreen,
                    ),
                  ),
                  const Text(
                    'Register and get started',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textColor,
                    ),
                  ),
                  const Gap(20),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email Address',
                        hintText: 'Enter Email Address',
                      ),
                      validator:(val){
                        if(val!.isEmpty){
                          return "Required";
                        }
                        if(!val.contains('@')){
                          return "Email must contain '@' ";
                        }
                        if(!val.contains('.')){
                          return "Invalid Email ";
                        }
                      }
                  ),
                  const Gap(30),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: phoneNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        hintText: 'Enter Phone Number',
                      ),
                      validator:(val){
                        if(val!.isEmpty){
                          return "Required";
                        }
                      }
                  ),
                  const Gap(30),
                  TextFormField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Select a Username',
                      ),
                      validator:(val){
                        if(!val!.contains('@')){
                          return "username must contain '@' ";
                        }
                        if(val.length > 20){
                          return "username must be less than 20 characters";
                        }
                      }
                  ),
                  const Gap(30),
                  TextFormField(
                    obscureText: !_passwordVisible,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                      ),),
                      validator:(val){
                        if(val!.isEmpty){
                          return "Required";
                        }
                        if(val.length < 6){
                          return "Password must be at least 6 characters long";
                        }
                        if(val.length > 20){
                          return "Password must be less than 20 characters";
                        }
                      }
                  ),
                  const Gap(4),
                  Text(
                    'Password must contain at least 6 characters',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.textColor.withOpacity(0.7),
                    ),
                  ),
                  const Gap(40),
                  SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()){
                          await auth.register(
                            email: emailController.text,
                            password: passwordController.text,
                            userName: usernameController.text,
                            );
                          showModalBottomSheet<bool>(
                            context: context,
                            isScrollControlled: true,
                            barrierColor: AppColors.navyBlue.withOpacity(0.4),
                            builder: (context) {
                              return const EmailLink();
                              //OTPVerification();
                            },
                          );
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.navyBlue,
                      ),
                      child: const Text("Register"),
                    ),
                  ),
                  const Gap(10),
                  Center(
                    child: Text(
                      'By clicking this button, you agree to our terms & conditions',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.textColor.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),),),),
    );
  }
}
