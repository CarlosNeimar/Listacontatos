import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/contact.dart';

class ContactService {
  static const String _key = 'contacts';

  static Future<List<Contact>> getContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data != null) {
      final List decoded = json.decode(data);
      return decoded.map((e) => Contact.fromMap(e)).toList();
    }
    return [];
  }

  static Future<void> saveContacts(List<Contact> contacts) async {
    final prefs = await SharedPreferences.getInstance();
    final data = json.encode(contacts.map((c) => c.toMap()).toList());
    await prefs.setString(_key, data);
  }
}
