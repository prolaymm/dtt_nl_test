import 'package:d_tt_nl_code_test/presentation/widget/row_icon_text.dart';
import 'package:flutter/material.dart';

class HouseSpecificationInfoWithIcon extends StatelessWidget {

  final int? bedrooms;
  final int? bathrooms;
  final int? size;
  final double? distance;
  const HouseSpecificationInfoWithIcon({Key? key, this.bedrooms, this.bathrooms, this.size, this.distance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment
          .spaceBetween,
      children: [
        RowIconText(
          title:
          "$bedrooms",
          icon:
          "assets/icons/ic_bed.svg",
        ),
        RowIconText(
          title:
          "$bathrooms",
          icon:
          "assets/icons/ic_bath.svg",
        ),
        RowIconText(
          title:
          "$size",
          icon:
          "assets/icons/ic_layers.svg",
        ),
        RowIconText(
          title:
          "${distance}Km",
          icon:
          "assets/icons/ic_location.svg",
        ),
      ],
    );
  }
}
