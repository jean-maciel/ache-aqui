import 'package:ache_aqui/screens/home_screen.dart';
import 'package:ache_aqui/utils/app_routes.dart';
import 'package:flutter/material.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  bool passwordEnabled = false;

  final appBar = AppBar(
    title: Text("AcheAqui"),
    centerTitle: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 70),
                Form(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            icon: Icon(Icons.email_rounded),
                            hintText: 'Insira seu email'),
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
                      const SizedBox(
                        height: 200,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            HomeScreen.isLoggedIn = !HomeScreen.isLoggedIn;
                          });
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.HOME, (route) => false);
                        },
                        child: const Text("Entrar"),
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Esqueceu a senha?')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não possui uma conta?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.REGISTER);
                      },
                      child: const Text('Crie sua conta aqui!'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
