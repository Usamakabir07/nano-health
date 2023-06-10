import 'package:flutter/material.dart';
import 'package:nano_health/view/customWidgets/bottom_bar.dart';
import 'package:nano_health/view/customWidgets/circular_loading_widget.dart';
import 'package:nano_health/view/customWidgets/top_bar.dart';
import 'package:nano_health/view/customWidgets/shopping_item.dart';
import 'package:nano_health/viewModels/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../shoppingItemDetail/shopping_item_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeViewModel>().getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.white.withOpacity(0.92),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              const TopBar(),
              Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
                return homeViewModel.isLoading
                    ? const Center(
                        child: CircularLoadingWidget(),
                      )
                    : homeViewModel.isError
                        ? const Center(
                            child: Text('Unable to load data'),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: homeViewModel.items.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                    vertical: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      ShoppingItemCard(
                                        index: index,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return ShoppingItemDetail(
                                                shoppingItem:
                                                    homeViewModel.items[index],
                                              );
                                            }),
                                          );
                                        },
                                        shoppingItem:
                                            homeViewModel.items[index],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
              }),
            ],
          ),
        ),
        bottomNavigationBar: const BottomBar());
  }
}
