import 'package:assessment_app/utils/colors.dart';
import 'package:flutter/material.dart';

class OnboardingButton extends StatefulWidget {


  const OnboardingButton({super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = AppColors.navyBlue,
    this.height,
    this.width,
});


  final VoidCallback onPressed;
  final String buttonText;
  final Color? buttonColor;
  final double? height;
  final double? width;

  @override
  State<OnboardingButton> createState() => _OnboardingButtonState();
}

class _OnboardingButtonState extends State<OnboardingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: widget.height ?? 40,
          width: widget.width ?? 100,
          decoration: BoxDecoration(
            color: widget.buttonColor ?? AppColors.navyBlue,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                color: AppColors.plainWhite,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
        ),
      ),
    );
  }
}
