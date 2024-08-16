import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../data/services/exporter.dart';
import '../../../app/controllers/drawers/drawer_controller.dart';
import '../../models/owners_model.dart';
import 'widgets/owners_container.dart';
import 'widgets/owners_search_bar.dart';

class OwnersScreen extends StatelessWidget {
  const OwnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<OwnersModel> owner = [
      OwnersModel(
          imageUrl: TImage.businessMan1,
          userName: "Aksoy Omer",
          location: "Internet City, Dubai.",
          email: "owner@sejourne.ae",
          phone: "+971 1234 56789",
          propertyNum: "4",
          totalEarning: "321,234 AED"),
      OwnersModel(
          imageUrl: TImage.businessMan2,
          userName: "Aleksandr Zelentsov",
          location: "Dubai Marina, Dubai.",
          email: "owner@sejourne.ae",
          phone: "+971 1234 56789",
          propertyNum: "5",
          totalEarning: "400,234 AED"),
      OwnersModel(
          imageUrl: TImage.businessMan3,
          userName: "Dmitrii Tsyganok",
          location: "Business Bay, Dubai.",
          email: "owner@sejourne.ae",
          phone: "+971 1234 56789",
          propertyNum: "2",
          totalEarning: "260,234 AED"),
      OwnersModel(
          imageUrl: TImage.businessMan4,
          userName: "Elena Urban",
          location: "Down Town, Dubai.",
          email: "owner@sejourne.ae",
          phone: "+971 1234 56789",
          propertyNum: "11",
          totalEarning: "1,056,234 AED"),
      OwnersModel(
          imageUrl: TImage.businessMan5,
          userName: "Galina Bagaeva",
          location: "Dubai Hills, Dubai.",
          email: "owner@sejourne.ae",
          phone: "+971 1234 56789",
          propertyNum: "8",
          totalEarning: "605,234 AED"),
    ];
    return BackgroundImageContainer(
        child: Scaffold(
      key: MyDrawerController.instance.ownersScaffoldKey,
      endDrawer: Drawer(
          shape: InputBorder.none,
          width: TDeviceUtils.getScreenWidth(context) * 0.50,
          child: const SizedBox()),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// App bar
              TAppBar(
                actions: [Container()],
                leadingIcon: TImage.backArrow,
                title: const Text("Owners"),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              const OwnersSearchBar(),

              ListLayout(
                  separatorHeight: TSizes.md,
                  itemBuilder: (_, index) => GestureDetector(
                        //onTap: () => Get.to(onPressed[index]),
                        child:  OwnersContainer(
                          imageUrl: owner[index].imageUrl,
                          userName: owner[index].userName,
                          location: owner[index].location,
                          email: owner[index].email,
                          phone: owner[index].phone,
                          propertyNum: owner[index].propertyNum,
                          totalEarning: owner[index].totalEarning,
                        ),
                      ),
                  itemCount: owner.length),
            ],
          ),
        ),
      ),
    ));
  }
}
