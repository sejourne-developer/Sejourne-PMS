import 'package:shadow_overlay/shadow_overlay.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../data/services/exporter.dart';

class ApprovalProperty extends StatelessWidget {
  const ApprovalProperty({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadiusDirectional.only(
          topStart: Radius.circular(TSizes.md),
          topEnd: Radius.circular(TSizes.md)),

      /// -- stack to show image with out border
      child: Column(
        children: [
          /// Property Image
          Stack(
            children: [
              /// Overlay Shadow for the image
              ShadowOverlay(
                shadowWidth: TDeviceUtils.getScreenWidth(context) * 0.8,
                shadowHeight: 80,
                shadowColor: Colors.black,

                /// Image
                child: Image(
                  image: AssetImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),

              /// Price Text
              PositionedDirectional(
                start: TSizes.sm,
                bottom: TSizes.sm,
                child: TRoundedContainer(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsetsDirectional.symmetric(
                      vertical: TSizes.xs, horizontal: TSizes.sm),
                  child: Text(
                    "Apartment",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .apply(color: TColors.white),
                  ),
                ),
              )
            ],
          ),

          /// Property Information
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(TSizes.md),
                bottomEnd: Radius.circular(TSizes.md),
              ),
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.dark
                  : TColors.white,
              //border:  Border.all(color:THelperFunctions.isDarkMode(context)?TColors.darkPrimaryBorderColor: TColors.lightPrimaryBorderColor, width: 0.8),
              border: Border(
                right: BorderSide(
                    color: THelperFunctions.isDarkMode(context)
                        ? TColors.darkPrimaryBorderColor
                        : TColors.lightPrimaryBorderColor,
                    width: 0.8),
                left: BorderSide(
                    color: THelperFunctions.isDarkMode(context)
                        ? TColors.darkPrimaryBorderColor
                        : TColors.lightPrimaryBorderColor,
                    width: 0.8),
                bottom: BorderSide(
                    color: THelperFunctions.isDarkMode(context)
                        ? TColors.darkPrimaryBorderColor
                        : TColors.lightPrimaryBorderColor,
                    width: 0.8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(TSizes.sm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Property title
                  Text(
                    maxLines: 2,
                    "1 Bedroom for Rent | Dubai Hills",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),

                  /// Property type

                  const SizedBox(
                    height: TSizes.xs,
                  ),

                  /// Property Location
                  HorizontalIconText(
                    icon: TImage.locationIcon,
                    title: "Business Bay, Dubai",
                    isSub: false,
                    iconColor:
                        Get.isDarkMode ? TColors.darkIconColor : TColors.primary,
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),

                  /// Property Specification
                  Row(
                    children: [
                      Flexible(
                          child: HorizontalIconText(
                        icon: TImage.bedRoomsIcon,
                        title: "1 Bed",
                        isSub: false,
                        iconColor: Get.isDarkMode
                            ? TColors.darkIconColor
                            : TColors.primary,
                      )),
                      Flexible(
                          child: HorizontalIconText(
                        icon: TImage.bathIcon,
                        title: "1 Bath",
                        isSub: false,
                        iconColor: Get.isDarkMode
                            ? TColors.darkIconColor
                            : TColors.primary,
                      )),
                      Flexible(
                          child: HorizontalIconText(
                        icon: TImage.mapIcon,
                        title: "289 Sqft",
                        isSub: false,
                        iconColor: Get.isDarkMode
                            ? TColors.darkIconColor
                            : TColors.primary,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),

                  Row(
                    children: [
                      const TCircularImage(
                        height: 16,
                        width: 16,
                        image: TImage.user6,
                      ),
                      const SizedBox(
                        width: TSizes.sm,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Listed By",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .apply(
                                    color: Get.isDarkMode
                                        ? TColors.darkFontColor
                                        : TColors.darkGrey)),
                        TextSpan(
                            text: " John Doe",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .apply(
                                    color: Get.isDarkMode
                                        ? TColors.darkFontColor
                                        : TColors.primary)),
                      ])),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
