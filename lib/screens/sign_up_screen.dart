import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/home_screen.dart';
import 'package:notes/services/authentification.dart';
import 'package:notes/shared/colors.dart';
import 'package:notes/widgets/custom_button.dart';
import 'package:notes/widgets/custom_heading.dart';
import 'package:notes/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String emailText = "";
  String passwordText = "";
  String confirmPasswordText = "";
  bool isLoading = false;

  void register() async {
    // auth service
    final authService = AuthService();

    // loading is true
    setState(() {
      isLoading = true;
    });

    // try register
    if (_passwordController.text == _confirmPasswordController.text) {
      // Yes, password match
      try {
        User? user = await authService.registerWithEmail(
          _emailController.text,
          _passwordController.text,
        );

        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Please check your credentials',
                style: TextStyle(color: appWhite, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      // password doesn't match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Le mot de passe ne correspond pas',
            style: TextStyle(color: appWhite, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }

    // end loading
    setState(() {
      isLoading = false;
    });
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // sign up header
            SizedBox(height: 30),
            CustomHeading(
              title: "Sign Up",
              color: Colors.black,
              subTitle: 'Welcome to "Your app name"',
            ),

            // sign up picture
            SizedBox(height: 30),
            Center(
              child: Image.asset(
                "assets/images/register.png",
                width: 200,
                height: 200,
              ),
            ),
            Text(
              "Please enter your credentials below to get started",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),

            // email textfield
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

            // Confirm password textfield
            SizedBox(height: 20),
            CustomTextfield(
              controller: _confirmPasswordController,
              labelText: 'Confirm Password',
              noIcon: false,
              isObsecure: true,
              onChanged: (value) {
                setState(() {
                  confirmPasswordText = value;
                });
              },
            ),

            // button
            SizedBox(height: 30),
            CustomButton(
              title: "Sign Up",
              color: appPrimary,
              onTap: () {
                register();
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Go back
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Go Back",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: appSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: getBody(),
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
    ]);
  }
}
