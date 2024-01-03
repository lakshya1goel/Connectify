import 'package:connectify/utils/routes/app_route_constants.dart';
import 'package:connectify/views/screens/authentication/forgotPasswordPage.dart';
import 'package:connectify/views/screens/authentication/login.dart';
import 'package:connectify/views/screens/authentication/otpPage.dart';
import 'package:connectify/views/screens/authentication/otpVerificationPage.dart';
import 'package:connectify/views/screens/authentication/resetPasswordPage.dart';
import 'package:connectify/views/screens/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.LoginRouteName,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
          name: MyAppRouteConstants.SignupRouteName,
          path: '/signup',
          pageBuilder: (context, state) {
            return const MaterialPage(child: SignupPage());
          },
          routes: <RouteBase>[
            GoRoute(
                name: MyAppRouteConstants.OTPPageRouteName,
                path: 'otp_page',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: OTPPage());
                }
            ),
          ],
      ),
      GoRoute(
          name: MyAppRouteConstants.ForgotPasswordRouteName,
          path: '/forgot_password_page',
          pageBuilder: (context, state) {
            return const MaterialPage(child: ForgotPasswordPage());
          },
          routes: <RouteBase>[
            GoRoute(
                name: MyAppRouteConstants.OTPVerificationRouteName,
                path: 'otp_verification_page',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: OTPVerificationPage());
                }
            ),
            GoRoute(
                name: MyAppRouteConstants.ResetPasswordRouteName,
                path: 'reset_password_page',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: ResetPasswordPage());
                }
            )
          ],
      ),
    ],
  );
