import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weekproject/core/login_screen.dart';
import 'package:weekproject/core/signup_screen.dart';
import 'package:weekproject/core/style.dart';

class AuthUser extends StatefulWidget {
  const AuthUser({Key? key}) : super(key: key);

  @override
  _AuthUserState createState() => _AuthUserState();
}

class _AuthUserState extends State<AuthUser> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -120.0,
              child: Container(
                height: 440,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/one.png'),
                      fit: BoxFit.cover),
                ),
                child: Center(
                    child: SvgPicture.asset('assets/svg/abby1.svg',
                        height: 100.0)),
              ),
            ),
            if (!isKeyboard) const BottomImage(),
            Positioned(
              top: 180.0,
              left: MediaQuery.of(context).size.width / 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 30.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.height / 1.6,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kBorderColor,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuthButton(
                            onTap: () {
                              setState(() {
                                isLogin = true;
                              });
                            },
                            color: isLogin ? kPrimaryColor : Colors.white,
                            textColor: isLogin ? Colors.white : kPrimaryColor,
                            text: 'Log In',
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          AuthButton(
                            onTap: () {
                              setState(() {
                                isLogin = false;
                              });
                            },
                            color: !isLogin ? kPrimaryColor : Colors.white,
                            textColor: !isLogin ? Colors.white : kPrimaryColor,
                            text: 'Sign Up',
                          ),
                        ],
                      ),
                    ),
                    if (isLogin) ...[
                      const SizedBox(
                        height: 10.0,
                      ),
                      const LoginScreen(),
                    ] else ...[
                      const SizedBox(
                        height: 10.0,
                      ),
                      const SignupScreen(),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomImage extends StatelessWidget {
  const BottomImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -20.0,
      right: -20.0,
      child: Container(
        height: MediaQuery.of(context).size.width / 1.6,
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/two.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  GestureTapCallback? onTap;
  Color? color;
  Color? textColor;
  String text;

  AuthButton(
      {Key? key, this.onTap, this.color, this.textColor, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          width: 150.0,
          height: 40.0,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
