
import '../../../../common/widgets/custom_shapes/containers/property_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../data/services/exporter.dart';
import '../../controllers/drawers/drawer_controller.dart';
import '../drawers/home/home_screen_search_end_drawer_filter_menu.dart';
import '../property_details/property_details_screen.dart';
import 'widgets/see_all_properties_or_after_search_app_bar.dart';

class SeeAllPropertiesOrAfterSearchScreen extends StatelessWidget {
  const SeeAllPropertiesOrAfterSearchScreen(
      {super.key, this.ignoreAppBar = false, this.mainScreen=false});

  final bool ignoreAppBar,mainScreen;

  @override
  Widget build(BuildContext context) {
    List<String> properties = [
      TImage.property,
      TImage.property1,
      TImage.property2,
      TImage.property3,
      TImage.property4,
      TImage.property5,
      TImage.property6,
    ];

    Rx<bool> isExpanded = false.obs;
    return Scaffold(
      key: MyDrawerController.instance.searchScaffoldKey,
      resizeToAvoidBottomInset: false,
      endDrawer: Drawer(
        shape: InputBorder.none,
        width: TDeviceUtils.getScreenWidth(context) * 0.50,
        child: const HomeScreenSearchEndDrawerFilter(),
      ),
      body: BackgroundImageContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NetworkCheckerContainer(),

              /// App Bar
              ignoreAppBar
                  ? const SizedBox()
                  : const SeeAllPropertiesOrAfterSearchAppBar(),

              ignoreAppBar
                  ? const SizedBox()
                  :Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: TSearchContainer(
                  text: TTexts.searchLabel.tr,
                  isTextField: true,
                ),
              ),

              ignoreAppBar
                  ? const SizedBox()
                  :  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.md,vertical: TSizes.sm),
                      child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text("32 ${TTexts.resultsLabel.tr} ${TTexts.foundLabel.tr}")),
                    ),
              const SizedBox(
                height: TSizes.sm,
              ),

              /// Search and Filter row
              mainScreen?Column(
                children: [
                  Padding(
                    padding: TSpacingStyle.paddingWithAppBarHeight2,
                    child: const MainScreensAppBar(leadingIcon: TImage.propertiesIcon1, title: "Properties"),
                  ),
                  Padding(
                    padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: TSizes.sm),
                    child: SizedBox(
                      height: 48,
                      child: Row(
                        children: [
                          const Expanded(
                              flex: 11,
                              child: TSearchContainer(
                                text: "Search your keyword here...",
                                padding: EdgeInsets.zero,
                                isTextField: true,
                              )),
                          const SizedBox(
                            width: TSizes.sm,
                          ),

                          /// Filter Icon
                          Expanded(
                            flex: 2,
                            child: TRoundedContainer(
                              onPressed: (){
                                // controller.toggleEndDrawer();
                                //MyDrawerController.instance.homeScaffoldKey.openEndDrawer();
                                 MyDrawerController.instance.homeScaffoldKey.currentState?.openEndDrawer();
                              },
                              padding: const EdgeInsets.all(TSizes.md - 2),
                              backgroundColor: Get.isDarkMode
                                  ? TColors.blackContainer
                                  : TColors.light,
                              isGradient: false,
                              showBorder: true,
                              radius: TSizes.sm,
                              width: TSizes.iconLg,
                              height: 44,
                              child: SvgPicture.asset(
                                TImage.filterIcon,
                                colorFilter: ColorFilter.mode(
                                    Get.isDarkMode
                                        ? TColors.darkIconColor
                                        : TColors.lightIconColor,
                                    BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                 ignoreAppBar?const SizedBox(
                   height: TSizes.md,
                 ): Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.md,vertical: TSizes.sm),
                    child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("32 ${TTexts.resultsLabel.tr} ${TTexts.foundLabel.tr}")),
                  ),
                ],
              ):const SizedBox(),

              /// Property list
              SizedBox(
                width: double.infinity,
                //height: 120,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: properties.length,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsetsDirectional.only(end: TSizes.sm),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () => Get.to(() => const PropertyDetailScreen()),
                      child: PropertyWidget(
                        propertyImage: properties[index],
                        index: index,
                        isFav: false.obs,com: false.obs, isApproved: false.obs,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
