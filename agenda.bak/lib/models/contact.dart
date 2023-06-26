class Contact {
  final String id;
  final String name;
  final String email;
  final String phone;

  Contact({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });
}

typedef ContactMap = Map<String, String>;
