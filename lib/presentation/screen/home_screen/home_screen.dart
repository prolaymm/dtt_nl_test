import 'package:d_tt_nl_code_test/presentation/route/app_route_name.dart';
import 'package:d_tt_nl_code_test/presentation/widget/house_specification_info_with_icon.dart';
import 'package:d_tt_nl_code_test/presentation/widget/row_icon_text.dart';
import 'package:d_tt_nl_code_test/presentation/widget/custom_cache_network_image.dart';
import 'package:d_tt_nl_code_test/presentation/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/api_route.dart';
import '../../../utils/dimens.dart';
import '../../../view_model/home_view_model.dart';
import '../../widget/simple_app_bar.dart';
import '../../widget/text_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeVm = Get.find<HomeViewModel>();
    final textController = TextEditingController();
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'DTT REAL ESTATE',

      ),
      body: RefreshIndicator(
        onRefresh: () => homeVm.fetchHouseDataFromServer(),
        child: Obx(
          () => homeVm.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : homeVm.isError.isTrue
                  ? TextView(text: homeVm.message.value)
                  : homeVm.mHouseList.isEmpty
                      ? const TextView(text: "No House Data")
                      : Column(
                          children: [
                            const SizedBox(
                              height: kPadding12,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kPadding16),
                              child: CustomTextFormField(
                                textController: textController,
                                hintText: "Search",
                                suffixIcon: Icons.search,
                              ),
                            ),
                            Flexible(
                              child: ListView.builder(
                                  itemCount: homeVm.mHouseList.length,
                                  itemBuilder: (_, position) {
                                    return GestureDetector(
                                      onTap: ()=> Get.toNamed(AppRouteName.rHouseDetail),
                                      child: Container(
                                        height: 110,
                                        margin: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 6,
                                            left: kPadding16,
                                            right: kPadding16),
                                        padding:
                                            const EdgeInsets.all(kPadding12),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .shadow,
                                                spreadRadius: 4,
                                                blurRadius: 4,
                                              )
                                            ]),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 80,
                                              width: 80,
                                              child: CustomCacheNetworkImage(
                                                  imageUrl: apiBaseUrl +
                                                      homeVm
                                                          .mHouseList[position]
                                                          .image!,
                                                  height: 100,
                                                  radius: 12,
                                                  boxFit: BoxFit.cover,
                                                  width: 100),
                                            ),
                                            const SizedBox(
                                              width: kPadding12,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextView(
                                                  text:
                                                      "\$${homeVm.mHouseList[position].price}",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: k16Font,
                                                ),
                                                TextView(
                                                  text:
                                                      "${homeVm.mHouseList[position].zip} ${homeVm.mHouseList[position].city}",
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  fontSize: k14Font,
                                                ),
                                                const Spacer(),
                                                Flexible(
                                                  child: HouseSpecificationInfoWithIcon(bedrooms:homeVm.mHouseList[position].bedrooms,
                                                  size: homeVm.mHouseList[position].size,
                                                    bathrooms: homeVm.mHouseList[position].bathrooms,
                                                    distance: homeVm.mHouseList[position].distance,
                                                  )

                                                  /*Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      RowIconText(
                                                        title:
                                                            "${homeVm.mHouseList[position].bedrooms}",
                                                        icon:
                                                            "assets/icons/ic_bed.svg",
                                                      ),
                                                      RowIconText(
                                                        title:
                                                            "${homeVm.mHouseList[position].bathrooms}",
                                                        icon:
                                                            "assets/icons/ic_bath.svg",
                                                      ),
                                                      RowIconText(
                                                        title:
                                                            "${homeVm.mHouseList[position].size}",
                                                        icon:
                                                            "assets/icons/ic_layers.svg",
                                                      ),
                                                      RowIconText(
                                                        title:
                                                            "${homeVm.mHouseList[position].latitude}",
                                                        icon:
                                                            "assets/icons/ic_location.svg",
                                                      ),
                                                    ],
                                                  ),*/
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
        ),
      ),
    );
  }
}
