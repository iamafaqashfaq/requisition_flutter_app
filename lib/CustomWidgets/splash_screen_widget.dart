import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';

class SplashScreenWidget extends StatefulWidget {
  /// Seconds to navigate after for time based navigation
  final int? seconds;

  /// App title, shown in the middle of screen in case of no image available
  final Text title;

  /// Page background color
  final Color? backgroundColor;

  /// Style for the laodertext
  final TextStyle? styleTextUnderTheLoader;

  /// The page where you want to navigate if you have chosen time based navigation
  final dynamic navigateAfterSeconds;

  /// Main image size
  final double? photoSize;

  /// Triggered if the user clicks the screen
  final dynamic onClick;

  /// Loader color
  final Color? loaderColor;

  /// Main image mainly used for logos and like that
  final Image? image;

  /// Loading text, default: "Loading"
  final Text? loadingText;

  ///  Background image for the entire screen
  final ImageProvider? imageBackground;

  /// Background gradient for the entire screen
  final Gradient? gradientBackground;

  /// Whether to display a loader or not
  final bool? useLoader;

  /// Custom page route if you have a custom transition you want to play
  final Route? pageRoute;

  /// RouteSettings name for pushing a route with custom name (if left out in MaterialApp route names) to navigator stack (Contribution by Ramis Mustafa)
  final String? routeName;

  /// expects a function that returns a future, when this future is returned it will navigate
  final Future<dynamic>? navigateAfterFuture;

  /// Use one of the provided factory constructors instead of.
  @protected
  const SplashScreenWidget({
    super.key,
    this.loaderColor,
    this.navigateAfterFuture,
    this.seconds,
    this.photoSize,
    this.pageRoute,
    this.onClick,
    this.navigateAfterSeconds,
    this.title = const Text(''),
    this.backgroundColor = Colors.white,
    this.styleTextUnderTheLoader = const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    this.image,
    this.loadingText = const Text(""),
    this.imageBackground,
    this.gradientBackground,
    this.useLoader = true,
    this.routeName,
  });

  factory SplashScreenWidget.timer(
          {required int seconds,
          Color? loaderColor,
          Color? backgroundColor,
          double? photoSize,
          Text? loadingText,
          Image? image,
          Route? pageRoute,
          dynamic onClick,
          dynamic navigateAfterSeconds,
          required Text title,
          TextStyle? styleTextUnderTheLoader,
          ImageProvider? imageBackground,
          Gradient? gradientBackground,
          bool? useLoader,
          String? routeName}) =>
      SplashScreenWidget(
        loaderColor: loaderColor,
        seconds: seconds,
        photoSize: photoSize,
        loadingText: loadingText,
        backgroundColor: backgroundColor,
        image: image,
        pageRoute: pageRoute,
        onClick: onClick,
        navigateAfterSeconds: navigateAfterSeconds,
        title: title,
        styleTextUnderTheLoader: styleTextUnderTheLoader,
        imageBackground: imageBackground,
        gradientBackground: gradientBackground,
        useLoader: useLoader,
        routeName: routeName,
      );

  factory SplashScreenWidget.network(
          {required Future<dynamic> navigateAfterFuture,
          Color? loaderColor,
          Color? backgroundColor,
          double? photoSize,
          required Text loadingText,
          Image? image,
          Route? pageRoute,
          dynamic onClick,
          dynamic navigateAfterSeconds,
          required Text title,
          TextStyle? styleTextUnderTheLoader,
          ImageProvider? imageBackground,
          Gradient? gradientBackground,
          bool? useLoader,
          String? routeName}) =>
      SplashScreenWidget(
        loaderColor: loaderColor,
        navigateAfterFuture: navigateAfterFuture,
        photoSize: photoSize,
        loadingText: loadingText,
        backgroundColor: backgroundColor,
        image: image,
        pageRoute: pageRoute,
        onClick: onClick,
        navigateAfterSeconds: navigateAfterSeconds,
        title: title,
        styleTextUnderTheLoader: styleTextUnderTheLoader,
        imageBackground: imageBackground,
        gradientBackground: gradientBackground,
        useLoader: useLoader,
        routeName: routeName,
      );

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.routeName != null &&
        widget.routeName is String &&
        widget.routeName![0] != "/") {
      throw ArgumentError(
          "widget.routeName must be a String beginning with forward slash (/)");
    }
    if (widget.navigateAfterFuture == null) {
      Timer(Duration(seconds: widget.seconds!), () {
        if (widget.navigateAfterSeconds is String) {
          // It's fairly safe to assume this is using the in-built material
          // named route component
          Navigator.of(context)
              .pushReplacementNamed(widget.navigateAfterSeconds);
        } else if (widget.navigateAfterSeconds is Widget) {
          Navigator.of(context).pushReplacement(widget.pageRoute != null
              ? widget.pageRoute!
              : MaterialPageRoute(
                  settings: widget.routeName != null
                      ? RouteSettings(name: "${widget.routeName}")
                      : null,
                  builder: (BuildContext context) =>
                      widget.navigateAfterSeconds));
        } else {
          throw ArgumentError(
              'widget.navigateAfterSeconds must either be a String or Widget');
        }
      });
    } else {
      widget.navigateAfterFuture!.then((navigateTo) {
        if (navigateTo is String) {
          // It's fairly safe to assume this is using the in-built material
          // named route component
          Navigator.of(context).pushReplacementNamed(navigateTo);
        } else if (navigateTo is Widget) {
          Navigator.of(context).pushReplacement(widget.pageRoute != null
              ? widget.pageRoute!
              : MaterialPageRoute(
                  settings: widget.routeName != null
                      ? RouteSettings(name: "${widget.routeName}")
                      : null,
                  builder: (BuildContext context) => navigateTo));
        } else {
          throw ArgumentError(
              'widget.navigateAfterFuture must either be a String or Widget');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: widget.onClick,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: widget.imageBackground == null
                    ? null
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: widget.imageBackground!,
                      ),
                gradient: widget.gradientBackground,
                color: widget.backgroundColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: widget.photoSize,
                        child: Hero(
                          tag: "splashscreenImage",
                          child: Container(child: widget.image),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      widget.title
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      !widget.useLoader!
                          ? Container()
                          : CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color?>(
                                  widget.loaderColor),
                            ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      // widget.loadingText
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
