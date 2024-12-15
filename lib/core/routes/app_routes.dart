import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sweetsstore/core/di/dependency_injection.dart';
import 'package:sweetsstore/core/helper/route_helper.dart';
import 'package:sweetsstore/core/utils/app_strings.dart';
import 'package:sweetsstore/features/home/presentation/cubit/home_cubit.dart';
import 'package:sweetsstore/features/home/presentation/pages/sweets_screen.dart';

final scaffoldKey = RouteHelper.routeHelper.scaffoldKey;
final customContext = RouteHelper.routeHelper.navigationKey.currentState!.context;
final size = MediaQuery.sizeOf(customContext);
bool isArLang = customContext.fallbackLocale?.languageCode == 'ar';

final routes = GoRouter(
    navigatorKey: RouteHelper.routeHelper.navigationKey,
    initialLocation: AppStrings.homeScreenPath,
    routes: [
      GoRoute(
          path: AppStrings.homeScreenPath,
          builder: (ctx, state) => BlocProvider(
                create: (ctx) => sl<HomeCubit>(),
                child: const SweetsScreen(),
              ))
    ]);
