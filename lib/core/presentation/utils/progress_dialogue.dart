import 'package:flutter/material.dart';
import 'package:health_goody/core/presentation/utils/theme.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class CustomProgressDialog {
  final BuildContext context;
  ProgressDialog? _progressDialog;

  CustomProgressDialog(this.context);

  void show({required String title, required String message}) {
    _progressDialog = ProgressDialog(
      context,
      type: ProgressDialogType.normal,
      isDismissible: false,
    );
    _progressDialog?.style(
      backgroundColor: appColors.screenBg,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      message: message,
      widgetAboveTheDialog: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
      progressWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: appColors.rainbowColors,
          strokeWidth: 2,
          pathBackgroundColor: appColors.screenBg,
        ),
      ),
      progressTextStyle: Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(fontWeight: FontWeight.w400),
      messageTextStyle: Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(fontWeight: FontWeight.w400),
    );
    _progressDialog?.show();
  }

  void hide() {
    if (_progressDialog?.isShowing() ?? false) {
      _progressDialog?.hide();
    }
  }
}
