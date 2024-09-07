import 'package:flutter/material.dart';
import 'package:travel_app_task/core/constant/app_colors.dart';
import 'package:travel_app_task/core/constant/app_icons.dart';
import 'package:travel_app_task/core/constant/app_images.dart';
import 'package:travel_app_task/core/models/post_model.dart';
import 'package:travel_app_task/core/models/story_model.dart';
import 'package:travel_app_task/core/routs/app_router.dart';
import 'package:travel_app_task/view/presentation/dashboard_screen/home_screen.dart';
import 'package:travel_app_task/view/presentation/search_screen/search_screen.dart';
import 'package:travel_app_task/view/widget/bottomnavbar/bottom_nav_bar.dart';
import 'package:travel_app_task/view/widget/custom_button.dart';

class ShareScreen extends StatelessWidget {
  ShareScreen({super.key});

  final List<StoryModel> storyModelList = [
    StoryModel(image: AppImages.storyImage1, name: "Jhonson"),
    StoryModel(image: AppImages.storyImage2, name: "Michal"),
    StoryModel(image: AppImages.storyImage3, name: "Smith"),
    StoryModel(image: AppImages.storyImage4, name: "Krish"),
    StoryModel(image: AppImages.storyImage5, name: "Deo"),
    StoryModel(image: AppImages.storyImage6, name: "Jack"),
  ];

  final List<PostModel> postModelList = [
    PostModel(
        image: AppImages.postImage1,
        name: "Cortney346",
        title:
            "Travel can be Done by foot, Bicycle, Automobile, Train, Boat, Bus, Airplane, Ship Or Other Means "),
    PostModel(
        image: AppImages.postImage2,
        name: "James2306",
        title:
            "Meals can be prepared using a stove, microwave, oven, grill, or any other cooking appliance."),
    PostModel(
        image: AppImages.postImage3,
        name: "Smith8",
        title:
            "Entertainment can be enjoyed through television, radio, streaming services, video games, or attending live events."),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        AppRouter.closeOthers(context, HomeScreen());
      },
      child: Scaffold(
        appBar: AppBar(
          leading: FittedBox(
            fit: BoxFit.scaleDown,
            child: InkWell(
              onTap: () {
                AppRouter.closeOthers(context, const BottomNavBar());
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
          titleSpacing: 0,
          title: const Text("The Holiday",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: (){
                AppRouter.normal(context, const SearchScreen());
              },
                child: Image.asset(AppIcons.sendIcon, height: 20, width: 20)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){

                },
                  child: Image.asset(AppIcons.bellIcon, height: 20, width: 20)
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Story Widget
              storyWidget(),

              const SizedBox(
                height: 30,
              ),

              //Post Widget
              postWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget storyWidget() {
    return SizedBox(
      height: 125,
      child: ListView(
        key: const Key('storyListView'),
        padding: const EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                          color: AppColors.greyColor.withOpacity(0.5))),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: AppColors.whiteColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Post Story")
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: storyModelList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(11),
                            image: DecorationImage(
                                image: AssetImage(storyModelList[index].image),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 80),
                      child: Text(
                        storyModelList[index].name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget postWidget() {
    return ListView.builder(
      key: const Key('postListView'),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: postModelList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: AssetImage(AppImages.profileImage),
                            fit: BoxFit.cover),
                        border: Border.all(color: AppColors.primaryColor)),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postModelList[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 1),
                      ),
                      const Text(
                        "Suggested for you",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    btnName: "Follow",
                    onTap: () {},
                  ),
                  const Icon(Icons.more_vert)
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                postModelList[index].title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    image: DecorationImage(
                        image: AssetImage(postModelList[index].image),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Image.asset(AppIcons.likeIcon, height: 22, width: 22),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(AppIcons.commentIcon,
                            height: 25, width: 25)),
                    Image.asset(AppIcons.sharePostIcon, height: 25, width: 25),
                    const Spacer(),
                    const Icon(Icons.bookmark_border)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
