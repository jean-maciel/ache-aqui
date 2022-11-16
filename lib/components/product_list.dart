import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  //final void Function(String) onRemove;

  const ProductList({
    Key? key,
    required this.products,
    //required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? LayoutBuilder(builder: (BuildContext, BoxConstraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Nenhum produto cadastrado',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: BoxConstraints.maxHeight * 0.6,
                  child: Image.asset('lib/assets/images/grog.png'),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              final pr = products[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: FittedBox(
                        child: Text(pr.name[0]),
                      ),
                    ),
                  ),
                  title: Text(pr.name),
                  subtitle: Text(pr.category),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                ),
              );
            });
  }
}
