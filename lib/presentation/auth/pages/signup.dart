import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/data/models/create_user_req.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/root/pages/root.dart';
import 'package:spotify/service_locator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: SvgPicture.asset(AppVectors.logo, height: 33)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          children: [
            _registerText(),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("If You Need Any Support "),
                Text("Click Here", style: TextStyle(color: AppColors.primary)),
              ],
            ),
            SizedBox(height: 25),
            _fullNameField(),
            SizedBox(height: 16),
            _emailFiels(),
            SizedBox(height: 16),
            _passwordField(),
            SizedBox(height: 33),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SignupUseCase>().call(
                  params: CreateUserReq(
                    fullName: _fullName.text.toString(),
                    email: _email.text.toString(),
                    password: _password.text.toString(),
                  ),
                );
                result.fold(
                  (l) {
                    var snackbar = SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                  (r) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const RootPage(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              title: "Create Account",
            ),
            SizedBox(height: 21),
            _or(),
            SizedBox(height: 24),
            _instantRegister(),
            SizedBox(height: 50),
            _signinText(),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Register",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Widget _fullNameField() {
    return TextField(
      controller: _fullName,
      decoration: InputDecoration(hintText: "Full Name"),
    );
  }

  Widget _emailFiels() {
    return TextField(
      controller: _email,
      decoration: InputDecoration(hintText: "Enter Email"),
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
      controller: _password,
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

  Widget _signinText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Do You Have An Account? ", style: _signinTextStyle()),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext builder) => SigninPage(),
              ),
            );
          },
          child: Text(
            "Sign In",
            style: _signinTextStyle().copyWith(color: Color(0xff288CE9)),
          ),
        ),
      ],
    );
  }

  TextStyle _signinTextStyle() {
    return TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
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

  Widget _instantRegister() {
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
}
