import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/IconTextFiled.dart';
import 'package:base_flutter/general/constants/Inputs/InkWellTextField.dart';
import 'package:base_flutter/general/constants/Inputs/LabelTextField.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/localization/LocalizationMethods.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';
import 'package:base_flutter/general/widgets/AnimationContainer.dart';
import 'package:base_flutter/general/widgets/DefaultButton.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:base_flutter/res.dart';
import 'package:base_flutter/user/models/DropdownModel.dart';
import 'package:base_flutter/user/models/Dtos/FilterModel.dart';
import 'package:base_flutter/user/models/OrderModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';
import '../HomeMainImports.dart';


part 'BuildFilterView.dart';
part 'BuildOrderItem.dart';
part 'BuildSearchForm.dart';
