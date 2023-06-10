import 'package:flutter/material.dart';

import '../../common/colors.dart';
import '../../util/global_functions.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: SizedBox(
        height: 70,
        width: kWidth,
        child: Center(
          child: Text(
            "All Products",
            style: TextStyle(
              color: MyColors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
