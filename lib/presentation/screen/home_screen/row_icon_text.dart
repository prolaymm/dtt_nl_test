import 'package:d_tt_nl_code_test/presentation/widget/text_view.dart';
import 'package:d_tt_nl_code_test/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RowIconText extends StatelessWidget {

  final String icon;
  final String title;
  const RowIconText({Key? key, required this.icon,
    required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Row(
        children: [

          SvgPicture.asset(icon,color: Theme.of(context).hintColor,height: 20,width: 20,),
         const  SizedBox(
            width: 3,
          ),
          TextView(text: title,color: Theme.of(context).hintColor,fontSize: k12Font,)
        ],
      ),
    );
  }
}
