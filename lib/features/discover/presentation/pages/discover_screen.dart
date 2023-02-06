import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.navyBlue,
        title: const Text('DISCOVER'),
      ),
      body: const Center(
        child: Text(
          'I promise, i\'m working on this feature, \n soon you\'d be able to discover fun things...',
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
