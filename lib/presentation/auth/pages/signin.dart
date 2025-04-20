import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: SvgPicture.asset(AppVectors.logo, height: 33)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _siginText(),
            SizedBox(height: 22),
            _support(),
            SizedBox(height: 38),
            _emailFiels(),
            SizedBox(height: 16),
            _passwordField(),
            SizedBox(height: 20),
            _recoveryText(),
            SizedBox(height: 22),
            BasicAppButton(onPressed: () {}, title: "Sign In"),
            SizedBox(height: 21),
            _or(),
            SizedBox(height: 24),
            _instantSignin(),
            SizedBox(height: 50),
            _signupText(),
          ],
        ),
      ),
    );
  }

  Widget _siginText() {
    return const Text(
      "Sign In",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Widget _support() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("If You Need Any Support "),
        Text("Click Here", style: TextStyle(color: AppColors.primary)),
      ],
    );
  }

  Widget _emailFiels() {
    return TextField(
      decoration: InputDecoration(hintText: "Enter Username Or Email"),
    );
  }

  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _passwordField() {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: "Password",
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: _toggleVisibility,
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.greyText,
            ),
          ),
        ),
      ),
    );
  }

  Widget _recoveryText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Recovery Password",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget _or() {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1, endIndent: 10)),
        Text("Or"),
        Expanded(child: Divider(thickness: 1, indent: 10)),
      ],
    );
  }

  Widget _instantSignin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: 40,
          width: 40,
          child: SvgPicture.asset(AppVectors.googleLogo, width: 29),
        ),
        SizedBox(width: 58),
        Container(
          alignment: Alignment.bottomCenter,
          height: 40,
          width: 40,

          child: SvgPicture.asset(
            AppVectors.appleLogo,
            height: 36,
            colorFilter: ColorFilter.mode(
              context.isDarkMode
                  ? AppColors.lightBackground
                  : AppColors.darkGrey,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget _signupText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Not A Member ? ", style: _signinTextStyle()),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext builder) => SignupPage(),
              ),
            );
          },
          child: Text(
            "Register Now",
            style: _signinTextStyle().copyWith(color: Color(0xff288CE9)),
          ),
        ),
      ],
    );
  }

  TextStyle _signinTextStyle() {
    return TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  }
}
