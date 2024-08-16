import 'package:shadow_overlay/shadow_overlay.dart';
import '../../../../../data/services/exporter.dart';
import '../../home/widgets/icon_text_widget.dart';

class ComparedProperty extends StatelessWidget {
  const ComparedProperty({super.key, required this.imageUrl});

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
                shadowWidth: TDeviceUtils.getScreenWidth(context) * 0.5,
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
                child: Text(
                  "1,200 AED / Night",
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: THelperFunctions.isDarkMode(context)
                          ? TColors.darkFontColor
                          : TColors.white),
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
                    "Stunning Studio Apartment in Dubai Arch (JLT)",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),

                  /// Property type
                  TRoundedContainer(
                    isGradient: true,
                    showBorder: false,
                    padding: const EdgeInsetsDirectional.symmetric(
                        vertical: TSizes.xs, horizontal: TSizes.sm),
                    child: Text(
                      "1${TTexts.bedRoomLabel.tr}, ${TTexts.apartmentLabel.tr}",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),

                  /// Property Location
                  const IconTextWidget(
                    icon: TImage.locationIcon,
                    title: "Dubai Arch (JLT), Dubai",
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),

                  /// Property Specification
                   Row(
                    children: [
                      Flexible(
                          child: IconTextWidget(
                        icon: TImage.bedRoomsIcon,
                        title: TTexts.studioLabel.tr,
                      )),
                      Flexible(
                          child: IconTextWidget(
                        icon: TImage.bathIcon,
                        title: "1 ${TTexts.bathroomsLabel.tr}",
                      )),
                      const Flexible(
                          child: IconTextWidget(
                        icon: TImage.mapIcon,
                        title: "289 Sqft",
                      )),
                    ],
                  ),
                   IconTextWidget(
                    icon: TImage.homeIcon2,
                    title: "${TTexts.swimmingPoolLabel.tr}, ${TTexts.gymLabel.tr}, ${TTexts.wifiLabel.tr}, ${TTexts.airConditioningLabel.tr}...",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
