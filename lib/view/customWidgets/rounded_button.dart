import 'package:flutter/material.dart';

import '../../common/colors.dart';
import '../../util/global_functions.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);
  final Function() onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kWidth * 0.8,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.baseColorLight,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
          ),
          minimumSize: const Size.fromHeight(
            55,
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: MyColors.white,
            fontWeight: FontWeight.w900,
            fontSize: 12.00,
          ),
        ),
      ),
    );
  }
}
