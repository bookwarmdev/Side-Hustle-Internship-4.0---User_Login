import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weekproject/core/login_screen.dart';
import 'package:weekproject/core/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _SignupScreenState extends State<SignupScreen> {
  bool isLogin = false;
  bool isVisible = false;
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? usernameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const BouncingScrollPhysics(),
        
        child: Column(
          children: [
            TextFormField(
              controller: usernameController,
              decoration:
                  const InputDecoration(labelText: 'Enter email',
                  ),
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
              height: 30.0,
            ),
            GestureDetector(
              onTap: () async {
                try{
                  UserCredential _userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword
                    (email: usernameController!.text, password: passwordController!.text.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                } on FirebaseAuthException catch(e){
                  // print(e);
                  if (e.code == 'weak-password') {
                    // print('The password provided is too weak.');
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: const Text('Password should be at least 6 characters.'),
                          backgroundColor: Colors.red.shade400,
                          duration: const Duration(seconds: 1, microseconds: 200),
                        ),
                    );
                  } else if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: const Text('The account already exists for that email.'),
                        backgroundColor: Colors.red.shade400,
                        duration: const Duration(seconds: 1, microseconds: 200),
                      ),
                    );
                    // print('The account already exists for that email.');
                  }else if(e.code == 'invalid-email') {
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: const Text('The email address is badly formatted. Invalid Email'),
                      backgroundColor: Colors.red.shade400,
                      duration: const Duration(seconds: 1, microseconds: 200),
                    ),
                );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: const Text('Something went wrong'),
                      backgroundColor: Colors.red.shade400,
                      duration: const Duration(seconds: 1, microseconds: 200),
                    ),
                  );
                  print(e);
                }
              },
              child: Container(
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
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
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
