import 'package:assessment_app/features/onboarding/presentation/pages/login_screen.dart';
import 'package:assessment_app/features/onboarding/presentation/pages/signup_screen.dart';
import 'package:assessment_app/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:flutter/material.dart';
import 'package:assessment_app/utils/assets.dart';
import 'package:assessment_app/utils/colors.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.onboardingImage,
                width: 400,
                height: 400,
              ),
              const Center(
                child: Text(
                  "Discover And Make Buddies In Your Favourite Sport Interests...",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.lightGreen
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(8),
              const Center(
                child: Text(
                  "In a matter of seconds, find and also \n connect with individuals of like sport interests.",
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textColor
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnboardingButton(
                      onPressed: (){
                        Navigator.push(
                        context,
                            MaterialPageRoute(builder: (context) => const SignupScreen()));
                      },
                      buttonText: "SIGN UP"),
                  const Gap(8),
                  OnboardingButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()));
                      },
                      buttonText: "LOGIN"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
