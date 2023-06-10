import 'package:flutter/material.dart';

import '../../common/colors.dart';
import '../../util/global_functions.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(
            25,
          ),
        ),
      ),
      child: Container(
        height: 60,
        width: kWidth,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu_rounded,
                color: MyColors.baseColorLight,
              ),
              Icon(
                Icons.shopping_cart_outlined,
                color: MyColors.grey,
              ),
              Icon(
                Icons.favorite_border_rounded,
                color: MyColors.grey,
              ),
              Icon(
                Icons.person_outline,
                color: MyColors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
