class User {
  final int id;
  final String email;
  final String password;
  final String contact;

  User(this.id, this.email, this.password, this.contact);
  
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "password": password,
      "contact": contact
    };
  }
}