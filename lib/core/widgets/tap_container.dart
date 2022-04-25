import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const _rowHeight = 48.0;
const _rowVerticalPadding = 4.0;
const _rowHorizontalPadding = 6.0;

class TapContainer extends HookWidget {
  final Widget? child;

  /// full height
  final double height;

  /// width
  final double width;

  final double horizontalMargin;

  /// optional border
  final double borderWidth;

  final double radius;

  /// if this is the first (or the only) element in a list
  final bool roundTop;

  /// if this is the last (or the only) element in a list
  final bool roundBottom;

  /// a function to call on tap/click (also shows an optional arrow on the right when provided)
  final Function()? onTap;
  // tap (hold) animation duration
  final int duration;

  const TapContainer(
      {this.child,
      this.height = 48.0,
      this.width = double.infinity,
      this.horizontalMargin = 8.0,
      this.borderWidth = 0,
      this.radius = 8.0,
      this.onTap,
      this.roundTop = true,
      this.roundBottom = true,
      this.duration = 800,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller =
        useAnimationController(duration: Duration(milliseconds: duration));
    final theme = Theme.of(context);
    final themeCardColor = theme.cardColor;
    final MQ = MediaQuery.of(context);
    final BorderRadius? borderRadius = roundTop == roundBottom
        ? BorderRadius.circular(radius)
        : roundTop
            ? BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius))
            : roundBottom
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius))
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
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final v = _controller.value;
              final bgColor = Color.alphaBlend(
                  theme.colorScheme.primary.withOpacity(v / 4), themeCardColor);
              // building 🏠
              return Container(
                height: height,
                width: width,
                margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
                padding: EdgeInsets.only(
                  top: _rowVerticalPadding,
                  bottom: _rowVerticalPadding,
                  left: MQ.padding.left + _rowHorizontalPadding,
                  right: MQ.padding.right + _rowHorizontalPadding,
                ),
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  color: bgColor,
                  border: borderWidth > 0
                      ? Border.all(
                          width: borderWidth,
                          color: theme.colorScheme.onSurface)
                      : null,
                  borderRadius: borderRadius,
                ),
                child: child,
              );
            }),
      ),
    );
  }
}
