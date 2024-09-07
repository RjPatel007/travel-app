import 'package:flutter/material.dart';
import 'package:travel_app_task/core/constant/app_colors.dart';
import 'package:travel_app_task/core/constant/app_icons.dart';
import 'package:travel_app_task/core/constant/app_images.dart';
import 'package:travel_app_task/core/models/home_category_model.dart';
import 'package:travel_app_task/core/routs/app_router.dart';
import 'package:travel_app_task/view/presentation/search_screen/search_screen.dart';
import 'package:travel_app_task/view/widget/custom_button.dart';
import 'package:travel_app_task/view/widget/favourite_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ValueNotifier<int> selectedCategory = ValueNotifier(-1);

  final List<HomeCategoryModel> categoryList = [
    HomeCategoryModel(icon: AppIcons.beachIcon, title: "Holidays"),
    HomeCategoryModel(icon: AppIcons.keyIcon, title: "Rental"),
    HomeCategoryModel(icon: AppIcons.travelIcon, title: "Travel Partner"),
    HomeCategoryModel(icon: AppIcons.hotelIcon, title: "Hotels"),
    HomeCategoryModel(icon: AppIcons.foodIcon, title: "Food"),
    HomeCategoryModel(icon: AppIcons.movieIcon, title: "Movie")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(AppIcons.locationIcon),
        ),
        leadingWidth: 28,
        titleSpacing: 5,
        title: const Row(
          children: [
            Text(
              "Hyderabad, India",
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.arrow_drop_down_outlined)
          ],
        ),
        actions: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: (){

            },
              child: Image.asset(AppIcons.bellIcon, height: 20, width: 20)
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  AppRouter.normal(context, const SearchScreen());
                },
                child: Image.asset(AppIcons.sendIcon, height: 20, width: 20)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Home Banner
            homeBannerWidget(),

            const SizedBox(
              height: 20,
            ),

            //Category Widget
            categoryWidget(),

            const SizedBox(
              height: 30,
            ),

            //Destination Widget
            destinationWidget()
          ],
        ),
      ),
    );
  }

  Widget homeBannerWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              image: const DecorationImage(
                  image: AssetImage(AppImages.homeBanner), fit: BoxFit.fill),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                gradient: const LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0, 1])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Thailand",
                  style: TextStyle(
                      height: 1,
                      color: AppColors.whiteColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "And Explore the world",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 12),
                ),
                CustomButton(
                  margin: const EdgeInsets.only(top: 10),
                  btnName: "Book Now",
                  onTap: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 5),
          child: const Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        ValueListenableBuilder(
            valueListenable: selectedCategory,
            builder: (context, flg, child) {
              return SizedBox(
                height: 90,
                child: ListView.builder(
                  itemCount: categoryList.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool selectedItem =
                        selectedCategory.value == index ? true : false;
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        index == selectedCategory.value
                            ? selectedCategory.value = -1
                            : selectedCategory.value = index;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 80,
                        margin: const EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                            color: selectedItem
                                ? AppColors.primaryColor
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(11),
                            boxShadow: [
                              BoxShadow(
                                  color: selectedItem
                                      ? AppColors.primaryColor
                                      : Colors.grey,
                                  blurRadius: 2,
                                  spreadRadius: -2,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              categoryList[index].icon,
                              height: 30,
                              width: 30,
                              color: selectedItem
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              categoryList[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: selectedItem
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
      ],
    );
  }

  Widget destinationWidget() {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Text("What destination do you like to go to?",
                    style: TextStyle(
                        color: AppColors.blackColor,
                        height: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
              ),
              CustomButton(
                margin: const EdgeInsets.only(left: 60),
                btnName: "See More",
                onTap: () {},
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(11),
            image: const DecorationImage(
                image: AssetImage(AppImages.dubaiImage),
                fit: BoxFit.fill,
                opacity: 0.7),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppIcons.locationIcon,
                  color: AppColors.whiteColor, height: 20, width: 20),
              const SizedBox(
                width: 5,
              ),
              const Expanded(
                child: Text(
                  "Dubai",
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              FavouriteButton(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(11),
                    image: const DecorationImage(
                        image: AssetImage(AppImages.dubaiImage2),
                        fit: BoxFit.fill,
                        opacity: 0.7),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FavouriteButton(),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(11),
                    image: const DecorationImage(
                        image: AssetImage(AppImages.dubaiImage3),
                        fit: BoxFit.fill,
                        opacity: 0.7),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FavouriteButton(),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
