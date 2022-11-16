import 'package:ache_aqui/components/product_form.dart';
import 'package:ache_aqui/components/product_list.dart';
import 'package:ache_aqui/models/product.dart';
import 'package:ache_aqui/utils/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static bool isLoggedIn = false;

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> _products = [];

  _openProductRegisterForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return ProductForm(onSubmit: _addProduct);
        });
  }

  _addProduct(String name, String category, String trackingCode) {
    final newProduct = Product(name, category, trackingCode);

    setState(() {
      _products.add(newProduct);
    });
  }

  final appBar = AppBar(
    title: Text('AcheAqui'),
    centerTitle: true,
    bottom: const TabBar(tabs: [
      Tab(
        text: 'Pendentes',
      ),
      Tab(
        text: 'Entregues',
      )
    ]),
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: HomeScreen.isLoggedIn == false
          ? ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(padding: EdgeInsets.all(50)),
                    const Text(
                      'Parece que você não está logado!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.LOGIN);
                        },
                        child: Text('Faça login'))
                  ],
                )
              ],
            )
          : DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Scaffold(
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      UserAccountsDrawerHeader(
                        accountName: const Text('Jean Reis'),
                        accountEmail: const Text('jean.reis@gmail.com'),
                        currentAccountPicture: const CircleAvatar(
                          child: Text("JR"),
                        ),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      ListTile(
                        leading: const Icon(Icons.exit_to_app),
                        title: const Text('Logout'),
                        onTap: () {
                          setState(() {
                            HomeScreen.isLoggedIn = !HomeScreen.isLoggedIn;
                          });
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.HOME, (route) => false);
                        },
                      )
                    ],
                  ),
                ),
                appBar: appBar,
                floatingActionButton: FloatingActionButton(
                  onPressed: () => _openProductRegisterForm(context),
                  child: const Icon(Icons.add),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: mediaQuery.size.height -
                            appBar.preferredSize.height -
                            mediaQuery.padding.top,
                        child: ProductList(products: _products),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
