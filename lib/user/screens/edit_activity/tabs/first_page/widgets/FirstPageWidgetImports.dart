import 'dart:io';

import 'package:base_flutter/general/blocks/cats_cubit/cats_cubit.dart';
import 'package:base_flutter/general/blocks/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/general/constants/Inputs/DropdownTextField.dart';
import 'package:base_flutter/general/constants/Inputs/LabelTextField.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/localization/LocalizationMethods.dart';
import 'package:base_flutter/general/utilities/validator/Validator.dart';
import 'package:base_flutter/general/widgets/CachedImage.dart';
import 'package:base_flutter/general/widgets/DefaultButton.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:base_flutter/user/models/CityModel.dart';
import 'package:base_flutter/user/models/Dtos/EditActivityImgModel.dart';
import 'package:base_flutter/user/models/PropertyModel.dart';
import 'package:base_flutter/user/resources/UserRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../FirstPageImports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../EditActivityImports.dart';


part 'BuildHeaderColor.dart';
part 'BuildTypesView.dart';
part 'BuildImagesView.dart';
part 'BuildFormView.dart';
part 'BuildActionView.dart';
part 'BuildNormalImages.dart';