import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../services/contact_service.dart';
import 'edit_contact_screen.dart';
import 'contact_detail_screen.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    final list = await ContactService.getContacts();
    setState(() {
      contacts = list;
    });
  }

  void goToEdit({Contact? contact, int? index}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditContactScreen(contact: contact, index: index),
      ),
    );
    if (result == true) loadContacts();
  }

  void goToDetail(Contact contact, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ContactDetailScreen(contact: contact, index: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contatos')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (_, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            onTap: () => goToDetail(contact, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goToEdit(),
        child: Icon(Icons.add),
      ),
    );
  }
}
