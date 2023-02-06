import 'package:assessment_app/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:assessment_app/features/setting_and_privacy/presentation/pages/change_password.dart';
import 'package:assessment_app/features/setting_and_privacy/presentation/pages/update_email.dart';
import 'package:assessment_app/features/setting_and_privacy/presentation/pages/update_username.dart';
import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.navyBlue,
        title: const Text('SETTINGS AND PRIVACY'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Change Password:',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.navyBlue
                  ),),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
                  },
                  icon: const Icon(Icons.arrow_forward_rounded,
                      color: AppColors.navyBlue
                  ),
                ),
              ],
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Update Email:',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.navyBlue
                  ),),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UpdateEmailScreen()));
                  },
                  icon: const Icon(Icons.arrow_forward_rounded,
                      color: AppColors.navyBlue
                  ),
                ),
              ],
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Update Username:',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.navyBlue
                  ),),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UpdateUsernameScreen()));
                  },
                  icon: const Icon(Icons.arrow_forward_rounded,
                      color: AppColors.navyBlue
                  ),
                ),
              ],
            ),
            const Gap(24),
            Center(
              child: TextButton(
                child: const Text('LOG OUT',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: AppColors.navyBlue
                  ), ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OnboardingScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
