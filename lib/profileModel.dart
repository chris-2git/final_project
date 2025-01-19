class Profilemodel {
  final String firstname;
  final String lastname;
  final String dob;
  final String phone;
  final String email;
  final String address;
  final String gender;
  final String userid;
  final String photo;

  Profilemodel(
      {required this.firstname,
      required this.lastname,
      required this.dob,
      required this.phone,
      required this.email,
      required this.address,
      required this.gender,
      required this.userid,
      required this.photo});

  factory Profilemodel.fromJson(Map<String, dynamic> json) {
    return Profilemodel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      dob: json['dob'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      gender: json['gender'],
      userid: json['userid'],
      photo: json['photo'],
    );
  }
}
