import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  final void Function(String, String, String) onSubmit;

  ProductForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  static final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _trackingCodeController = TextEditingController();

  _submitForm() {
    final name = _nameController.text;
    final category = _categoryController.text;
    final trackingCode = _trackingCodeController.text;

    if (name.isEmpty || category.isEmpty || trackingCode.isEmpty) {
      return;
    }
    widget.onSubmit(name, category, trackingCode);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.only(
            top: 15,
            right: 15,
            left: 15,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                autocorrect: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome do produto'),
              ),
              TextField(
                controller: _categoryController,
                decoration:
                    const InputDecoration(labelText: 'Categoria do produto'),
              ),
              TextField(
                controller: _trackingCodeController,
                decoration: const InputDecoration(
                    labelText: 'Código de rastreio do produto'),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                  onPressed: _submitForm, child: const Text('Novo Produto'))
            ],
          ),
        ),
      ),
    );
  }
}
