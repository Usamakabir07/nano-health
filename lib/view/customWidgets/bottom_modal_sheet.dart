import 'package:flutter/material.dart';
import 'package:nano_health/view/customWidgets/rounded_button.dart';

import '../../common/colors.dart';
import '../../util/global_functions.dart';

Widget bottomModalSheet(
  String description,
  double ratings,
  int count,
) {
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
      height: kHeight * 0.55,
      width: kWidth * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.ios_share_rounded,
                    color: MyColors.baseColorLight,
                  ),
                ),
              ),
              SizedBox(
                width: kWidth * 0.7,
                child: RoundedButton(
                  onPressed: () {},
                  buttonText: 'Order Now',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        color: MyColors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        fontSize: 14.00,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: MyColors.black.withOpacity(0.7),
                    fontWeight: FontWeight.normal,
                    fontSize: 12.00,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: kWidth,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: MyColors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reviews ($count)",
                        style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.00,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "$ratings",
                            style: TextStyle(
                              color: MyColors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 32.00,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: MyColors.foreground,
                                size: 32,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: MyColors.foreground,
                                size: 32,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: MyColors.foreground,
                                size: 32,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: MyColors.foreground,
                                size: 32,
                              ),
                              Icon(
                                Icons.star_half_rounded,
                                color: MyColors.foreground,
                                size: 32,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
