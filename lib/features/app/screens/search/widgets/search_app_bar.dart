import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          TTexts.searchLabel.tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .apply(color: TColors.darkGrey),
        ),
        TCircularIcon(
          icon: TImage.clearIcon,
          onPressed: () => Get.back(),
        ),
      ],
    );
  }
}
