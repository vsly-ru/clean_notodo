import 'package:flutter/material.dart';

const _compatSize = 33.0;
const _normalSize = 65.0;

const _compatStrokeWidth = 1.5;
const _normalStrokeWidth = 2.5;

class ProgressWidget extends StatelessWidget {
  const ProgressWidget(
      {this.progress,
      this.compact = true,
      this.color,
      Key? key,
      this.outerWidth = double.infinity,
      this.outerHeight = _normalSize * 2})
      : super(key: key);

  /// between 0.0 and 1.0
  final double? progress;

  /// smaller size
  final bool? compact;

  /// outer container's dimensions
  final double? outerWidth;

  /// outer container's dimensions
  final double? outerHeight;

  final Animation<Color>? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = this.color?.value ??
        theme.progressIndicatorTheme.circularTrackColor ??
        theme.colorScheme.secondary;
    final size = compact == true ? _compatSize : _normalSize;
    return Container(
      alignment: Alignment.center,
      width: outerWidth ?? size,
      height: outerHeight ?? size,
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          value: progress,
          strokeWidth:
              compact == true ? _compatStrokeWidth : _normalStrokeWidth,
          backgroundColor: color.withOpacity(.5),
          valueColor:
              // ignore: unnecessary_cast
              this.color ?? AlwaysStoppedAnimation(color) as Animation<Color>,
        ),
      ),
    );
  }

  /// preset for a list loading animation
  factory ProgressWidget.loadingList(BuildContext context, {Key? key}) {
    return ProgressWidget(key: key);
  }

  factory ProgressWidget.infinite(BuildContext context,
      {bool? compact, Animation<Color>? color, Key? key}) {
    final theme = Theme.of(context);
    theme.progressIndicatorTheme.circularTrackColor ??
        theme.colorScheme.secondary;
    return ProgressWidget(
      compact: compact,
      color: color,
      key: key,
    );
  }

  factory ProgressWidget.fromImageChunk(ImageChunkEvent? chunk,
      {bool? compact, Animation<Color>? color, Key? key}) {
    final expectedTotalBytes = chunk?.expectedTotalBytes;
    final cumulativeBytesLoaded = chunk?.cumulativeBytesLoaded;
    final double? progress;
    if (chunk != null &&
        expectedTotalBytes != null &&
        cumulativeBytesLoaded != null) {
      progress = cumulativeBytesLoaded / expectedTotalBytes;
    } else {
      progress = null;
    }
    return ProgressWidget(
        progress: progress, compact: compact, color: color, key: key);
  }
}
