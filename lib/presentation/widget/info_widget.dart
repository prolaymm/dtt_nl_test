import 'package:d_tt_nl_code_test/presentation/widget/custom_material_button.dart';
import 'package:d_tt_nl_code_test/presentation/widget/text_view.dart';
import 'package:d_tt_nl_code_test/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InfoWidget extends StatelessWidget {
  final String? image;
  final String? lottieFile;
  final bool? isLottie;
  final String? title;
  final Color? textColor;
  final double? fontSize;
  final VoidCallback? onClick;
  final bool? isButton;
  final String? buttonText;

  const InfoWidget(
      {Key? key,
      this.image,
      this.lottieFile,
      this.isLottie,
      required this.title,
      this.textColor,
      this.fontSize,
      this.onClick,
      this.isButton, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kPadding14),
    ///  color: Theme.of(context).colorScheme.primaryContainer,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: isLottie ?? false
                ? Lottie.asset(lottieFile!)
                : Image.asset(
                    image!,
                    fit: BoxFit.contain,
                  ),
          ),
          const SizedBox(
            height: kPadding16,
          ),
          TextView(
            text: title ?? "",
            color: textColor,
            fontSize: fontSize ?? k14Font,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: kPadding16,
          ),

           if(isButton == true) SizedBox(
              width: 120,
              child: CustomMaterialButton(
                radius: 100,
                title: buttonText??"",
                onClick: onClick!,
                textColor: Theme.of(context).textTheme.bodyText1!.color,
                buttonColor: Theme.of(context).errorColor,
              ),
            ),
        ],
      ),
    );
  }
}
