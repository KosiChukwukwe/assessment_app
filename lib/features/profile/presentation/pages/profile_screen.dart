import 'package:assessment_app/utils/assets.dart';
import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.navyBlue,
        title: const Text('PROFILE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Gap(16),
            Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.lightGreen,
                        strokeAlign: StrokeAlign.outside,
                        width: 8
                      )
                    ),

                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 72,
                      child: Image.asset(Assets.profilePicture),
                    ),
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width *0.28,
                  bottom: 10,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.navyBlue,
                    ),
                    child: const Icon(Icons.add,
                    color: AppColors.plainWhite,),
                  ),
                ),
              ],
            ),
            const Gap(56),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Username:',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.navyBlue
                  ),
                ),
                Text('ggggggggg',
                  style: TextStyle(
                      fontSize: 12,
                  ),
                ),
              ],
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Phone Number:',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.navyBlue
                  ),),
                Text('ggggggggg',
                  style: TextStyle(
                  fontSize: 12,
                ),
                ),
              ],
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Email Address:',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.navyBlue
                  ),),
                Text('ggggggggg',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Interest:',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.navyBlue
                  ),),
                Text('ggggggggg',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
