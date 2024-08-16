import '../../../../../common/widgets/images/dotted_border_circle_image.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../data/services/exporter.dart';

class OwnersContainer extends StatelessWidget {
  const OwnersContainer(
      {super.key,
      required this.imageUrl,
      required this.userName,
      required this.location,
      required this.email,
      required this.phone,
      required this.propertyNum,
      required this.totalEarning});

  final String imageUrl,
      userName,
      location,
      email,
      phone,
      propertyNum,
      totalEarning;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      constraints: BoxConstraints(
          minHeight: TDeviceUtils.getScreenHeight() * 0.10,
          maxHeight: TDeviceUtils.getScreenHeight() * 0.18),
      shadow: TShadowStyle.containerShadow,
      padding: const EdgeInsetsDirectional.only(start: TSizes.sm),
      //height: TDeviceUtils.getScreenHeight() * 0.14,
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          /// User Picture
          FittedBox(
            child: TDottedBorderCircleImage(
              imageSize: 72,
              borderWidth: 1,
              image: imageUrl,
              status: false,
            ),
          ),

          /// Property details
          Flexible(
            flex: 8,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Property Name
                  Text(
                      maxLines: 2,
                      userName,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge!),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            /// Location for apartment
                            FittedBox(
                                fit: BoxFit.scaleDown,
                                child: HorizontalIconText(
                                  icon: TImage.locationIcon,
                                  iconSize: TSizes.iconXs,
                                  iconColor: TColors.primary,
                                  title: location,
                                  isSub: false,
                                  titleTextStyle: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(color: TColors.primary),
                                )),
                            const SizedBox(
                              height: TSizes.sm,
                            ),
                            Row(
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: HorizontalIconText(
                                    icon: TImage.emailIcon2,
                                    iconSize: TSizes.sm,
                                    //isSub: false,
                                    maxLine: 1,
                                    titleTextStyle:
                                        Theme.of(context).textTheme.labelSmall,
                                    subTitleTextStyle:
                                        Theme.of(context).textTheme.labelSmall,
                                    title: "Email",
                                    subTitle: email,
                                  ),
                                ),

                              ],
                            ),

                            const SizedBox(
                              height: TSizes.sm,
                            ),
                            HorizontalIconText(
                              titleTextStyle:
                                  Theme.of(context).textTheme.labelSmall,
                              subTitleTextStyle:
                                  Theme.of(context).textTheme.labelSmall,
                              icon: TImage.phoneIcon,
                              iconSize: TSizes.sm,
                              title: "Phone",
                              subTitle: phone,
                            ),
                            const SizedBox(
                              height: TSizes.sm,
                            ),

                            Row(
                              children: [
                                HorizontalIconText(
                                  titleTextStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  subTitleTextStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  icon: TImage.propertiesIcon1,
                                  iconSize: TSizes.sm,
                                  title: "Properties",
                                  subTitle: propertyNum,
                                ),
                                const SizedBox(
                                  width: TSizes.sm,
                                ),
                                HorizontalIconText(
                                  titleTextStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  subTitleTextStyle:
                                      Theme.of(context).textTheme.labelSmall,
                                  icon: TImage.moneyIcon,
                                  iconSize: TSizes.sm,
                                  title: "Total Earning",
                                  subTitle: totalEarning,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: TSizes.sm,
                            ),
                          ],
                        ),
                      ),

                      /// Three Dot Icon
                      const Expanded(
                        child: Icon(
                          Icons.more_vert_outlined,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
