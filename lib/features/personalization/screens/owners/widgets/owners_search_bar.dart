
import '../../../../../data/services/exporter.dart';
import '../../../../app/controllers/drawers/drawer_controller.dart';
import '../../../../messages/controllers/messages/messages_controller.dart';

class OwnersSearchBar extends StatelessWidget {
  const OwnersSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MessagesController.instance;
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
              flex: 11,
              child: Form(
                child: TextFormField(
                  onEditingComplete: () {
                    controller.showOnlineStatusBar.value = true;
                    controller.expandOnChanged();
                    FocusScope.of(context).unfocus();
                  },
                  //autofocus: true,
                  cursorColor: Get.isDarkMode
                      ? TColors.darkPrimaryBorderColor
                      : TColors.accent,
                  //text: TTexts.searchLabel,
                  decoration: InputDecoration(

                    hintText: TTexts.searchLabel.tr,
                    contentPadding: EdgeInsets.zero,

                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(TSizes.md-2),
                      child: SvgPicture.asset(
                        TImage.searchIcon,
                        height: TSizes.sm,
                        width: TSizes.sm,
                      ),
                    ),
                  ),
                  onTap: () {
                    controller.showOnlineStatusBar.value = false;
                    controller.expandOnChanged();
                  },
                  //padding: EdgeInsets.zero,
                ),
              ),
          ),
          const SizedBox(
            width: TSizes.sm,
          ),

          /// Filter Icon
          Expanded(
            flex: 2,
            child: TRoundedContainer(
              onPressed: () {
                // controller.toggleEndDrawer();
                //controller.openEndDrawer();
                MyDrawerController
                    .instance.ownersScaffoldKey.currentState
                    ?.openEndDrawer();
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
    );
  }
}
