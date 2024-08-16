import '../../../common/widgets/custom_shapes/containers/booking_user_container.dart';
import '../../../common/widgets/layouts/list_layout.dart';
import '../../../data/services/exporter.dart';

class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> properties = [
      TImage.user3,
      TImage.user1,
      TImage.user2,
      TImage.user2,
      TImage.user4,
      TImage.user5,
      TImage.user3,
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            top: TSizes.md,
            start: TSizes.sm,
            end: TSizes.sm,
            bottom: TDeviceUtils.getBottomNavigationBarHeight() * 1.5),
        child: ListLayout(
            itemCount: 3,
            padding: EdgeInsets.zero,
            separatorHeight: TSizes.md,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        index == 0
                            ? "17 April 2024"
                            : index == 1
                                ? "18 April 2024"
                                : "19 April 2024",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: Get.isDarkMode
                                ? TColors.darkFontColor
                                : TColors.primary),
                      ),
                      Flexible(
                        flex: 8,
                        child: Row(
                          children: List.generate(
                            150 ~/ 2,
                            (index) => Expanded(
                              child: Container(
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    : Get.isDarkMode
                                        ? TColors.grey2
                                        : TColors.primary,
                                height: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        index == 0
                            ? "MON"
                            : index == 1
                                ? "TUS"
                                : "WEN".toUpperCase(),
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: Get.isDarkMode
                                  ? TColors.darkFontColor
                                  : TColors.primary,
                            ),
                      )
                    ],
                  ),
                  ListLayout(
                      padding: EdgeInsets.zero,
                      itemBuilder: (_, index) => BookingUserContainer(
                            propertyImage: properties[index],
                            index: index,
                            isSlide: true,
                          ),
                      itemCount: 7),
                ],
              );
            }),
      ),
    );
  }
}
