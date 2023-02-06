import 'package:assessment_app/features/onboarding/presentation/pages/login_screen.dart';
import 'package:assessment_app/logic/auth.dart';
import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UpdateEmailScreen extends StatefulWidget {
  const UpdateEmailScreen({Key? key}) : super(key: key);

  @override
  State<UpdateEmailScreen> createState() => _UpdateEmailScreenState();
}

class _UpdateEmailScreenState extends State<UpdateEmailScreen> {
  TextEditingController oldEmailController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();
  Auth auth = Auth();
  final _formKey = GlobalKey<FormState>();

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
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.navyBlue,
                    )),
                TextFormField(
                    controller: oldEmailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Current Email',
                      hintText: 'Enter Current Email',
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Required";
                      }
                      if (!val.contains('@')) {
                        return "Email must contain '@' ";
                      }
                      if (!val.contains('.')) {
                        return "Invalid Email ";
                      }
                    }),
                const Gap(30),
                const Gap(16),
                TextFormField(
                    controller: newEmailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New Email',
                      hintText: 'Enter New Email',
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Required";
                      }
                      if (!val.contains('@')) {
                        return "Email must contain '@' ";
                      }
                      if (!val.contains('.')) {
                        return "Invalid Email ";
                      }
                    }),
                const Gap(20),
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 16,
                      color: AppColors.textColor.withOpacity(0.7),
                    ),
                    const Gap(8),
                    Text(
                      'Clicking the button below takes you back to the new screen,\nand do well to log in with the new details.',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.textColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await auth.updateEmail(
                          oldEmail: oldEmailController.text,
                          newEmail: newEmailController.text,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navyBlue,
                    ),
                    child: const Text("Save New Email"),
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
