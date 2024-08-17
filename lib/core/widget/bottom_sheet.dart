import 'package:flutter/material.dart';
import 'package:hamdars/core/utils/styling/color.dart';

class BottomSheetWidget {
  final bool hasHeader;

  BottomSheetWidget({
    this.hasHeader = true,
  });

  static TextStyle titleStyle = const TextStyle(
    fontSize: 16,
    // color: darkColor,
    fontWeight: FontWeight.bold,
    height: 1.75,
  );
  static TextStyle itemBoldStyle = const TextStyle(
    fontSize: 14,
    // color: darkColor,
    fontWeight: FontWeight.bold,
  );
  static TextStyle itemStyle = const TextStyle(
    fontSize: 14,
    // color: darkColor,
  );

  static TextStyle descriptionStyle = const TextStyle(
    fontSize: 13,
    // color: c_100Color,
    height: 1.75,
  );

  static TextStyle contentStyle = const TextStyle(
    fontSize: 14,
    // color: darkColor,
  );

  static TextStyle contentBoldStyle = const TextStyle(
    fontSize: 14,
    // color: darkColor,
    fontWeight: FontWeight.bold,
  );

  void show(
    final BuildContext context,
    final String? title,
    final Widget content, {
    final IconData? iconClose,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: whiteColor1,
      isScrollControlled: true,
      isDismissible: true,
      // if dismissible false -- drag_and_drop not worked!
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      builder: (final BuildContext context) => PopScope(
        onPopInvokedWithResult: (
          final bool didPop,
          final Object? result,
        ) async =>
            Future(() => true),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: bottomSheetContent(
              context,
              title,
              content,
              // action: action,
              icon: iconClose,
            ),
          ),
        ),
      ),
    );
  }

  Widget dismissibleIndicator() => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          width: 32,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xc8b9b6be),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );

  Widget bottomSheetContent(
    final BuildContext context,
    final String? title,
    final Widget content, {
    // Widget? action,
    final IconData? icon,
  }) =>
      Column(
        children: [
          if (hasHeader) bottomSheetTitle(context, title, icon),
          const SizedBox(height: 16),
          content,
          // const SizedBox(height: 8),
          // action,
          const SizedBox(height: 32),
        ],
      );

  Widget bottomSheetTitle(
    final BuildContext context,
    final String? title,
    final IconData? icon,
  ) =>
      Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 0,
              child: icon != null
                  ? Icon(
                      icon,
                      // color: greyStar,
                      size: 30,
                    )
                  : GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // color: greyStar,
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          // color: grey7,
                          size: 18,
                        ),
                      ),
                    ),
            ),
            if (title != null && title.isNotEmpty)
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      color: colorWhite0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            const Expanded(
              flex: 0,
              child: SizedBox(
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
      );

  Widget item(
    final BuildContext context,
    final Widget content,
    final Function? action, {
    final IconData? icon,
    final Color? iconColor,
  }) =>
      InkWell(
        child: ListTile(
          title: icon == null
              ? content
              : Row(
                  children: [
                    itemIcon(icon, iconColor!),
                    const SizedBox(width: 16),
                    content,
                  ],
                ),
        ),
        onTap: () {
          if (action == null) {
            Navigator.pop(context);
          } else {
            Navigator.pop(context);
            action();
          }
        },
      );

  Widget itemIcon(
    final IconData icon,
    final Color color,
  ) =>
      Icon(icon, color: color);

  Widget itemContent(
    final String content, {
    final TextStyle? style,
  }) =>
      Text(content, style: style ?? itemStyle);

  Widget action(
    final String title,
    final VoidCallback action,
  ) =>
      InkWell(
        onTap: action,
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: const Color(0xff7cb721),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              // color: whiteColor,
            ),
          ),
        ),
      );
}
