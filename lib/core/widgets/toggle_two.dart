import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notodo/core/extensions/duration.dart';

class ToggleTwo extends HookWidget {
  final double height;
  final double width;

  /// border radius
  final double radius;

  /// left caption
  final String left;

  /// right caption
  final String right;

  /// value == true when right
  final bool value;

  /// animation duration
  final int duration;

  /// outer margin
  // final EdgeInsets margin;

  final TextStyle textStyle;

  /// reaction on changes
  final Function(bool isRight)? onTap;

  /// await [double] x leftDuration vefore calling onTap
  final double awaitBeforeOnTap;

  ToggleTwo(
      {this.height = 40.0,
      this.width = 220.0,
      this.radius = 20.0,
      this.left = '',
      this.right = '',
      this.duration = 500,
      // this.margin = const EdgeInsets.symmetric(horizontal: 8.0),
      this.textStyle =
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
      required this.value,
      required this.onTap,
      this.awaitBeforeOnTap = 1.0,
      Key? key})
      : super(key: key);

  var targetPosition = 0.0;

  /// returns future with a bool after movement is complite
  /// bool represents if slider has arrived to the target destination (or was interrupted)
  Future<void> move(AnimationController c, {required double target}) async {
    targetPosition = target;
    final pos = c.value;
    if (targetPosition == pos) return;
    if (targetPosition > pos) {
      final int left = ((1 - pos) * duration * awaitBeforeOnTap).ceil();
      c.forward();
      await left.ms.delay;
      return;
    } else {
      final int left = (pos * duration * awaitBeforeOnTap).ceil();
      c.reverse();
      await left.ms.delay;
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _duration = duration.ms;
    final _anim = useAnimationController(
        duration: _duration, initialValue: value ? 0.0 : 1.0);
    useEffect(() {
      move(_anim, target: value ? 1.0 : 0.0);
      return null;
    });
    final theme = Theme.of(context);
    final textColor = theme.colorScheme.onSurface;
    final textColorInactive = theme.colorScheme.onBackground.withOpacity(0.6);
    return Container(
      alignment: Alignment.center,
      child: AnimatedBuilder(
        animation: _anim,
        builder: (context, _) {
          final v = _anim.value;
          return Container(
            height: height,
            width: width,
            padding: const EdgeInsets.all(1.5),
            decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(
                color: Colors.grey.withOpacity(0.4),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Stack(children: [
              // background sliding block
              Transform.translate(
                offset: Offset(v * ((width - 8) / 2), 0.0),
                child: Container(
                  height: height - 4.0,
                  width: width / 2,
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // << LEFT element <<
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onTap == null
                        ? null // ignoring tap actions
                        : () async {
                            await move(_anim, target: 0.0);
                            onTap!.call(false);
                          },
                    child: Container(
                      width: (width / 2) - 5,
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 5),
                      alignment: Alignment.center,
                      child: Text(
                        left,
                        style: textStyle.copyWith(
                            color: Color.alphaBlend(
                                textColor.withOpacity(1 - v),
                                textColorInactive)),
                      ),
                    ),
                  ),
                  // >> RIGHT elemnt >>
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onTap == null
                        ? null // disabled
                        : () async {
                            await move(_anim, target: 1.0);
                            onTap!.call(true);
                          },
                    child: Container(
                      width: (width / 2) - 5,
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 5),
                      alignment: Alignment.center,
                      child: Text(
                        right,
                        style: textStyle.copyWith(
                          color: Color.alphaBlend(
                              textColor.withOpacity(v), textColorInactive),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
