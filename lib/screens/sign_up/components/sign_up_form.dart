import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/components/custom_suffix_icon.dart';
import 'package:ecommerce_ui/components/default_button.dart';
import 'package:ecommerce_ui/components/form_errors.dart';
import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/router.dart';
import 'package:ecommerce_ui/screens/complete_profile/complete_profile_screen.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmPassword = '';
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

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Form(
      key: _formKey,
      child: Column(children: [
        buildEmailFormField(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildPasswordFormField(),
        SizedBox(height: getProportionateScreenHeight(30)),
        buildConfirmPassFormField(),
        SizedBox(height: getProportionateScreenHeight(30)),
        FormErrors(errors: errors),
        SizedBox(height: getProportionateScreenHeight(30)),
        DefaultButton(
            press: () {
              if (_formKey.currentState!.validate()) {
                // Go to complete profile page
                router.push(const CompleteProfileRoute());
              }
            },
            text: "Continue")
      ]),
    );
  }

  TextFormField buildConfirmPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
          if (password == confirmPassword) removeError(error: kMatchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          errorStyle: TextStyle(height: 0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Confirm Password",
          hintText: "Re-enter your password",
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg")),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
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
}
