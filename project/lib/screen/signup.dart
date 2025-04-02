import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/screen/components/formInput.dart';
import 'package:project/screen/components/passFormInput.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var _isObscured = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _nicknameController = TextEditingController();
  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1FCFA),
      appBar: AppBar(
        backgroundColor: Color(0xffF1FCFA),
        leading: BackButton(),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Form(
            key: globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // todo [Image]
                Align(
                  child: Image(
                    image: AssetImage('images/test.png'),
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // todo [Login TexField]
                // [Email]
                FormInput(
                  userController: _userController,
                  userFocusNode: _userFocusNode,
                  hintText: 'Email',
                  icon: Icon(Icons.alternate_email_sharp),
                ),
                SizedBox(
                  height: 15,
                ),
                FormInput(
                  userController: _nicknameController,
                  userFocusNode: _userFocusNode,
                  hintText: 'Pháp danh',
                  icon: Icon(Icons.person),
                ),
                SizedBox(
                  height: 15,
                ),
                FormInput(
                  userController: _fullnameController,
                  userFocusNode: _userFocusNode,
                  hintText: 'Họ tên',
                  icon: Icon(Icons.person),
                ),
                SizedBox(
                  height: 15,
                ),
                FormInput(
                  userController: _dobController,
                  userFocusNode: _userFocusNode,
                  hintText: 'Năm sinh',
                  icon: Icon(Icons.calendar_today),
                ),
                SizedBox(
                  height: 15,
                ),
                FormInput(
                  userController: _mobileController,
                  userFocusNode: _userFocusNode,
                  hintText: 'Số điện thoại',
                  icon: Icon(Icons.phone),
                ),
                SizedBox(
                  height: 15,
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: PassFormInput(
                    passwordController: _passwordController,
                    passwordFocusNode: _passwordFocusNode,
                    isObscured: _isObscured,
                    hintText: "Mật khẩu",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: PassFormInput(
                    passwordController: _passwordConfirmController,
                    passwordFocusNode: _passwordFocusNode,
                    isObscured: _isObscured,
                    hintText: "Nhập lại mật khẩu",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                // todo [Sign In Btn]
                InkWell(
                  onTap: () => {if (globalKey.currentState!.validate()) {}},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF21ABA6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Đăng Nhập",
                        style: GoogleFonts.roboto().copyWith(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // todo [Sign up]
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bạn đã có tài khoản? ",
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 14.0,
                        color: Color(0xFF596061),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .pushReplacementNamed(Routes.sign_up);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "Đăng nhập",
                        style: GoogleFonts.roboto().copyWith(
                          fontSize: 14.0,
                          color: Color(0xFF176E6D),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
