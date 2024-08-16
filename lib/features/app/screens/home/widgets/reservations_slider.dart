import 'package:carousel_slider/carousel_slider.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../data/services/exporter.dart';
import '../../../controllers/home/home_controller.dart';
import '../../../models/reservation_model.dart';
import 'reservation_booking_container.dart';

class ReservationSlider extends StatelessWidget {
  const ReservationSlider({
    super.key,
    required this.banners, required this.title,
  });

  final List<ReservationModel> banners;
  final List<String> title;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              initialPage: 0,
              //autoPlay: true,
              viewportFraction: 0.8,
              height: TDeviceUtils.getScreenHeight() * 0.42,
              //pageSnapping: true,
              //enlargeCenterPage: true,

              scrollPhysics: const AlwaysScrollableScrollPhysics(),
              //enableInfiniteScroll: true,
              onPageChanged: (index, _) =>
                  controller.updateReservationSliderIndicator(index),
              padEnds: false,
            ),
            items: title
                .map(
                  (url) => TRoundedContainer(
                    margin: const EdgeInsetsDirectional.only(start: TSizes.sm),
                    padding: const EdgeInsetsDirectional.all(TSizes.sm),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TRoundedContainer(
                                showBorder: false,
                                height: TSizes.md,
                                width: TSizes.md,
                                radius: TSizes.xs,
                                backgroundColor: Get.isDarkMode
                                    ? TColors.dark
                                    : TColors.primary,
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      "6",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(
                                              color: Get.isDarkMode
                                                  ? TColors.darkFontColor
                                                  : TColors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: TSizes.sm,
                              ),
                              Center(
                                child: FittedBox(
                                  child: Text(
                                    url,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .apply(
                                            color: Get.isDarkMode
                                                ? TColors.darkFontColor
                                                : TColors.dark),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          ListLayout(
                            physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              separatorHeight: TSizes.sm,
                              itemBuilder: (_, index) => ReservationBookingContainer(
                                    reservationModel: banners[index],
                                    index: index,
                                  ),
                              itemCount: banners.length),
                        ],
                      ),
                    ),
                  ),
                )
                .toList()),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < title.length; i++)
                  TCircularContainer(
                    width: TSizes.sm,
                    height: TSizes.sm,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor:
                        controller.reservationSliderCurrentIndex.value == i
                            ? dark
                                ? TColors.darkPrimaryBorderColor
                                : TColors.primary
                            : dark
                                ? TColors.dark
                                : TColors.accent,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
