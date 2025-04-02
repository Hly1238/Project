class AccountModel {
  final String fullname;
  final String phone;
  final String email;
  final String password;
  final String password_confirmation;
  final String dharma_name;
  final String birthday;

  AccountModel({
    required this.fullname,
    required this.phone,
    required this.email,
    required this.password,
    required this.password_confirmation,
    required this.dharma_name,
    required this.birthday,
  });
  @override
  String toString() {
    // TODO: implement toString
    return '$fullname - $password';
  }

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "phone": phone,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
        "dharma_name": dharma_name,
        "birthday": birthday
      };
}
