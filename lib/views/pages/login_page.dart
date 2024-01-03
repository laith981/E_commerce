import 'package:e_commerce_app_ui/utils/color/app_color.dart';
import 'package:e_commerce_app_ui/views/widgets/app_button.dart';
import 'package:e_commerce_app_ui/views/widgets/sing_social_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> _formKey;
  bool _psswordVisibility = false;
  @override
  void initState() {
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Login Account",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppColors().primaryColor),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "Please login with regisered account",
            style: TextStyle(fontSize: 7, color: AppColors().grey),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            "Emael or Phone Number",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors().grey2,
                  hintText: "Enter your Email or Phone Number",
                  hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors().grey),
                  prefixIcon: const Icon(Icons.email),
                  prefixIconColor: AppColors().grey)),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            "Password",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
              obscureText: !_psswordVisibility,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors().grey2,
                  hintText: "Enter your Password",
                  hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors().grey),
                  suffixIcon: Icon(_psswordVisibility ? Icons.visibility : Icons.visibility_off),
                  suffixIconColor: AppColors().grey,
                  prefixIcon: const Icon(Icons.password),
                  prefixIconColor: AppColors().grey)),
          const SizedBox(
            height: 8.0,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Pssword?",
                style: TextStyle(color: AppColors().primaryColor),
              ),
            ),
          ),
          const AppButton(backgroundcolor: true, filltext: "Sign in"),
          Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              "Or using other method",
              style: TextStyle(color: AppColors().grey),
            ),
          ),
          const SignSocial(icon: Icons.g_mobiledata_rounded, title: "Sign Up with Googel"),
          const SizedBox(
            height: 8.0,
          ),
          const SignSocial(icon: Icons.facebook, title: "Sign Up with FAcebook"),
          const SizedBox(
            height: 8.0,
          ),
          const AppButton(backgroundcolor: false, filltext: "Create Account")
        ],
      ),
    ));
  }
}
