import 'package:flutter/material.dart';

class RouteHelper {
  RouteHelper._();
  static RouteHelper routeHelper = RouteHelper._();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}
