import 'package:flutter/foundation.dart';
import 'package:sejourne_pms/features/app/models/chart_model.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../data/services/exporter.dart';
import '../../../../../utils/popups/general_popups/calender_popup.dart';
import '../../../../notifications/screens/notification/notification.dart';
import '../../../controllers/drawers/drawer_controller.dart';
import '../../../controllers/home/home_controller.dart';
import 'header_cart_slider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(MyDrawerController());
    Get.put(HomeController());
    var dark = THelperFunctions.isDarkMode(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: TDeviceUtils.getScreenHeight() * 0.34,
        minHeight: 56,
      ),
      child: Stack(
        children: [
          TRoundedContainer(
            margin: EdgeInsets.only(
                top: TDeviceUtils.getAppBarHeight(),
                right: TSizes.sm,
                left: TSizes.sm),
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.md, vertical: TSizes.sm),
            gradient: dark ? TColors.darkLinerGradient : TColors.linerGradient,
            isGradient: true,
            height: TDeviceUtils.getScreenHeight() * 0.14,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Menu Icon
                    TCircularIcon(
                      icon: TImage.menuIcon,
                      onPressed: () {
                        MyDrawerController.instance.homeScaffoldKey.currentState
                            ?.openDrawer();
                        //controller.toggleDrawer();
                      },
                    ),
                    const SizedBox(
                      width: TSizes.md,
                    ),

                    /// Location And Drop Down Menu Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Location Label
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text("Month",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(
                                      color: dark
                                          ? TColors.darkFontColor
                                          : TColors.white)),
                        ),

                        /// Locations menu in bottom sheet
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  if (kDebugMode) {
                                    print("object");
                                  }
                                  return CalenderPopUpForm(
                                    title: "",
                                    subTitle: "",
                                    onPressed: () {
                                      Get.back();
                                    },
                                    buttonText: "Save",
                                  );
                                });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// Icon
                              SvgPicture.asset(
                                TImage.searchBookingIcon,
                                width: TSizes.iconXs,
                                height: TSizes.iconXs,
                                colorFilter: ColorFilter.mode(
                                    dark
                                        ? TColors.darkIconColor
                                        : TColors.white,
                                    BlendMode.srcIn),
                              ),
                              const SizedBox(
                                width: TSizes.xs,
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    minWidth: 0,
                                    maxWidth:
                                        TDeviceUtils.getScreenWidth(context) *
                                            0.25),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    HomeController.instance.selectedMonth.value,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(
                                            color: dark
                                                ? TColors.darkFontColor
                                                : TColors.white),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: TSizes.xs,
                              ),
                              SvgPicture.asset(
                                TImage.arrowDownIcon,
                                height: TSizes.iconSm,
                                width: TSizes.iconSm,
                                colorFilter: ColorFilter.mode(
                                    dark
                                        ? TColors.darkIconColor
                                        : TColors.white,
                                    BlendMode.srcIn),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                /// notification Icons
                TCircularIcon(
                  icon: TImage.notificationIcon,
                  onPressed: () => Get.to(() => const NotificationScreen()),
                ),
              ],
            ),
          ),
          HeaderChartSlider(
            color: const [Colors.red,Colors.redAccent],
              banners: [
            ChartModel(
                total: "487,367.77",
                title: "Revenue Jan",
                iconUrl: TImage.propertiesIcon1,
                growth: "Growth current Month",
                percentage: "80%"),
            ChartModel(
                total: "94",
                title: "Reservation",
                iconUrl: TImage.calenderIcon,
                growth: "Inquiries Growth",
                percentage: "40%"),
            ChartModel(
                total: "74",
                title: "Active Listings",
                iconUrl: TImage.propertiesIcon1,
                growth: "This Year New Listing",
                percentage: "74"),
          ])
        ],
      ),
    );
  }
}
