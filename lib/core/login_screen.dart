import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weekproject/core/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = false;
  bool isVisible = false;
  TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        
        child: Column(
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Enter email or username'),
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
                      //  print(passwordController!.text);
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
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
                const FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Color(0xFF1DA1F2),
                ),
                Image.asset(
                  'assets/images/Google.png',
                  width: 25.0,
                ),
              ],
              
            ),
            
            Container(
              height: 50.0,
            ),
          ],        
        ),
      ),
    );
  }
}
