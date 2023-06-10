import 'package:flutter/material.dart';
import '../../common/colors.dart';
import '../../util/global_functions.dart';

class CircularLoadingWidget extends StatelessWidget {
  const CircularLoadingWidget({Key? key, this.progressColor}) : super(key: key);
  final String? progressColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: MyColors.baseColorLight,
          strokeWidth: 5,
          backgroundColor: MyColors.white,
        ),
      ),
    );
  }
}
