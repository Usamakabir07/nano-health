import 'package:flutter/material.dart';

import '../../common/colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    this.password = false,
    required this.hint,
    this.onValid,
    required this.enableBorder,
  }) : super(key: key);
  final TextEditingController controller;
  final bool password;
  final bool enableBorder;
  final String hint;
  final Function? onValid;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  void togglePassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  void initState() {
    obscureText = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      controller: widget.controller,
      keyboardType:
          widget.password ? TextInputType.visiblePassword : TextInputType.text,
      style: TextStyle(
        color: MyColors.black,
        fontSize: 16.00,
      ),
      cursorColor: MyColors.baseColorDark,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: false,
        label: widget.password ? const Text('Password') : const Text('Email'),
        labelStyle: TextStyle(
          color: MyColors.black.withOpacity(0.7),
          fontWeight: FontWeight.normal,
          fontSize: 14.00,
        ),
        suffixIcon: widget.password
            ? GestureDetector(
                onTap: () {
                  togglePassword();
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: MyColors.baseColorLight,
                  size: 20,
                ),
              )
            : Icon(
                Icons.check_circle_outline_rounded,
                color: MyColors.baseColorLight,
                size: 18,
              ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.enableBorder ? MyColors.baseColorDark : MyColors.black,
            width: widget.enableBorder ? 1 : 0,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color:
                widget.enableBorder ? MyColors.baseColorDark : MyColors.black,
            width: widget.enableBorder ? 1 : 0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.enableBorder
                ? MyColors.baseColorDark
                : MyColors.baseColorLight,
            width: widget.enableBorder ? 1 : 0,
          ),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: MyColors.grey,
          fontWeight: FontWeight.normal,
          fontSize: 16.00,
        ),
        fillColor: Colors.white,
      ),
      validator: (String? value) {
        if (widget.onValid != null) {
          var v = widget.onValid!(value);
          if (v != null) return (v.toString());
        }
        return null;
      },
    );
  }
}
