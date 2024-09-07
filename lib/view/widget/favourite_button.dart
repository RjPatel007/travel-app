import 'package:flutter/material.dart';
import 'package:travel_app_task/core/constant/app_colors.dart';

class FavouriteButton extends StatelessWidget {
  FavouriteButton({super.key});

  final ValueNotifier<bool> isFavourite = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isFavourite,
        builder: (context, flg, child) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              isFavourite.value = !isFavourite.value;
            },
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor.withOpacity(0.2),
                    shape: BoxShape.circle),
                child: isFavourite.value
                    ? const Icon(Icons.favorite,
                        color: AppColors.redColor, size: 16)
                    : const Icon(Icons.favorite_border,
                        color: AppColors.whiteColor, size: 16)),
          );
        });
  }
}
