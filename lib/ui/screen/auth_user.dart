import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weekproject/core/login_screen.dart';
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
             if (!isKeyboard) const BottomImage(),
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
                      const LoginScreen(),
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
          );
  }
}
