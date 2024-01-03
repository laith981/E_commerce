import 'package:e_commerce_app_ui/utils/color/app_color.dart';
import 'package:flutter/material.dart';

class SignSocial extends StatelessWidget {
  const SignSocial({super.key, required this.icon, required this.title, this.onTape});
  final IconData icon;
  final String title;
  final VoidCallback? onTape;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTape,
      child: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors().grey1)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(
                width: 10,
              ),
              Text(title)
            ],
          )),
    );
  }
}
