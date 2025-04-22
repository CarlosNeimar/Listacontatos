import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/contact.dart';
import 'edit_contact_screen.dart';

class ContactDetailScreen extends StatelessWidget {
  final Contact contact;
  final int index;

  ContactDetailScreen({required this.contact, required this.index});

  void _launchPhone(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchSMS(String phone) async {
    final uri = Uri.parse('sms:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text('Telefone'),
              subtitle: Text(contact.phone),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () => _launchPhone(contact.phone),
                  ),
                  IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () => _launchSMS(contact.phone),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text(contact.email),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditContactScreen(
                      contact: contact,
                      index: index,
                    ),
                  ),
                ).then((value) {
                  if (value == true) {
                    Navigator.pop(context); // volta para lista
                  }
                });
              },
              icon: Icon(Icons.edit),
              label: Text('Editar'),
            ),
          ],
        ),
      ),
    );
  }
}
