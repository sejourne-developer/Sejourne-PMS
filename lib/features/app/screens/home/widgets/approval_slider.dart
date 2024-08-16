import 'package:carousel_slider/carousel_slider.dart';
import '../../../../../data/services/exporter.dart';
import '../../../controllers/home/home_controller.dart';
import 'approval_property.dart';

class ApprovalSlider extends StatelessWidget {
  const ApprovalSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              initialPage: 0,
              //autoPlay: true,
              viewportFraction: 0.8,
              height: TDeviceUtils.getScreenHeight() * 0.5,
              //pageSnapping: true,
              //enlargeCenterPage: true,

              scrollPhysics: const AlwaysScrollableScrollPhysics(),
              //enableInfiniteScroll: true,
              onPageChanged: (index, _) =>
                  controller.updateApprovalSliderIndicator(index),
              padEnds: false,
            ),
            items: banners
                .map(
                  (url) => Padding(
                    padding:  const EdgeInsetsDirectional.only(start: TSizes.sm),
                    child: ApprovalProperty(imageUrl: url),
                  )
                )
                .toList()),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        // Center(
        //   child: Obx(
        //     () => Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         for (int i = 0; i < banners.length; i++)
        //           TCircularContainer(
        //             width: TSizes.sm,
        //             height: TSizes.sm,
        //             margin: const EdgeInsets.only(right: 10),
        //             backgroundColor:
        //                 controller.approvalSliderCurrentIndex.value == i
        //                     ? dark
        //                         ? TColors.darkPrimaryBorderColor
        //                         : TColors.primary
        //                     : dark
        //                         ? TColors.dark
        //                         : TColors.accent,
        //           ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
