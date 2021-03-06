import 'package:animations/animations.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/ModaLs/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/localization/LocalizationMethods.dart';
import 'package:base_flutter/general/utilities/utils_functions/AdaptivePicker.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/user/models/DropdownModel.dart';
import 'package:base_flutter/user/models/Dtos/FilterModel.dart';
import 'package:base_flutter/user/models/OrderModel.dart';
import 'package:base_flutter/user/models/PropertyOrderModel.dart';
import 'package:base_flutter/user/resources/UserRepository.dart';
import 'package:base_flutter/user/widgets/BuildNoItemFound.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'widgets/HomeMainWidgetsImports.dart';


part 'HomeMain.dart';
part 'HomeMainData.dart';