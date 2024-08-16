import '../../../../../common/widgets/custom_shapes/containers/status_container.dart';
import '../../../../../common/widgets/images/dotted_border_circle_image.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../data/services/exporter.dart';
import '../../../models/reservation_model.dart';

class ReservationBookingContainer extends StatelessWidget {
  const ReservationBookingContainer({
    super.key,
    required this.reservationModel,
    required this.index,
  });

  final ReservationModel reservationModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(HomeController());
    // final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        TRoundedContainer(
          margin: const EdgeInsetsDirectional.only(top: TSizes.sm),
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
                  imageSize: 56,
                  borderWidth: 1,
                  image: reservationModel.imageUrl,
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
                          reservationModel.userName,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.displayLarge!),

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
                                      iconSize: TSizes.sm,
                                      title: reservationModel.location,
                                      isSub: false,
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    )),
                                const SizedBox(
                                  height: TSizes.sm,
                                ),
                                Row(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: HorizontalIconText(
                                        icon: TImage.checkIn,
                                        iconSize: TSizes.sm,
                                        //isSub: false,
                                        maxLine: 1,
                                        titleTextStyle: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        subTitleTextStyle: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        title: "CheckIn",
                                        subTitle: reservationModel.checkInDate,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: TSizes.sm,
                                    ),
                                    HorizontalIconText(
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      subTitleTextStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      icon: TImage.checkOut,
                                      iconSize: TSizes.sm,
                                      title: "CheckOut",
                                      subTitle: reservationModel.checkOutDate,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: TSizes.sm,
                                ),

                                Row(
                                  children: [
                                    HorizontalIconText(
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      subTitleTextStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      icon: TImage.priceIcon,
                                      iconSize: TSizes.sm,
                                      title: "Price",
                                      subTitle: "${reservationModel.price} / Night",
                                    ),
                                    const SizedBox(
                                      width: TSizes.sm,
                                    ),
                                    HorizontalIconText(
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      subTitleTextStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      icon: TImage.revenue,
                                      iconSize: TSizes.sm,
                                      title: "Revenue",
                                      subTitle: reservationModel.revenue,
                                    ),
                                    const SizedBox(
                                      width: TSizes.sm,
                                    ),
                                    FittedBox(
                                      child: HorizontalIconText(
                                        titleTextStyle: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        subTitleTextStyle: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        icon: TImage.nights,
                                        title: "Nights",
                                        subTitle: reservationModel.nights,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
        ),
         PositionedDirectional(
          //top: -10,
          end: 16,
          child: StatusContainer(label: reservationModel.referenceNumberAndType),
        ),
      ],
    );
  }
}
