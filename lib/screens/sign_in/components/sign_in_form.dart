import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/components/custom_suffix_icon.dart';
import 'package:ecommerce_ui/components/default_button.dart';
import 'package:ecommerce_ui/components/form_errors.dart';
import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/router.dart';
import 'package:ecommerce_ui/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce_ui/screens/login_success/login_success_screen.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      initialValue: 'hieutadev@gmail.com',
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
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
          errorStyle: TextStyle(height: 0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg")),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      initialValue: 'hieutadev@gmail.com',
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
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
          errorStyle: TextStyle(height: 0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                  activeColor: kPrimaryColor,
                ),
                const Text("Remember me"),
                const Spacer(),
                GestureDetector(
                  onTap: () => router.push(const ForgotPasswordRoute()),
                  child: const Text("Forgot Password",
                      style: TextStyle(decoration: TextDecoration.underline)),
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            FormErrors(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            DefaultButton(
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    router.push(const LoginSuccessRoute());
                  }
                },
                text: "Continue")
          ],
        ));
  }
}
