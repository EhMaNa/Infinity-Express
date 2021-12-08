
class Person {
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;

  Person({
    this.id,
   this.name,
    this.email,
    this.phoneNumber,
  });

  
  static Person fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['dateJoined'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber
    };
    return map;
  }
}
