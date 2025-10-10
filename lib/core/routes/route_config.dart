// import 'package:ds_cart/features/food_store/view/order_screen.dart';
// import 'package:ds_cart/view/user_account_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// import '../../features/food_store/core/widgets/food_bottom_nav_bar.dart';
// import '../../features/food_store/view/food_cart_screen.dart';
// import '../../features/food_store/view/food_home_screen.dart';
// import '../../features/food_store/view/main_screen.dart';
// import '../../provider/auth_provider.dart';
// import '../../view/home_screen.dart';
// import '../../view/login_screen.dart';
// import '../../view/otp_screen.dart';
// import '../../view/register_screen.dart';
// import '../../view/splash_screen.dart';

// class RouteConfig {
//   static GoRouter router(BuildContext context) {
//     final auth = context.read<AuthProvider>();
//     return GoRouter(
//       initialLocation: '/splash',
//       refreshListenable: auth,
//       routes: [
//         GoRoute(
//           path: '/',
//           name: 'home',
//           builder: (context, state) => HomeScreen(),
//         ),
//         GoRoute(
//           path: '/splash',
//           name: 'splash',
//           builder: (context, state) => SplashScreen(),
//         ),
//         GoRoute(
//           path: '/login',
//           name: 'login',
//           builder: (context, state) => LoginScreen(),
//         ),
//         GoRoute(
//           path: '/register',
//           name: 'register',
//           builder: (context, state) => RegisterScreen(),
//         ),
//         GoRoute(
//           path: '/otp',
//           name: 'otp',
//           builder: (context, state) => OtpScreen(),
//         ),

//         // Food Store Routes
//         ShellRoute(
//             builder: (context, state, child) {
//               return Scaffold(
//                   body: child, bottomNavigationBar: FoodBottomNavBar());
//             },
//             routes: [
//               GoRoute(
//                 path: '/food_home',
//                 name: 'foodHome',
//                 pageBuilder: (context, state) =>
//                     NoTransitionPage(child: FoodHomeScreen()),
//               ),
//               GoRoute(
//                 path: '/food_order',
//                 name: 'foodOrder',
//                 pageBuilder: (context, state) =>
//                     NoTransitionPage(child: OrderScreen()),
//               ),
//               GoRoute(
//                 path: '/profile',
//                 name: 'profile',
//                 pageBuilder: (context, state) =>
//                     NoTransitionPage(child: UserAccountScreen()),
//               ),
//             ]),
//         GoRoute(
//           path: '/main_screen',
//           name: 'mainScreen',
//           builder: (context, state) => MainScreen(),
//         ),

//         GoRoute(
//           path: '/food_cart',
//           name: 'foodCart',
//           builder: (context, state) => FoodCartScreen(),
//         )
//       ],
//       redirect: (context, state) {
//         final isLoggedIn = auth.isLoggedIn;
//         final loggingIn = state.matchedLocation.startsWith('/login');

//         if (!isLoggedIn && state.matchedLocation.startsWith('/foodCart')) {
//           return '/login';
//         }
//         if (isLoggedIn && loggingIn) {
//           return '/';
//         }
//         return null;
//       },
//     );
//   }
// }
