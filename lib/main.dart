import 'package:ache_aqui/screens/home_screen.dart';
import 'package:ache_aqui/screens/user_login_screen.dart';
import 'package:ache_aqui/screens/user_register_screen.dart';
import 'package:ache_aqui/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AcheAqui());

class AcheAqui extends StatelessWidget {
  const AcheAqui({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AcheAqui",
      theme: ThemeData(
          canvasColor: const Color.fromRGBO(255, 254, 225, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: const TextStyle(
                fontSize: 20,
              )),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
              .copyWith(secondary: Colors.blueAccent)),
      routes: {
        AppRoutes.HOME: (ctx) => HomeScreen(),
        AppRoutes.LOGIN: (ctx) => const UserLoginScreen(),
        AppRoutes.REGISTER: (ctx) => const UserRegisterScreen(),
      },
    );
  }
}
