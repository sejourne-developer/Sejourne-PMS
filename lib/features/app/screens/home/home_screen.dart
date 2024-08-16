import '../../../../data/services/exporter.dart';
import '../../models/reservation_model.dart';
import 'widgets/approval_slider.dart';
import 'widgets/home_header.dart';
import 'widgets/reservations_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReservationModel reservationModel = ReservationModel(
        total: "6",
        title: "Check-ins Today",
        referenceNumberAndType: "Booking #  SJ1052124",
        imageUrl: TImage.user8,
        userName: "Alexander  Maryukov",
        location: "Studio (804) at Dubai Arch (JLT)",
        checkInDate: "17.06.2024",
        checkOutDate: "26.06.2024",
        price: "950",
        revenue: "48,800",
        nights: "9");
    ReservationModel reservationModel2 = ReservationModel(
        total: "6",
        title: "Check-ins Today",
        referenceNumberAndType: "Booking #  SJ1052123",
        imageUrl: TImage.user11,
        userName: "Dinkar  Notani",
        location: "1BR (212C) at Diamond Views 3 (JVC )",
        checkInDate: "20.06.2024",
        checkOutDate: "30.06.2024",
        price: "1,800",
        revenue: "56,000",
        nights: "10");
    ReservationModel reservationModel3 = ReservationModel(
        total: "6",
        title: "Check-ins Today",
        referenceNumberAndType: "Booking #  SJ1052125",
        imageUrl: TImage.user5,
        userName: "Catalin Pustai",
        location: "Studio (806) at Dubai Arch (JLT)",
        checkInDate: "20.06.2024",
        checkOutDate: "30.06.2024",
        price: "1,800",
        revenue: "56,000",
        nights: "10");
    return Scaffold(
      body: BackgroundImageContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: TSizes.sm),
                child: Text(
                  "Reservations in April 2024",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const SizedBox(
                height: TSizes.md,
              ),
              ReservationSlider(
                title: const [
                  "Check-ins Today",
                  "Check-Outs Today",
                ],
                banners: [
                  reservationModel,
                  reservationModel2,
                  reservationModel3,
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(TSizes.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        TRoundedContainer(
                          showBorder: false,
                          height: TSizes.md,
                          width: TSizes.md,
                          radius: TSizes.xs,
                          backgroundColor:
                              Get.isDarkMode ? TColors.dark : TColors.primary,
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                "12",
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
                              "Properties for Approval",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(
                                      color: Get.isDarkMode
                                          ? TColors.darkFontColor
                                          : TColors.primary),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                            color: Get.isDarkMode
                                ? TColors.darkFontColor
                                : TColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const ApprovalSlider(banners: [
                TImage.prop1,
                TImage.prop2,
                TImage.prop3,
                TImage.prop4,
                TImage.prop5,
                TImage.prop6,
                TImage.prop7,
                TImage.prop8,
                TImage.prop9,
                TImage.prop10,
                TImage.prop11,
                TImage.prop12,
                TImage.prop13,
                TImage.prop14,
                TImage.prop15,
              ]),
              const SizedBox(
                height: TSizes.spaceBtwSections * 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
