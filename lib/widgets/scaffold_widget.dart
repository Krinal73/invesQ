import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    super.key,
    // this.globalKey,
    this.canPop = true,
    this.popInvokedWithResultCallback,
    this.isSplashScreen = false,
    this.appBarWidget,
    this.backgroundColor,
    required this.child,
    this.endDrawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset = true,
  });

  // final GlobalKey<ScaffoldState>? globalKey;
  final bool canPop;
  final PopInvokedWithResultCallback? popInvokedWithResultCallback;
  final bool isSplashScreen;
  final PreferredSizeWidget? appBarWidget;
  final Color? backgroundColor;
  final Widget child;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: popInvokedWithResultCallback,
      child: Scaffold(
        // key: globalKey,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundColor ?? ColorUtils.scaffoldBackgroundColor,
        appBar: appBarWidget,
        body: child,
        endDrawer: endDrawer,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
