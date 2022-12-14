
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimens.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final Color? color;
  final String? label;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconClick;
  final Function(String?)? onChange;
  final Function(String?)? onFieldSubmitted;


  const CustomTextFormField(
      {Key? key,
      required this.textController,
      required this.hintText,
      this.suffixIcon,
      this.color,
      this.label, this.onSuffixIconClick, this.onChange, this.onFieldSubmitted
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      decoration: InputDecoration(
        filled: true,
        hintStyle:
            TextStyle(color: Theme.of(context).hintColor, fontSize: k12Font),
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: color ?? Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: color ?? Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: color ?? Colors.transparent)),
        suffixIcon: suffixIcon!=null?
           GestureDetector(
              onTap: onSuffixIconClick,
              child: Icon(suffixIcon,color: Theme.of(context).colorScheme.onPrimary,size: 30,))
         : const  SizedBox()
      ),
      onChanged: onChange,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.search,
    );
  }
}
