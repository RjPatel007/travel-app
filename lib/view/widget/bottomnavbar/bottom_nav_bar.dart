import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel_app_task/core/constant/app_colors.dart';
import 'package:travel_app_task/core/constant/app_icons.dart';
import 'package:travel_app_task/core/routs/app_router.dart';
import 'package:travel_app_task/view/presentation/dashboard_screen/home_screen.dart';
import 'package:travel_app_task/view/presentation/dashboard_screen/share_screen.dart';
import 'package:travel_app_task/view/widget/custom_button.dart';

class BottomNavBar extends StatefulWidget {
  final int pageIndex;

  const BottomNavBar({super.key, this.pageIndex = 0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PageController pageController;

  ValueNotifier<int> pageIndex = ValueNotifier(0);
  double iconSize = 24;
  List<Widget> page = [
    HomeScreen(),
    ShareScreen(),
    const Center(child: Text("Promotion")),
    const Center(child: Text("Profile")),
  ];

  List icon = const [
    AppIcons.homeIcon,
    AppIcons.shareIcon,
    AppIcons.promotionIcon,
    AppIcons.profileIcon,
  ];

  List name = const [
    "Home",
    "Share",
    "Promotion",
    "Profile",
  ];

  @override
  void initState() {
    pageIndex.value = widget.pageIndex;
    pageController = PageController(initialPage: pageIndex.value);
    super.initState();
  }

  void _showPostOptions(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: Platform.isIOS ? 60 : 80),
          child: Dialog(
            alignment: Alignment.bottomCenter,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Upload New Post',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Click "+" Icon to create new post',
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: CustomButton(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                roundedBorder: true,
                                btnName: "Regular Post",
                                onTap: () {
                                  AppRouter.pop(context);
                                }),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: CustomButton(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 9),
                                roundedBorder: true,
                                btnColor: AppColors.whiteColor,
                                textColor: AppColors.primaryColor,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                btnName: "Partner Post",
                                onTap: () {
                                  AppRouter.pop(context);
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  AppIcons.dropDownIcon,
                  height: 7,
                  width: 14,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return page[pageIndex.value];
        },
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        onPressed: () => _showPostOptions(context),
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: Platform.isIOS ? 80 : 65,
        padding: const EdgeInsets.only(top: 10),
        child: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int index = 0; index < page.length; index++)
                  customMenu(
                    image: icon[index],
                    name: name[index],
                    color: value == index
                        ? AppColors.blackColor
                        : AppColors.greyColor,
                    onTap: () {
                      pageIndex.value = index;
                      pageController.animateToPage(pageIndex.value,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget customMenu(
      {required String image,
      required String name,
      required VoidCallback onTap,
      required Color color}) {
    return SizedBox(
      width: 70,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(image, height: iconSize, width: iconSize, color: color),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(color: color, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
