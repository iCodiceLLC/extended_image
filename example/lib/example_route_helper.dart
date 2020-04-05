// GENERATED CODE - DO NOT MODIFY MANUALLY
// **************************************************************************
// Auto generated by https://github.com/fluttercandies/ff_annotation_route
// **************************************************************************

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'example_route.dart';

class FFNavigatorObserver extends NavigatorObserver {
  final RouteChange routeChange;

  FFNavigatorObserver({this.routeChange});

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    _didRouteChange(previousRoute, route);
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    _didRouteChange(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    super.didRemove(route, previousRoute);
    _didRouteChange(previousRoute, route);
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _didRouteChange(newRoute, oldRoute);
  }

  void _didRouteChange(Route newRoute, Route oldRoute) {
    // oldRoute may be null when route first time enter.
    routeChange?.call(newRoute, oldRoute);
  }
}

typedef RouteChange = void Function(
  Route newRoute,
  Route oldRoute,
);

class FFTransparentPageRoute<T> extends PageRouteBuilder<T> {
  FFTransparentPageRoute({
    RouteSettings settings,
    @required RoutePageBuilder pageBuilder,
    RouteTransitionsBuilder transitionsBuilder = _defaultTransitionsBuilder,
    Duration transitionDuration = const Duration(milliseconds: 300),
    bool barrierDismissible = false,
    Color barrierColor,
    String barrierLabel,
    bool maintainState = true,
  })  : assert(pageBuilder != null),
        assert(transitionsBuilder != null),
        assert(barrierDismissible != null),
        assert(maintainState != null),
        super(
          settings: settings,
          opaque: false,
          pageBuilder: pageBuilder,
          transitionsBuilder: transitionsBuilder,
          transitionDuration: transitionDuration,
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          maintainState: maintainState,
        );
}

Widget _defaultTransitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return child;
}

Route<dynamic> onGenerateRouteHelper(
  RouteSettings settings, {
  Widget notFoundFallback,
  Object arguments,
}) {
  arguments ??= settings.arguments;

  final routeResult = getRouteResult(
    name: settings.name,
    arguments: arguments,
  );
  if (routeResult.showStatusBar != null || routeResult.routeName != null) {
    settings = FFRouteSettings(
      name: settings.name,
      isInitialRoute: settings.isInitialRoute,
      routeName: routeResult.routeName,
      arguments: arguments,
      showStatusBar: routeResult.showStatusBar,
    );
  }
  final page = routeResult.widget ?? notFoundFallback;
  if (page == null) {
    throw Exception(
        '''Route "${settings.name}" returned null.Route Widget must never return null, 
          maybe the reason is that route name did not match with right path.
          You can use parameter[notFoundFallback] to avoid this ugly error.''');
  }

  if (arguments is Map<String, dynamic>) {
    RouteBuilder builder = arguments['routeBuilder'];
    if (builder != null) return builder(page);
  }

  switch (routeResult.pageRouteType) {
    case PageRouteType.material:
      return MaterialPageRoute(settings: settings, builder: (_) => page);
    case PageRouteType.cupertino:
      return CupertinoPageRoute(settings: settings, builder: (_) => page);
    case PageRouteType.transparent:
      return FFTransparentPageRoute(
        settings: settings,
        pageBuilder: (_, __, ___) => page,
      );
    default:
      return Platform.isIOS
          ? CupertinoPageRoute(settings: settings, builder: (_) => page)
          : MaterialPageRoute(settings: settings, builder: (_) => page);
  }
}

typedef RouteBuilder = PageRoute Function(Widget page);

class FFRouteSettings extends RouteSettings {
  final String routeName;
  final bool showStatusBar;
  const FFRouteSettings({
    this.routeName,
    this.showStatusBar,
    String name,
    bool isInitialRoute = false,
    Object arguments,
  }) : super(
          name: name,
          isInitialRoute: isInitialRoute,
          arguments: arguments,
        );
}
