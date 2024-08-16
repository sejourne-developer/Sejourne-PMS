import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/text_strings.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: TSizes.buttonHeight,
          child: OutlinedButton(
            onPressed: () => controller.googleSignIn(),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    TImage.google,
                    height: TSizes.iconMd,
                    width: TSizes.iconMd,
                  ),
                  const SizedBox(
                    width: TSizes.sm,
                  ),
                  SizedBox(
                      child: Text(
                    TTexts.continueWithGoogle.tr,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ),
            ),
          ),
        ),


      ],
    );
  }
}
