import 'package:d_tt_nl_code_test/presentation/widget/text_view.dart';
import 'package:d_tt_nl_code_test/utils/dimens.dart';
import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool? isBack;
  final bool? isCenterTitle;

  const SimpleAppBar(
      {Key? key, required this.title, this.isBack, this.isCenterTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextView(
        text: title,
        fontSize: k20Font,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: isCenterTitle ?? false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(58);
}
