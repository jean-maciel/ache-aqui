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
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
            child: Column(
              children: [
                Text(
                  'Crie sua conta aqui',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 50),
                Form(
                  child: ListView(
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
                            icon: Icon(Icons.email_rounded)),
                        textInputAction: TextInputAction.next,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          icon: Icon(Icons.password),
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
                      const SizedBox(height: 200),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            HomeScreen.isLoggedIn = !HomeScreen.isLoggedIn;
                          });
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.HOME, (route) => false);
                        },
                        child: const Text("Cadastrar"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
