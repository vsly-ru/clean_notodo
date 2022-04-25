import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:line_icons/line_icons.dart';

const _rowHeight = 48.0;
const _rowVerticalPadding = 4.0;
const _rowHorizontalPadding = 12.0;
const _radius = 8.0;
const _fontWeight = FontWeight.w300;

class OptionRow extends HookWidget {
  /// widget's caption
  final String caption;

  /// a value to show on the right
  final String? value;

  final bool hideArrow;

  /// hint text (normally not shown on mobile, except accessibility maybe)
  final String? hint;

  /// full height
  final double height;

  /// if width should be limited
  final double maxWidth;

  final double horizontalMargin;

  /// optional icon
  final IconData? icon;

  final double iconSize;

  /// optional border
  final double borderWidth;

  /// if this is the first (or the only) element in a list
  final bool roundTop;

  /// if this is the last (or the only) element in a list
  final bool roundBottom;

  /// a function to call on tap/click (also shows an optional arrow on the right when provided)
  final Function()? onTap;
  // tap (hold) animation duration
  final int duration;

  OptionRow(this.caption,
      {this.value,
      this.hint,
      this.height = _rowHeight,
      this.maxWidth = double.infinity,
      this.horizontalMargin = 8.0,
      this.icon,
      this.iconSize = 22.0,
      this.borderWidth = 0,
      this.onTap,
      this.hideArrow = false,
      this.roundTop = true,
      this.roundBottom = true,
      this.duration = 800});

  @override
  Widget build(BuildContext context) {
    final _controller =
        useAnimationController(duration: Duration(milliseconds: duration));
    final theme = Theme.of(context);
    final themeColorPrimary = theme.primaryColor;
    final themeColorBg = theme.cardColor;
    final MQ = MediaQuery.of(context);
    final rowInnerHeight = height - (_rowVerticalPadding * 2);
    final BorderRadius? borderRadius = roundTop == roundBottom
        ? BorderRadius.circular(_radius)
        : roundTop
            ? const BorderRadius.only(
                topLeft: Radius.circular(_radius),
                topRight: Radius.circular(_radius))
            : roundBottom
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(_radius),
                    bottomRight: Radius.circular(_radius))
                : null;
    // 👉
    return MouseRegion(
      onEnter: (_) {
        _controller.forward();
      },
      onExit: (_) {
        _controller.reverse();
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        onTapDown: (_) {
          _controller.forward(from: 0.11);
        },
        onTapUp: (_) {
          _controller.reverse(from: 1.0);
        },
        onTapCancel: () {
          _controller.reverse();
        },
        child: LayoutBuilder(builder: (context, constrains) {
          final fullWidth = maxWidth == double.infinity
              ? constrains.maxWidth - (horizontalMargin * 2)
              : maxWidth - (horizontalMargin * 2);
          return AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final v = _controller.value;
                final colorOnBackground = Color.alphaBlend(
                    Colors.white.withOpacity(v),
                    theme.colorScheme.onBackground);
                final colorOnSurface = Color.alphaBlend(
                    Colors.white.withOpacity(v), theme.colorScheme.onSurface);
                final colorPrimary = Color.alphaBlend(
                    Colors.white.withOpacity(v), themeColorPrimary);
                // building 🏠
                return Container(
                  height: height,
                  width: fullWidth,
                  margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
                  padding: EdgeInsets.only(
                    top: _rowVerticalPadding,
                    bottom: _rowVerticalPadding,
                    left: MQ.padding.left + _rowHorizontalPadding,
                    right: MQ.padding.right + _rowHorizontalPadding,
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    color: Color.alphaBlend(
                        themeColorPrimary.withOpacity(v), themeColorBg),
                    border: borderWidth > 0
                        ? Border.all(
                            width: borderWidth,
                            color: theme.colorScheme.onSurface)
                        : null,
                    borderRadius: borderRadius,
                  ),
                  child: Row(
                    children: [
                      // 🟢 icon
                      if (icon != null)
                        Container(
                          width: iconSize,
                          height: rowInnerHeight,
                          alignment: Alignment.center,
                          child: Icon(
                            icon,
                            size: iconSize,
                            color: colorOnBackground,
                          ),
                        ),
                      if (icon != null) const SizedBox(width: 9),
                      // caption
                      Container(
                        height: rowInnerHeight,
                        width: fullWidth -
                            (_rowHorizontalPadding * 2) -
                            (icon != null ? iconSize + 9 : 0) -
                            (horizontalMargin * 2),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              caption,
                              style: TextStyle(
                                  color: colorOnBackground,
                                  fontSize: 18.0,
                                  fontWeight: _fontWeight),
                            ),
                            Container(
                              // color: Colors.blueGrey,
                              height: rowInnerHeight,
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: [
                                  if (value != null)
                                    Text(value!,
                                        style: TextStyle(
                                          color: colorOnSurface,
                                          fontSize: 18,
                                          fontWeight: _fontWeight,
                                        )),
                                  // if (onTap != null) SizedBox(width: 6),
                                  if (onTap != null && !hideArrow)
                                    Container(
                                      width: 20,
                                      height: rowInnerHeight,
                                      alignment: Alignment.centerRight,
                                      // color: Colors.green,
                                      child: Icon(
                                        LineIcons.angleRight,
                                        size: 15,
                                        color: colorOnSurface,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
        }),
      ),
    );
  }
}
