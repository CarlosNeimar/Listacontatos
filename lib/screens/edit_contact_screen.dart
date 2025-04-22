import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../services/contact_service.dart';

class EditContactScreen extends StatefulWidget {
  final Contact? contact;
  final int? index;

  EditContactScreen({this.contact, this.index});

  @override
  _EditContactScreenState createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact?.name ?? '');
    _phoneController = TextEditingController(text: widget.contact?.phone ?? '');
    _emailController = TextEditingController(text: widget.contact?.email ?? '');
  }

  Future<void> save() async {
    if (_formKey.currentState?.validate() ?? false) {
      final newContact = Contact(
        name: _nameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
      );

      final list = await ContactService.getContacts();
      if (widget.index != null) {
        list[widget.index!] = newContact;
      } else {
        list.add(newContact);
      }

      await ContactService.saveContacts(list);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.contact != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Contato' : 'Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o nome' : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o telefone' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: save,
                icon: Icon(Icons.save),
                label: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
