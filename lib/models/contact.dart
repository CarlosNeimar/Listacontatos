class Contact {
  final String name;
  final String phone;
  final String email;

  Contact({required this.name, required this.phone, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
    );
  }
}
