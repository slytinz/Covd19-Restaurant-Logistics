import 'package:flutter/material.dart';
import 'package:yum/Pages/GlobalComponents/TextFieldsContainers.dart';
import 'package:yum/constants.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const InputTextField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryIconColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class InputPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const InputPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryIconColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryIconColor,
          ),
        ),
      ),
    );
  }
}
