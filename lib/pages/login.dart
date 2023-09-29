import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_nest/providers/loginProvider.dart';
import 'package:tech_nest/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              // * Logo
              Container(
                decoration: const BoxDecoration(),
                margin: const EdgeInsets.only(top: 25),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    color: primaryColor,
                    height: 200,
                  ),
                ),
              ),
              // * Main Form
              Text(
                "Login to your account",
                style: headLine(h4, FontWeight.normal, primaryColor),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    child: Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 100),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          // * Email Container
                          Container(
                            margin: const EdgeInsets.only(bottom: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: headLine(
                                      body, FontWeight.normal, greyColor),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: context
                                      .read<LoginProvider>()
                                      .emailController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your email",
                                    hintStyle: headLine(body, FontWeight.normal,
                                        greyColor.withOpacity(0.6)),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    // ! Email error
                                    errorText: context
                                                .watch<LoginProvider>()
                                                .emailError ==
                                            true
                                        ? "Please enter valid email"
                                        : null,
                                    errorStyle: headLine(errorText,
                                        FontWeight.normal, errorColor),
                                    errorBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: errorColor)),
                                  ),
                                  onTapOutside: (event) => FocusManager
                                      .instance.primaryFocus
                                      ?.unfocus(),
                                  onChanged: (newValue) {
                                    if (newValue.isNotEmpty) {
                                      context
                                          .read<LoginProvider>()
                                          .setEmailError(false);
                                    } else {
                                      context
                                          .read<LoginProvider>()
                                          .setEmailError(true);
                                    }
                                  },
                                  onEditingComplete: () {
                                    if (context
                                        .read<LoginProvider>()
                                        .emailController
                                        .text
                                        .isNotEmpty) {
                                      context
                                          .read<LoginProvider>()
                                          .setEmailError(false);
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),

                          // * Password Field
                          Container(
                            margin: const EdgeInsets.only(bottom: 75),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Password",
                                  style: headLine(
                                      body, FontWeight.normal, greyColor),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: context
                                      .read<LoginProvider>()
                                      .passwordController,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: headLine(body, FontWeight.normal,
                                        greyColor.withOpacity(0.6)),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    // ! Password Error
                                    errorText: context
                                                .watch<LoginProvider>()
                                                .passwordError ==
                                            true
                                        ? "Please enter correct password"
                                        : null,
                                    errorStyle: headLine(errorText,
                                        FontWeight.normal, errorColor),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: errorColor),
                                    ),

                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        context
                                            .read<LoginProvider>()
                                            .changePassVisibility();
                                      },
                                      icon: Icon(
                                        context
                                                .watch<LoginProvider>()
                                                .secureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: context
                                                    .watch<LoginProvider>()
                                                    .passwordError ==
                                                true
                                            ? errorColor
                                            : greyColor,
                                      ),
                                    ),
                                  ),
                                  obscureText:
                                      context.read<LoginProvider>().secureText,
                                  keyboardType: TextInputType.text,
                                  onTapOutside: (event) => FocusManager
                                      .instance.primaryFocus
                                      ?.unfocus(),
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      context
                                          .read<LoginProvider>()
                                          .setPasswordError(false);
                                    } else {
                                      context
                                          .read<LoginProvider>()
                                          .setPasswordError(true);
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // * Forgot Password
                                Text(
                                  "Forgot Password?",
                                  style: headLine(12, FontWeight.normal,
                                      greyColor.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ),
                          // context.watch<LoginProvider>().loading == true
                          //     ? const CircularProgressIndicator()
                          //     : Container(),
                          // * Login Button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              minimumSize: const Size(double.infinity, 53),
                            ),
                            onPressed: () {
                              context.read<LoginProvider>().loginUser();
                            },
                            child: context.watch<LoginProvider>().loading ==
                                    true
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2.5),
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.0,
                                    ),
                                  )
                                : Text(
                                    "Log in",
                                    style: headLine(
                                        body, FontWeight.normal, Colors.white),
                                  ),
                          ),
                          // Container(
                          //     color: primaryColor,
                          //     margin: const EdgeInsets.only(bottom: 25),
                          //     child: const Text(
                          //       "Don't have an account? Call Support",
                          //     )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration textFieldStyle(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: headLine(body, FontWeight.normal, greyColor.withOpacity(0.6)),
      border: OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
