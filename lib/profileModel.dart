class ProfileModel {
  late String f_name;
  late String l_name;
  late String email;
  late int contact_no;
  late int license_no;
  late String gender;
  late String password;

  ProfileModel(
      {required this.f_name,
      required this.l_name,
      required this.email,
      required this.contact_no,
      required this.license_no,
      required this.gender,
      required this.password});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    f_name = json['f_name'];
    l_name = json['l_name'];
    email = json['email'];
    contact_no = json['contact_no'];
    license_no = json['license_no'];
    password = json['password'];
    gender = json['gender'];
  }
}
