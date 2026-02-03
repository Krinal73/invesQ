import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/enum_utils.dart';

class AnimatedSnackBar {
  /// Pass duration you want the snack bar to be visible for.
  final Duration duration;

  /// Build your snack bar using this builder.
  /// This will be passed to [RawAnimatedSnackBar]
  /// and will be used to build your custom snack bar.
  final WidgetBuilder builder;

  /// Determine which position you want the snack bar
  /// to be displayed at for mobile.
  final SnackBarPosition snackBarPosition;

  late OverlayEntry entry;

  AnimatedSnackBar({
    this.duration = const Duration(seconds: 8),
    this.snackBarPosition = SnackBarPosition.top,
    required this.builder,
  });

  void closeOverlay() {
    if (entry.mounted) {
      entry.remove();
    }
  }

  /// This method will create an overlay for your snack bar
  /// and insert it to the overlay entries of navigator.
  Future<void> show(BuildContext context) async {
    final overlay = Navigator.of(context).overlay!;
    entry = OverlayEntry(
      builder: (_) => RawAnimatedSnackBar(
        duration: duration,
        onRemoved: entry.remove,
        snackBarPosition: snackBarPosition,
        child: builder.call(context),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => overlay.insert(entry));
    await Future.delayed(duration);
  }
}

class RawAnimatedSnackBar extends StatefulWidget {
  const RawAnimatedSnackBar({
    super.key,
    required this.duration,
    required this.child,
    required this.onRemoved,
    required this.snackBarPosition,
  });

  final Duration duration;
  final Widget child;
  final VoidCallback onRemoved;
  final SnackBarPosition snackBarPosition;

  @override
  State<RawAnimatedSnackBar> createState() => RawAnimatedSnackBarState();
}

class RawAnimatedSnackBarState extends State<RawAnimatedSnackBar> {
  bool isVisible = false;
  bool removed = false;

  final duration = const Duration(milliseconds: 200);

  final GlobalKey positionedKey = GlobalKey();

  void remove() {
    if (mounted && removed == false) {
      widget.onRemoved();
    } else {
      removed = true;
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() => isVisible = true);
    });
    Future.delayed(
      Duration(milliseconds: widget.duration.inMilliseconds - 1000),
      () {
        if (mounted) {
          setState(() => isVisible = false);
          Future.delayed(const Duration(seconds: 1), () {
            remove();
          });
        }
      },
    );

    super.initState();
  }

  double? get top {
    if (widget.snackBarPosition == SnackBarPosition.top) {
      if (isVisible) {
        return 42.h;
      } else {
        return -100;
      }
    } else if (widget.snackBarPosition == SnackBarPosition.bottom) {
      return null;
    }

    throw UnimplementedError();
  }

  double? get bottom {
    if (widget.snackBarPosition == SnackBarPosition.top) {
      return null;
    } else if (widget.snackBarPosition == SnackBarPosition.bottom) {
      if (isVisible) {
        return 26.h;
      } else {
        return -100;
      }
    }

    throw UnimplementedError();
  }

  double? get left {
    return 16.w;
  }

  double? get right {
    return 16.h;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      key: positionedKey,
      duration: duration,
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Center(
        child: Material(color: Colors.transparent, child: widget.child),
      ),
    );
  }
}
