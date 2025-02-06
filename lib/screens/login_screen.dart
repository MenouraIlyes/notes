import 'package:flutter/material.dart';
import 'package:notes/shared/colors.dart';
import 'package:notes/widgets/custom_button.dart';
import 'package:notes/widgets/custom_heading.dart';
import 'package:notes/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String emailText = "";
  String passwordText = "";
  bool isLoading = false;
  bool isGoogleSigningIn = false;

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // login header
            SizedBox(height: 30),
            CustomHeading(
              title: 'Login',
              color: Colors.black,
              subTitle: 'Welcome Back !',
            ),

            // Login picture
            SizedBox(height: 30),
            Center(
              child: Image.asset(
                "assets/images/login.png",
                width: 200,
                height: 200,
              ),
            ),

            // email Textfield
            SizedBox(height: 30),
            CustomTextfield(
              controller: _emailController,
              labelText: 'Email',
              isObsecure: false,
              onChanged: (value) {
                setState(() {
                  emailText = value;
                });
              },
            ),
            // password textfield
            SizedBox(height: 20),
            CustomTextfield(
              controller: _passwordController,
              labelText: 'Password',
              noIcon: false,
              isObsecure: true,
              onChanged: (value) {
                setState(() {
                  passwordText = value;
                });
              },
            ),

            // button
            SizedBox(height: 30),
            CustomButton(
              title: 'Login',
              color: appPrimary,
              onTap: () {
                // Navigate to the home screen (push and remove untill)
              },
            ),

            // divider
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // line
                Expanded(
                  child: Divider(
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  " Or ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[400],
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),

            // google sign in box
            SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 58,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // google logo
                    Image.asset(
                      "assets/icons/google.png",
                      width: 25,
                    ),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ),

            // don't have an account?
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text(
                    "You don't have an account? ",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to sign up screen
                    },
                    child: Text(
                      "Sign-Up",
                      style: TextStyle(
                        color: appSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Stack(children: [
        getBody(),
        if (isGoogleSigningIn)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(
                color: appPrimary,
              ),
            ),
          ),
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: CircularProgressIndicator(
                color: appPrimary,
              ),
            ),
          ),
      ]),
    );
  }
}
