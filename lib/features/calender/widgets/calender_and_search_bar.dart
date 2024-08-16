import '../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../data/services/exporter.dart';
import '../../../utils/popups/general_popups/calender_popup.dart';
import '../controllers/calender_controller.dart';

class CalenderAndSearchBar extends StatelessWidget {
  const CalenderAndSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CalenderController.instance;
    final dark = Get.isDarkMode;

    List<Widget> myTabs = <Widget>[
      Obx(
        () => TRoundedContainer(
          radius: TSizes.sm,
          height: 32,
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.sm),
          isGradient: controller.isGra1.value,
          showBorder: !controller.isGra1.value,
          backgroundColor: controller.isGra1.value
              ? TColors.white
              : dark
                  ? TColors.blackContainer
                  : TColors.softGrey,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: HorizontalIconText(
              icon: TImage.ribbonMenuIcon,
              iconColor: controller.isGra1.value
                  ? TColors.white
                  : dark
                      ? TColors.darkIconColor
                      : TColors.primary,
              title: "Ribbon",
              isSub: false,
              titleTextStyle: Theme.of(context).textTheme.labelMedium!.apply(
                  color: controller.isGra1.value
                      ? TColors.white
                      : dark
                          ? TColors.darkFontColor
                          : TColors.primary),
            ),
          ),
        ),
      ),
      Obx(
        () => TRoundedContainer(
          radius: TSizes.sm,
          height: 32,
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.sm),
          isGradient: controller.isGra2.value,
          showBorder: !controller.isGra2.value,
          backgroundColor: controller.isGra2.value
              ? TColors.white
              : dark
                  ? TColors.blackContainer
                  : TColors.softGrey,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: HorizontalIconText(
              icon: TImage.listMenuIcon,
              iconColor: controller.isGra2.value
                  ? TColors.white
                  : dark
                      ? TColors.darkIconColor
                      : TColors.primary,
              title: "List",
              isSub: false,
              titleTextStyle: Theme.of(context).textTheme.labelMedium!.apply(
                  color: controller.isGra2.value
                      ? TColors.white
                      : dark
                          ? TColors.darkFontColor
                          : TColors.primary),
            ),
          ),
        ),
      ),
    ];
    return Row(
      children: [
        /// Date and Search tab
        Expanded(
          flex: 5,
          child: Row(
            children: [
              /// Date
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) => CalenderPopUpForm(
                            title: "Month",
                            subTitle: "",
                            buttonText: "Select",
                            onPressed: () {
                              Get.back();
                            },
                          )),
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    height: 32,
                    margin: const EdgeInsetsDirectional.symmetric(
                        horizontal: TSizes.sm),
                    backgroundColor:
                        dark ? TColors.blackContainer : TColors.softGrey,
                    padding: const EdgeInsetsDirectional.all(TSizes.sm),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "April 2024",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(
                                    color: dark
                                        ? TColors.darkFontColor
                                        : TColors.primary),
                          ),
                          SvgPicture.asset(
                            TImage.arrowDownIcon,
                            height: TSizes.iconSm,
                            width: TSizes.iconSm,
                            colorFilter: ColorFilter.mode(
                                dark ? TColors.darkIconColor : TColors.primary,
                                BlendMode.srcIn),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// Search
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 32,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: TTexts.searchLabel.tr,
                        hintStyle: Theme.of(context).textTheme.labelSmall,
                        prefixIconColor:
                            dark ? TColors.darkIconColor : TColors.primary,
                        prefixIconConstraints:
                            const BoxConstraints(maxWidth: 32),
                        prefixIcon: Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: TSizes.sm),
                          child: SvgPicture.asset(
                            TImage.searchIcon,
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),

        const Expanded(flex: 1, child: SizedBox()),

        /// Tab bar
        Expanded(
          flex: 3,
          child: TabBar(
            onTap: (val) {
              controller.currentPageIndex.value = val;
              controller.tabBarButtonClicked(val);
            },
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: const EdgeInsetsDirectional.only(end: TSizes.sm),
            indicator: const BoxDecoration(color: Colors.transparent),
            tabs: myTabs,
          ),
        ),
      ],
    );
  }
}
