class Account {
  final String fullname;
  final String phone;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String dharmaName;
  final String birthday;

  Account({
    required this.fullname,
    required this.phone,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.dharmaName,
    required this.birthday,
  });
  @override
  String toString() {
    return '$fullname - $password';
  }

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "phone": phone,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "dharma_name": dharmaName,
        "birthday": birthday
      };
}
