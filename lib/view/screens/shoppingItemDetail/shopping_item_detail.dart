import 'package:flutter/material.dart';
import 'package:nano_health/view/customWidgets/bottom_bar.dart';
import 'package:nano_health/view/customWidgets/bottom_modal_sheet.dart';

import '../../../common/colors.dart';
import '../../../util/global_functions.dart';

class ShoppingItemDetail extends StatefulWidget {
  static const routeName = '/item-detail-screen';
  const ShoppingItemDetail({Key? key, this.shoppingItem}) : super(key: key);
  final dynamic shoppingItem;

  @override
  State<ShoppingItemDetail> createState() => _ShoppingItemDetailState();
}

class _ShoppingItemDetailState extends State<ShoppingItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: MyColors.baseColorLight,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                title: Text(
                  'AED ${widget.shoppingItem['price']}',
                  textScaleFactor: 1,
                ),
                background: Stack(
                  children: [
                    SizedBox(
                      width: kWidth,
                      height: kHeight * 0.7,
                      child: Image.network(
                        widget.shoppingItem['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: kWidth,
                          padding: const EdgeInsets.only(bottom: 70),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                MyColors.black.withOpacity(0.5),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return bottomModalSheet(
                      widget.shoppingItem['description'],
                      widget.shoppingItem['rating']['rate'],
                      widget.shoppingItem['rating']['count']);
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
