import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app_task/core/constant/app_colors.dart';
import 'package:travel_app_task/core/constant/app_icons.dart';
import 'package:travel_app_task/core/constant/app_images.dart';
import 'package:travel_app_task/core/routs/app_router.dart';
import 'package:travel_app_task/view/widget/custom_button.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FittedBox(
          fit: BoxFit.scaleDown,
          child: InkWell(
            onTap: () {
              AppRouter.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor, shape: BoxShape.circle),
              child: const Icon(
                Icons.arrow_back,
                size: 20,
              ),
            ),
          ),
        ),
        title: const Text("Search Result",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: searchListWidget(),
    );
  }

  Widget facilityWidget({required String image}) {
    return Container(
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.greyColor)),
        child: Image.asset(
          image,
          height: 10,
          width: 10,
          color: AppColors.greyColor,
        ));
  }

  Widget searchListWidget() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.greyColor.withOpacity(0.2))),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: const DecorationImage(
                      image: AssetImage(AppImages.homeBanner),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Image.asset(AppIcons.fireIcon,
                                    height: 12, width: 12),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Text(
                                  "Trending",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                  color: AppColors.whiteColor,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.favorite_border,
                                color: AppColors.primaryColor,
                                size: 16,
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5),
                          )),
                      child: const Text(
                        "Pro Agency 10% OFF",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Manali - 5N/6 Days",
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                  Text(
                    "20,000 ₹",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Manali-Kasol-Simla"),
                        Row(
                          children: [
                            facilityWidget(image: AppIcons.bedIcon),
                            facilityWidget(image: AppIcons.cameraIcon),
                            facilityWidget(image: AppIcons.tvIcon),
                            facilityWidget(image: AppIcons.locationIcon),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Available Seat"),
                            Text("6/10")
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 0.0),
                            trackHeight: 3.0,
                            activeTrackColor: AppColors.primaryColor,
                            inactiveTrackColor:
                                AppColors.primaryColor.withOpacity(0.5),
                            overlayShape: SliderComponentShape.noOverlay,
                          ),
                          child: Slider(
                            value: 0.6,
                            onChanged: (value) {},
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 85,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Firqah Lab Agency",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Row(
                          children: [
                            Image.asset(AppIcons.locationIcon,
                                height: 15, width: 15),
                            const SizedBox(
                              width: 2,
                            ),
                            const Text(
                              "Chattogram,Bagladesh",
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: 5,
                              itemCount: 5,
                              itemSize: 20,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("(1.4K Review)")
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AppImages.verify,
                          height: 25,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.visibility_outlined,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "24",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomButton(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        roundedBorder: true,
                        btnName: "View Details",
                        fontSize: 16,
                        onTap: () {}),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: CustomButton(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        roundedBorder: true,
                        btnColor: AppColors.whiteColor,
                        textColor: AppColors.primaryColor,
                        border: Border.all(
                          color: AppColors.primaryColor,
                        ),
                        btnName: "Book Now",
                        fontSize: 16,
                        onTap: () {}),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

}
