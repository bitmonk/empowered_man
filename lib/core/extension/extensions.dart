import 'package:empowered/constants/app_constant.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

export 'package:empowered/constants/app_colors.dart';
export 'package:empowered/constants/app_constant.dart';
export 'package:empowered/constants/app_endpoints.dart';
export 'package:empowered/core/dio_provider/api_error.dart';
export 'package:empowered/core/routes/app_routes.dart';
export 'package:empowered/enum/the_states.dart';
export 'package:empowered/features/app/app_initializer.dart';
export 'package:empowered/gen/assets.gen.dart';
export 'package:empowered/utlis/app_globals.dart';
export 'package:empowered/utlis/app_text_styles.dart';
export 'package:empowered/utlis/app_utils.dart';
export 'package:empowered/utlis/app_validators.dart';
export 'package:empowered/utlis/app_widget_key.dart';
export 'package:empowered/utlis/navigation_helper.dart';
export 'package:empowered/utlis/uihelper.dart';
export 'package:empowered/utlis/url_launcher_utls.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';

export '../../common/common_extentions.dart';
export '../../constants/app_images.dart';
export './date_extension.dart';

extension ThemeContext on BuildContext {
  double get devicePaddingTop => MediaQuery.of(this).padding.top;
  double get devicePaddingBottom => MediaQuery.of(this).padding.bottom;
  double get viewInsets => MediaQuery.of(this).viewInsets.bottom;
  void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    FocusScope.of(this).unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  String getInitials(String name) {
    var nameParts = name.split(' ');
    var firstNameInitial = '';
    var lastNameInitial = '';

    if (nameParts.isEmpty || name == '') {
      return '';
    } else if (nameParts.length == 1) {
      return firstNameInitial = nameParts[0][0].toUpperCase();
    } else {
      firstNameInitial = nameParts[0][0].toUpperCase();
      lastNameInitial = nameParts.last[0].toUpperCase();

      return firstNameInitial + lastNameInitial;
    }
  }

  String capitalize(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }
}

String engDateAsString(
  String? date, {
  String format = AppConstants.standardDateFormat,
}) {
  return (date == null || date == 'null')
      ? 'N/A'
      : DateFormat(
          format,
        ).format(DateTime.parse(date));
}

String formatString(String input) {
  return input
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');
}
