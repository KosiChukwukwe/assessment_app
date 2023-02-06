import 'package:assessment_app/features/home/presentation/pages/home_screen.dart';
import 'package:assessment_app/features/onboarding/presentation/pages/signup_screen.dart';
import 'package:assessment_app/logic/auth.dart';
import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'forgot_password.dart';
import 'onboarding_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Auth auth = Auth();
  final _formKey = GlobalKey<FormState>();

  late bool _passwordVisible;

  void openHomePage(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const HomeScreen()));
}

  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnboardingScreen()));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.navyBlue,
                    )),
                const Text(
                  'Welcome Back,',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: AppColors.lightGreen,
                  ),
                ),
                const Text(
                  'Login to continue',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textColor,
                  ),
                ),
                const Gap(20),
                TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address or Phone Number',
                      hintText: 'Enter Email Address or Phone Number',
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Required";
                      }
                    }),
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
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Required";
                      }
                      if (val.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      if (val.length > 20) {
                        return "Password must be less than 20 characters";
                      }
                    }),
                const Gap(4),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen()));
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textColor,
                        ),
                      )),
                ),
                const Gap(40),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await auth.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navyBlue,
                    ),
                    child: const Text("Login"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textColor.withOpacity(0.7),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: AppColors.lightGreen,
                          ),
                        )),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
