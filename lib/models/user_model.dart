class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? gender;

  UserModel(
      {this.uid, this.email, this.firstName, this.secondName, this.gender});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        firstName: map['firstName'],
        secondName: map['secondName'],
        gender: map['gender']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'gender': gender,
    };
  }
}
