import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/components/custom_suffix_icon.dart';
import 'package:ecommerce_ui/components/default_button.dart';
import 'package:ecommerce_ui/components/form_errors.dart';
import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/router.dart';
import 'package:ecommerce_ui/screens/otp/otp_screen.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String address = '';

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
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            buildFirstNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildLastNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPhoneNumFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildAddressFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            FormErrors(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            DefaultButton(
                press: () {
                  if (_formKey.currentState!.validate()) {
                    router.push(const OTPRoute());
                  }
                },
                text: "Continue")
          ],
        ));
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          errorStyle: TextStyle(height: 0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Address",
          hintText: "Enter your address",
          suffixIcon:
              CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg")),
    );
  }

  TextFormField buildPhoneNumFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          errorStyle: TextStyle(height: 0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Phone Number",
          hintText: "Enter your phone number",
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg")),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          errorStyle: TextStyle(height: 0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "Last Name",
          hintText: "Enter your last name",
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          errorStyle: TextStyle(height: 0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "First Name",
          hintText: "Enter your first name",
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }
}
