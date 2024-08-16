import 'package:sejourne_pms/features/calender/widgets/list_tab.dart';
import 'package:sejourne_pms/features/calender/widgets/ribbon_tab.dart';

import '../../data/services/exporter.dart';
import 'controllers/calender_controller.dart';
import 'widgets/calender_and_search_bar.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CalenderController.instance;
    return DefaultTabController(
      initialIndex: controller.currentPageIndex.value,
      length: 2,
      child: BackgroundImageContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const MainScreensAppBar(
                leadingIcon: TImage.searchBookingIcon, title: "Calender"),
            bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(TDeviceUtils.getAppBarHeight() / 2),
                child: const CalenderAndSearchBar()),
          ),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                RibbonTab(
                  bookings: controller.bookings,
                ),
                const ListTab()
              ]),
        ),
      ),
    );
  }
}
