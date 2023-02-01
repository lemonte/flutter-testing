import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertesting/themes/colors.dart';

class MakeContactButton extends StatelessWidget {
  final String image;
  final String buttonText;
  final Color? color;
  final void Function()? onPressed;

  const MakeContactButton({super.key, required this.image, required this.buttonText, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 7, shadowColor: AppColors.gray7,
        backgroundColor: color,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: SizedBox(
        height: 115,
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 30, height: 30, child: SvgPicture.asset(image)),
            const SizedBox(height: 8),
            Text(buttonText, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.black9)),
          ],
        ),
      ),
    );
  }
}