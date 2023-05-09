import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_ui/components/default_button.dart';
import 'package:ecommerce_ui/constants.dart';
import 'package:ecommerce_ui/router.dart';
import 'package:ecommerce_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  final enableNotifier = ValueNotifier(false);

  String pin1 = '';
  String pin2 = '';
  String pin3 = '';
  String pin4 = '';

  final List<String> errors = [];

  void checkEnable() => enableNotifier.value =
      [pin1, pin2, pin3, pin4].every((element) => element.isNotEmpty);

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    enableNotifier.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpPinFormField(
                  autofocus: true,
                  focusNode: pin1FocusNode,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin2FocusNode);
                    pin1 = value;
                    checkEnable();
                  },
                ),
                OtpPinFormField(
                  focusNode: pin2FocusNode,
                  prevFocusNode: pin1FocusNode,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin3FocusNode);
                    pin2 = value;
                    checkEnable();
                  },
                ),
                OtpPinFormField(
                  focusNode: pin3FocusNode,
                  prevFocusNode: pin2FocusNode,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin4FocusNode);
                    pin3 = value;
                    checkEnable();
                  },
                ),
                OtpPinFormField(
                  focusNode: pin4FocusNode,
                  prevFocusNode: pin3FocusNode,
                  onChanged: (value) {
                    if (value.isNotEmpty) pin4FocusNode.unfocus();
                    pin4 = value;
                    checkEnable();
                  },
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.15),
            ValueListenableBuilder<bool>(
                valueListenable: enableNotifier,
                builder: (context, enable, child) {
                  final router = AutoRouter.of(context);
                  return DefaultButton(
                    press: () => router.push(const LoginSuccessRoute()),
                    text: "Continue",
                    disabled: !enable,
                  );
                })
          ],
        ));
  }
}

class OtpPinFormField extends StatelessWidget {
  const OtpPinFormField(
      {super.key,
      this.onChanged,
      this.autofocus = false,
      this.focusNode,
      this.prevFocusNode});

  final Function(String)? onChanged;
  final bool autofocus;
  final FocusNode? focusNode;
  final FocusNode? prevFocusNode;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: '');

    return SizedBox(
      width: getProportionateScreenWidth(60),
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) {
          if (event.runtimeType == RawKeyDownEvent) {
            if (['Backspace', 'Delete'].contains(event.logicalKey.keyLabel) &&
                controller.text.isEmpty &&
                prevFocusNode != null) {
              prevFocusNode!.requestFocus();
            }
          }
        },
        child: TextFormField(
          onTap: () {
            controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length));
            controller.selection =
                TextSelection.collapsed(offset: controller.text.length);
          },
          controller: controller,
          autofocus: autofocus,
          focusNode: focusNode,
          obscureText: true,
          obscuringCharacter: '●',
          keyboardType: TextInputType.number,
          style: const TextStyle(fontSize: 24, color: kTextColor),
          textAlign: TextAlign.center,
          decoration: otpInputDecoration,
          inputFormatters: [LengthLimitingTextInputFormatter(1)],
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
        ),
      ),
    );
  }
}
