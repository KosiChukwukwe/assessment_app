import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';

class BuddiesScreen extends StatefulWidget {
  const BuddiesScreen({Key? key}) : super(key: key);

  @override
  State<BuddiesScreen> createState() => _BuddiesScreenState();
}

class _BuddiesScreenState extends State<BuddiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.navyBlue,
        title: const Text('BUDDIES'),
      ),
      body: const Center(
        child: Text(
            'Exercise a little patience and in no time, \n you\'d have your own buddies...',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.navyBlue
          ),
          textAlign: TextAlign.center,
        ),),
    );
  }
}
