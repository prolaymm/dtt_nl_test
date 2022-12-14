import 'package:d_tt_nl_code_test/core/vos/house_vos.dart';
import 'package:d_tt_nl_code_test/utils/api_route.dart';
import 'package:d_tt_nl_code_test/utils/dimens.dart';
import 'package:flutter/material.dart';

import '../../widget/custom_cache_network_image.dart';
import 'detail_container_with_info.dart';
import 'package:get/get.dart';

class HouseDetailScreen extends StatelessWidget {
  const HouseDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    HouseVo houseVo = Get.arguments;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
           SizedBox(
              height: 180,
              width: double.infinity,
              child: CustomCacheNetworkImage(
                imageUrl:
                    apiBaseUrl+houseVo.image!,
                height: 200,
                radius: 0,
                boxFit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
                top: 30,
                left: kPadding12,
                child: GestureDetector(
                    onTap: () => Get.back(),
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 30,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        )))),
             Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 160,
                child: DetailContainerWithInfo(houseVo : houseVo))
          ],
        ),
      ),
    );
  }
}
