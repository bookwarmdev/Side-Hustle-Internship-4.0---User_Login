import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weekproject/core/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthUser extends StatefulWidget {
  const AuthUser({Key? key}) : super(key: key);

  @override
  _AuthUserState createState() => _AuthUserState();
}

class _AuthUserState extends State<AuthUser> {
  bool isLogin = false;
  bool isVisible = false;
  TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -120.0,
            child: Container(
              height: 460,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/one.png'),
                    fit: BoxFit.cover),
              ),
              child: Center(
                  child:
                      SvgPicture.asset('assets/svg/abby1.svg', height: 100.0)),
            ),
          ),
          Positioned(
            bottom: -10.0,
            right: -0.0, 
            child: Container(
              height: MediaQuery.of(context).size.width / 1.6,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/two.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: 210.0,
            left: 25.0,
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
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height / 1.6,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kBorderColor,),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isLogin = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isLogin ? kPrimaryColor : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                              ),
                              width: 150.0,
                              height: 40.0,
                              child: Center(
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: isLogin
                                          ? Colors.white
                                          : kPrimaryColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              isLogin = false;
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: !isLogin ? kPrimaryColor : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                              ),
                              width: 150.0,
                              height: 40.0,
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: !isLogin
                                          ? Colors.white
                                          : kPrimaryColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isLogin) ...[
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Enter email or username'),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            TextFormField(
                              obscureText: isVisible,
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // print(passwordController!.text);
                                      isVisible = !isVisible;
                                    });
                                  },
                                  child: Icon(
                                    isVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility_outlined,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(),
                                const Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                                gradient: LinearGradient(colors: [
                                  Color(0xFFF6841A),
                                  kPrimaryColor,
                                ]),
                                color: Colors.red,
                              ),
                              width: 200,
                              height: 40,
                              child: const Center(
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: kBorderColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'or continue with',
                                    style: TextStyle(
                                      color: Color(0xFFBDBDBD),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: kBorderColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                           const SizedBox(height: 5.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Color(0xFF1DA1F2),
                                ),
                                FaIcon(FontAwesomeIcons.google,
                                color: Colors.black87,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ] else ...[
                    const Expanded(
                      child: Center(child: Text('SIGN OUT PAGE')),
                    )
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
