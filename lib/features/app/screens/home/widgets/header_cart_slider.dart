import 'package:carousel_slider/carousel_slider.dart';
import 'package:sejourne_pms/features/app/models/chart_model.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/texts/horizontal_title_sub_title_widget.dart';
import '../../../../../data/services/exporter.dart';
import '../../../controllers/home/home_controller.dart';
import 'line_chart_sample2.dart';

class HeaderChartSlider extends StatelessWidget {
  const HeaderChartSlider({
    super.key,
    required this.banners, this.color,
  });

  final List<ChartModel> banners;
  final List<Color>? color;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: TDeviceUtils.getScreenHeight() * 0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              options: CarouselOptions(
                initialPage: 0,
                //autoPlay: true,
                viewportFraction: 0.6,
                height: TDeviceUtils.getScreenHeight() * 0.15,
                //pageSnapping: true,
                //enlargeCenterPage: true,

                scrollPhysics: const AlwaysScrollableScrollPhysics(),
                //enableInfiniteScroll: true,
                onPageChanged: (index, _) =>
                    controller.updateHeaderSliderIndicator(index),
                padEnds: false,
              ),
              items: banners
                  .map(
                    (url) => TRoundedContainer(
                      margin: const EdgeInsetsDirectional.only(
                          start: TSizes.defaultSpace),
                      padding: const EdgeInsetsDirectional.all(TSizes.sm),
                      height: TDeviceUtils.getScreenHeight() * 0.12,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: HorizontalTitleSubTitleWidget(
                                  title: url.total,
                                  subTitle: url.title,
                                  titleAlign: TextAlign.start,
                                  spaceBetween: 0,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  titleStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(color: Colors.blue),
                                  subTitleStyle: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(
                                          color: Get.isDarkMode
                                              ? TColors.darkFontColor
                                              : TColors.grey2),
                                ),
                              ),
                              SvgPicture.asset(
                                url.iconUrl,
                                fit: BoxFit.cover,
                                height: TSizes.iconMd,
                                width: TSizes.iconMd,
                              )
                            ],
                          ),
                           LineChartSample2(color:banners[2].title==url.title? color:null,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                child: Text(
                                  url.growth,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(
                                          color: Get.isDarkMode
                                              ? TColors.darkFontColor
                                              : TColors.grey2),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  url.percentage,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(
                                          color: Get.isDarkMode
                                              ? TColors.darkFontColor
                                              : TColors.grey2),
                                ),
                              ),
                            ],
                          )
                        ],
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
                  for (int i = 0; i < banners.length; i++)
                    TCircularContainer(
                      width: TSizes.sm,
                      height: TSizes.sm,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                          controller.headerSliderCurrentIndex.value == i
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
      ),
    );
  }
}
