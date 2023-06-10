import 'package:flutter/material.dart';
import 'package:nano_health/infrastructure/home/model/shopping_item.dart';
import 'package:nano_health/view/screens/shoppingItemDetail/shopping_item_detail.dart';

import '../../common/colors.dart';
import '../../util/global_functions.dart';

// ignore: must_be_immutable
class ShoppingItemCard extends StatelessWidget {
  const ShoppingItemCard({
    Key? key,
    required this.index,
    required this.onTap,
    required this.shoppingItem,
  }) : super(key: key);
  final int? index;
  final Function() onTap;
  final dynamic shoppingItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: kWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: kWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      shoppingItem['image'],
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            MyColors.black,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'AED ${shoppingItem["price"]}',
                            style: TextStyle(
                              color: MyColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.00,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: MyColors.foreground,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: MyColors.foreground,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: MyColors.foreground,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                color: MyColors.foreground,
                              ),
                              Icon(
                                Icons.star_half_rounded,
                                color: MyColors.foreground,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: kWidth * 0.8,
                          child: Text(
                            shoppingItem['title'],
                            maxLines: 3,
                            style: TextStyle(
                              color: MyColors.black.withOpacity(0.7),
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              fontSize: 18.00,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: kWidth * 0.8,
                      child: Text(
                        shoppingItem['description'],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.00,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
