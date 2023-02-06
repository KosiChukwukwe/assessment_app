import 'package:assessment_app/logic/auth.dart';
import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UpdateUsernameScreen extends StatefulWidget {
  const UpdateUsernameScreen({Key? key}) : super(key: key);

  @override
  State<UpdateUsernameScreen> createState() => _UpdateUsernameScreenState();
}

class _UpdateUsernameScreenState extends State<UpdateUsernameScreen> {

  TextEditingController newUsernameController = TextEditingController();
  Auth auth = Auth();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    String currentUsername = "@ggggggggg";
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const Text('Current Username:',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.navyBlue
                      ),),
                    Text(
                      currentUsername,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                const Gap(16),
                TextFormField(
                    controller: newUsernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New Username',
                      hintText: 'Enter Username',
                    ),
                    validator:(val){
                      if(val!.isEmpty){
                        return "Required";
                      }
                      if(!val.contains('@')){
                        return "Email must contain '@' ";
                      }
                    }
                ),
                const Gap(20),
                Row(
                  children: [
                    Icon(Icons.info,
                      size: 16,
                      color: AppColors.textColor.withOpacity(0.7),
                    ),
                    const Gap(8),
                    Text('Clicking the button below takes you back to the new screen,\nand do well to log in with the new details.',
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
                      if (_formKey.currentState!.validate()){
                        await auth.updateUsername(
                        newUsername: newUsernameController.text
                        );

                        setState(() {
                        currentUsername = newUsernameController.text;
                        });
                    }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navyBlue,
                    ),

                    child: const Text("Save New Username"),
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
