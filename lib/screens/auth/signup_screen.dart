// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:login_signup/components/custom_scaffold/custom_scaffold.dart';
import 'package:login_signup/components/custom_textfield/custom_text_field.dart';
import 'package:login_signup/screens/auth/signin_screen.dart';
import 'package:login_signup/theme/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                  // get started form
                  child: Form(
                key: _formSignupKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // get started text
                    Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: lightColorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    // full name
                    CustomTextFormField(
                      labalText: 'Full Name',
                      hintText: ' Enter Full Name',
                      errorText: 'Please enter Full Name',
                      prefixIcon: Icons.person,
                      isPassword: false,
                    ),

                    const SizedBox(
                      height: 25.0,
                    ),

                    // email
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return 'Enter valid email';
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        label: const Text('Email'),
                        hintText: 'Enter Email',
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12, // Default border color
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.blueAccent),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    // password
                    CustomTextFormField(
                      labalText: 'Password',
                      hintText: ' Enter Password',
                      errorText: 'Please enter Password',
                      prefixIcon: Icons.password,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    CustomTextFormField(
                      labalText: 'Confirm Password',
                      hintText: ' Enter Confirm Password',
                      errorText: 'Please enter Confirm Password',
                      prefixIcon: Icons.password,
                      isPassword: true,
                    ),

                    const SizedBox(
                      height: 25.0,
                    ),
                    // i agree to the processing
                    Row(
                      children: [
                        Checkbox(
                          value: agreePersonalData,
                          onChanged: (bool? value) {
                            setState(() {
                              agreePersonalData = value!;
                            });
                          },
                          activeColor: lightColorScheme.primary,
                        ),
                        const Text(
                          'I agree to the processing of ',
                          style: TextStyle(
                            color: Color.fromARGB(115, 78, 48, 48),
                          ),
                        ),
                        Text(
                          'Personal data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: lightColorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    // signup button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            lightColorScheme
                                .primary, // Slightly darker shade for the button
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white), // text color
                          elevation:
                              MaterialStateProperty.all<double>(5.0), // shadow
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 18)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(16), // Adjust as needed
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Sign up'),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    // sign up divider

                    // already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (e) => const SignInScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lightColorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
