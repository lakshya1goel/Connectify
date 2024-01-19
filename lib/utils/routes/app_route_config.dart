import 'package:connectify/authentication/forgotPass/views/screens/successScreen.dart';
import 'package:connectify/authentication/login/views/sreens/login.dart';
import 'package:connectify/authentication/signup/views/screens/confirmProfilePic.dart';
import 'package:connectify/home.dart';
import 'package:connectify/splash_screen.dart';
import 'package:connectify/utils/routes/app_route_constants.dart';
import 'package:connectify/authentication/forgotPass/views/screens/forgotPasswordPage.dart';
import 'package:connectify/authentication/signup/views/screens/otpPage.dart';
import 'package:connectify/authentication/forgotPass/views/screens/otpVerificationPage.dart';
import 'package:connectify/authentication/signup/views/screens/profilePicSeletionScreen.dart';
import 'package:connectify/authentication/forgotPass/views/screens/resetPasswordPage.dart';
import 'package:connectify/authentication/signup/views/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.SplashScreenRouteName,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.LoginRouteName,
        path: '/login',
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
                path: 'otp_page/:email',
                pageBuilder: (context, state) {
                  return MaterialPage(child: OTPPage(email: state.pathParameters['email']));
                }
            ),
            GoRoute(
                name: MyAppRouteConstants.ProfilePicSelectionRouteName,
                path: 'profile_pic_selection_page/:email',
                pageBuilder: (context, state) {
                  return MaterialPage(child: ProfilePicSelectionPage(email: state.pathParameters['email'],));
                }
            ),
            GoRoute(
                name: MyAppRouteConstants.ConfirmProfilePicRouteName,
                path: 'confirm_profile_pic_page',
                pageBuilder: (context, state) {
                  return MaterialPage(child: ConfirmProfilePic());
                }
            )
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
                path: 'otp_verification_page/:email',
                pageBuilder: (context, state) {
                  return MaterialPage(child: OTPVerificationPage(email: state.pathParameters['email']));
                }
            ),
            GoRoute(
                name: MyAppRouteConstants.ResetPasswordRouteName,
                path: 'reset_password_page/:email',
                pageBuilder: (context, state) {
                  return MaterialPage(child: ResetPasswordPage(email: state.pathParameters['email']));
                }
            ),
            GoRoute(
                name: MyAppRouteConstants.SuccessRouteName,
                path: 'success_screen',
                pageBuilder: (context, state) {
                  return MaterialPage(child: SuccessScreen());
                }
            )
          ],
      ),
      GoRoute(
        name: MyAppRouteConstants.HomeRouteName,
        path: '/home',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomePage());
        }
      )
    ],
  );
