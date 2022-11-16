import 'package:ache_aqui/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({Key? key}) : super(key: key);

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  bool passwordEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AcheAqui'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      icon: Icon(Icons.person),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email_rounded),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(
                    obscureText: passwordEnabled,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      icon: const Icon(Icons.password),
                      hintText: 'Insira uma senha forte',
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordEnabled = !passwordEnabled;
                          });
                        },
                        icon: Icon(passwordEnabled == true
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  HomeScreen.isLoggedIn = !HomeScreen.isLoggedIn;
                });
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRoutes.HOME, (route) => false);
              },
              child: const Text('Cadastrar'),
            )
          ],
        ),
      ),
    );
  }
}
