/// FadeIn animation with configurable duration, offset and fadeOut method.
/// v 1.2 | 2022-04-19 (YYYY-MM-DD)
/// Created by Vasiliy Atutov aka vSLY (https://github.com/vsly-ru)
/// Based on EntranceFader by Marcin Szałek (https://fidev.io)

import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Widget entrance animation with opacity (from [opacity]) and sliding (from an [offset])
class FadeIn extends StatefulWidget {
  /// Skip the animation entirely and return child instead (e.g. for optimization)
  final bool skipAnimation;

  /// A widget to animate
  final Widget? child;

  /// Starting offset from which the widget will move to its default (no offset) position
  final Offset offset;

  /// Delay (ms) before playing the animation; (useful for chaining)
  final int delay;

  /// Duration (ms) of the animation
  final int duration;

  /// Initial widget opacity (from 0.0 to 1.0)
  final double opacity;

  final double scale;

  const FadeIn(
      {Key? key,
      this.child,
      this.offset = const Offset(0.0, 32.0),
      this.delay = 0,
      this.duration = 400,
      this.skipAnimation = false,
      this.scale = 0.9,
      this.opacity = 0.0})
      : super(key: key);

  @override
  FadeInState createState() => FadeInState();
}

class FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _dxAnimation;
  late Animation _dyAnimation;
  late Animation _opacityAnimation;
  late Animation _scaleAnimation;

  // determine when the child shouldn't be mounted
  bool _erased = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    _dxAnimation =
        Tween(begin: widget.offset.dx, end: 0.0).animate(_controller);
    _dyAnimation =
        Tween(begin: widget.offset.dy, end: 0.0).animate(_controller);
    _opacityAnimation =
        Tween(begin: widget.opacity, end: 1.0).animate(_controller);
    _scaleAnimation = Tween(begin: widget.scale, end: 1.0).animate(_controller);
    if (widget.delay > 0) {
      // delaying the animation
      Future.delayed(Duration(milliseconds: widget.delay), () {
        fadeIn(null);
      });
    } else {
      // no delay before the animation
      fadeIn(0.0);
    }
  }

  @override
  void didUpdateWidget(FadeIn oldWidget) {
    super.didUpdateWidget(oldWidget);
    // log('didUpdateWidget', name: 'FadeIn');
    if (widget.duration != oldWidget.duration) {
      _controller.duration = Duration(milliseconds: widget.duration);
      // TODO: update other fields
    }
  }

  /// play the fade in animation (could be awaited)
  /// @from – start the animation from a specific progress; Where 0.0 is invisible and 1.0 (100%) is fully faded in (opaque).
  ///   Default (null) uses the current progress as a starting point;
  FutureOr<void> fadeIn(double? from) async {
    if (mounted) {
      if (_erased) {
        // if the widget was previously "dismounted", rebuild the widget using animation controller.
        setState(() {
          _erased = false;
        });
      }
      _controller.forward(from: from);
      // calculating the expected animation duration (ms) from a current/given progress to 1.0;
      final left = 1.0 - (from ?? _controller.value);
      final duration = (left * widget.duration).ceil();
      await Future.delayed(Duration(milliseconds: duration));
    } else {
      if (kDebugMode) throw ('Not yet mounted');
    }
  }

  /// disappear animation (could be awaited)
  /// @from – start the animation from a specific progress point; Where 0.0 is invisible and 1.0 (100%) is fully faded in (opaque).
  ///   Default (null) uses the current progress as a starting point;
  /// @erase – will "dismount" (like display:none in CSS) itself after fading out is finished.
  ///   Can be used to animate
  FutureOr<void> fadeOut(double? from, bool erase) async {
    if (mounted) {
      _controller.reverse(from: from);
      // calculating the expected animation duration (ms) from a current/given progress to zero;
      final leftDuration = (from ?? _controller.value) * (widget.duration + 1);
      await Future.delayed(Duration(milliseconds: leftDuration.ceil()));
      // check if the animation was (not) interrupted
      if (_controller.value == 0.0 && erase) {
        // rebuild the widget without an animation builder
        setState(() {
          _erased = true;
        });
      }
    } else {
      if (kDebugMode) throw ('Not yet mounted');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Widget none = SizedBox.shrink();
    if (_erased) return none;
    if (widget.skipAnimation) return widget.child ?? none;
    return AnimatedBuilder(
      key: ValueKey<bool>(_erased),
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: _opacityAnimation.value,
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..translate(_dxAnimation.value, _dyAnimation.value)
            ..scale(_scaleAnimation.value),
          child: widget.child,
        ),
      ),
    );
  }
}
