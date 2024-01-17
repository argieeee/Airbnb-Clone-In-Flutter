import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pardillo_finalproject/constant/color.dart';
import 'package:pardillo_finalproject/models/booking_details_screen.dart';
import 'package:pardillo_finalproject/pages/explore_page.dart';


class AppRouter {
  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: 'booking-details',
        path: '/booking-details',
        pageBuilder: (context, state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            opaque: false,
            barrierColor: appBlack.withOpacity(0.5),
            transitionDuration: const Duration(milliseconds: 300),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            child: const BookingDetailsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return child;
            },
          );
        },
      ),
    ],
  );
}