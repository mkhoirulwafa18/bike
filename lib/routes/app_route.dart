import 'package:auto_route/auto_route.dart';
import 'package:bike/features/home/data/bike.dart';
import 'package:flutter/material.dart';

import '../features/details/presentation/screen/details_screen.dart';
import '../features/home/presentation/screen/home_page.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
// @override
// replaceInRouteName

  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/details',
          page: DetailRoute.page,
        ),
      ];
}
