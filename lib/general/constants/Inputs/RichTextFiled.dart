import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CustomInputDecoration.dart';
import 'CustomInputTextStyle.dart';

class RichTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final EdgeInsets margin;
  final TextInputType? type;
  final max;
  final Function(String? value) validate;
  final Color? fillColor;
  final bool readOnly;
  final TextInputAction? action;
  final Function(String value)? submit;
  final Color? borderColor;

  RichTextFiled(
      {this.label,
      this.hint,
      this.borderColor,
      this.controller,
      this.margin = const EdgeInsets.all(0),
      this.type,
      required this.max,
      required this.validate,
      this.fillColor,
      this.readOnly = false,
      this.action,
      this.submit});

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      margin: margin,
      child: TextFormField(
        controller: controller,
        keyboardType: type ?? TextInputType.multiline,
        textInputAction: action ?? TextInputAction.newline,
        onFieldSubmitted: submit,
        maxLines: max,
        readOnly: readOnly,
        validator: (value) => validate(value),
        style: CustomInputTextStyle(lang: lang),
        decoration: CustomInputDecoration(
          lang: lang,
          label: label,
          filledColor: fillColor,
          hint: hint,
          enableColor: borderColor??MyColors.greyWhite
        ),
      ),
    );
  }
}
