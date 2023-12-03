import 'package:flutter/material.dart';
import 'package:projek_wisata/constants.dart';
import 'package:projek_wisata/helper/keyboard.dart';
import 'package:projek_wisata/helper/session_manager.dart';
import 'package:projek_wisata/screens/Login_Success_Screen.dart';
import 'package:projek_wisata/services/auth_services.dart';
import 'package:projek_wisata/size_config.dart';
import 'package:projek_wisata/widgets/custom_snackbar.dart';
import 'package:projek_wisata/widgets/default_button.dart';
import 'package:projek_wisata/widgets/form_error.dart';
import 'package:projek_wisata/widgets/social_media_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

Future<void> checkIsLogin(BuildContext context) async {
  await SessionManager().isLogin(context);
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  String _error = '';
  final List<String?> errors = [];
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void initState() {
    super.initState();
    checkIsLogin(context);
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Future<void> _login() async {
    try {
      final user = await AuthService().login(email!, password!);

      if (user.email.isNotEmpty) {
        setState(() {
          _error = '';
        });

        // Simpan data pengguna ke SharedPreferences
        final prefs = await SessionManager.getInstance();
        await prefs.saveUserData(user.email);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const LoginSuccessScreen();
        }));
      } else {
        setState(() {
          _error = 'Wrong Email or Password';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Login Failed';
      });
    }

    if (_error.isNotEmpty) {
      CustomSnackbar.show(
        scaffoldMessengerKey.currentState!,
        _error,
        SnackbarType.error,
      );
      setState(() {
        _error = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
          body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Image.asset(
                    'images/logo.png',
                    width: 100,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        "Log In",
                        style: TextStyle(
                          color: Color(0xFFFAB43F),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildEmailFormField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        buildPasswordFormField(),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        Row(
                          children: [
                            Checkbox(
                              value: remember,
                              activeColor: primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  remember = value;
                                });
                              },
                            ),
                            const Text("Remember me"),
                            const Spacer(),
                          ],
                        ),
                        FormError(errors: errors),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        DefaultButton(
                          text: "Sign In",
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              KeyboardUtil.hideKeyboard(context);
                              _login();
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Lupa Password",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {},
                      ),
                      SocialMediaCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocialMediaCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun? ",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16)),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              color: primaryColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Masukan Password',
        labelStyle: TextStyle(
          color: Color(0xFFFAB43F),
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF837E93),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFFFAB43F),
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Masukan Email',
        labelStyle: TextStyle(
          color: Color(0xFFFAB43F),
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF837E93),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFFFAB43F),
          ),
        ),
      ),
    );
  }
}
