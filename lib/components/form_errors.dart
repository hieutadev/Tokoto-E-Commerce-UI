import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FormErrors extends StatelessWidget {
  const FormErrors({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => buildFormErrorText(text: errors[index])),
    );
  }
}

Row buildFormErrorText({required String text}) {
  return Row(
    children: [
      SvgPicture.asset("assets/icons/Error.svg",
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenWidth(14)),
      SizedBox(width: getProportionateScreenWidth(8)),
      Text(
        text,
        style: const TextStyle(color: Colors.red),
      )
    ],
  );
}
