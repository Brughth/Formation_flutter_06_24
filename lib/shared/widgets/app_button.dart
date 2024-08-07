import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/shared/context_extensions.dart';

import '../app_colors.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? bgColor;
  final Color? borderColor;
  final bool enable;
  final bool haveTop;
  final bool loading;
  final Color? loadingColor;
  final double height;
  final String? text;
  final Color? textColor;
  final double? textFontSize;

  const AppButton({
    Key? key,
    this.child,
    this.onPressed,
    this.enable = true,
    this.bgColor,
    this.borderColor,
    this.loading = false,
    this.haveTop = true,
    this.height = 50.0,
    this.loadingColor,
    this.text,
    this.textColor,
    this.textFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: enable ? bgColor : bgColor?.withOpacity(.6),
            border: borderColor != null
                ? Border.all(
                    color: borderColor!,
                    width: 1.5,
                  )
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap:
                  (!loading && enable && onPressed != null) ? onPressed : null,
              borderRadius: BorderRadius.circular(11),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Opacity(
                  opacity: loading ? 0 : 1,
                  child: text != null
                      ? Text(
                          text!,
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: textColor != null
                                ? textColor!
                                : bgColor == AppColors.primary
                                    ? AppColors.gray50
                                    : AppColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: textFontSize,
                          ),
                        )
                      : child,
                ),
              ),
            ),
          ),
        ),
        loading == false
            ? Container()
            : Positioned.fill(
                child: Center(
                  child: CupertinoTheme(
                    data: CupertinoTheme.of(context).copyWith(
                      brightness: bgColor == AppColors.primary
                          ? Brightness.dark
                          : Brightness.light,
                    ),
                    child: CupertinoActivityIndicator(
                      radius: 16,
                      color: loadingColor,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
