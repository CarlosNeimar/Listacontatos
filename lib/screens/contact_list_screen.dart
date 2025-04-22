import 'package:flutter/material.dart';
import '../models/contact.dart';
import 'contact_detail_screen.dart';

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = List.generate(
    15,
    (index) => Contact(
      name: 'Contato ${index + 1}',
      phone: '(11) 9${index + 10}234-5678',
      image: 'https://i.pravatar.cc/150?img=${index + 1}', // imagens aleatórias
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contatos')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (_, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contact.image),
            ),
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ContactDetailScreen(contact: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
