import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/shared/app_colors.dart';

class AppSnackBar {
  static Flushbar? _flushbar;

  static Future showError({
    required String message,
    required BuildContext context,
    duration = const Duration(seconds: 5),
  }) async {
    if (_flushbar != null && _flushbar!.isShowing()) {
      await _flushbar!.dismiss();
    }

    _flushbar = Flushbar(
      message: message,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(30),
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundColor: Colors.red,
      duration: duration,
    );
    return _flushbar!.show(context);
  }

  static Future showSuccess({
    required String message,
    required BuildContext context,
    Function(Flushbar<dynamic>)? onTap,
    bool sound = false,
    duration = const Duration(seconds: 3),
    VoidCallback? onClose,
  }) async {
    if (_flushbar != null && _flushbar!.isShowing()) {
      await _flushbar!.dismiss();
    }

    _flushbar = Flushbar(
      onTap: onTap,
      messageText: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
          InkWell(
            onTap: onClose,
            child: const Icon(
              Icons.close,
              color: AppColors.white,
            ),
          )
        ],
      ),
      margin: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(30),
      flushbarPosition: FlushbarPosition.TOP,
      // icon: Image.asset("assets/images/app_icon.png"),
      backgroundColor: AppColors.green600,
      duration: duration,
    );
    return _flushbar!.show(context);
  }
}
