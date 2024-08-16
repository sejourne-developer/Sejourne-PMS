import 'package:sejourne_pms/common/widgets/layouts/grid_layout.dart';

import '../../../../data/services/exporter.dart';
import '../../../../features/app/screens/home/widgets/icon_text_widget.dart';
import '../../../common/widgets/icons/circular_icon.dart';


class Property extends StatelessWidget {
  const Property({
    super.key,
    required this.propertyImage,

    this.onPressed,
    this.margin = const EdgeInsetsDirectional.only(start: TSizes.sm),
  });

  final String propertyImage;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TRoundedContainer(
          onPressed: onPressed,
          height: 140,
          showBorder: true,
          isGradient: false,
          padding: EdgeInsets.zero,
          margin: margin,
          shadow: TShadowStyle.containerShadow,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(TSizes.md - 2),
                      bottomStart: Radius.circular(TSizes.md)),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage(propertyImage),
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: TDeviceUtils.getScreenWidth(context) * 0.50,
                      ),
                      Positioned(
                          left: TSizes.sm,
                          top: TSizes.sm,
                          child: TRoundedContainer(
                            isGradient: true,
                            showBorder: false,
                            padding: const EdgeInsets.all(TSizes.xs),
                            child: Text(
                              '1BR, Apartment',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .apply(color: TColors.white),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 4,),
              Expanded(
                  flex: 6,
                  child: ClipRRect(
                    borderRadius: const BorderRadiusDirectional.only(
                        topEnd: Radius.circular(TSizes.md ),
                        bottomEnd: Radius.circular(TSizes.md)),
                    child: TGridLayout(
                      itemCount: 4,
                      crossAxisCount: 2,
                      mainAxisExtent: 70,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      itemBuilder: (_, index) => Image.asset(propertyImage,fit: BoxFit.cover,),
                    ),
                  )),
            ],
          ),
        ),

      ],
    );
  }
}
