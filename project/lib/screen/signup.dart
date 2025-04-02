import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/bloc/user_bloc_bloc.dart';
import 'package:project/model/account.dart';
import 'package:project/screen/components/formInput.dart';
import 'package:project/screen/components/formInputPass.dart';
import 'package:project/screen/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _isObscured = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _dobController = TextEditingController();
  final _mobileController = TextEditingController();
  final _nicknameController = TextEditingController();

  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _passwordConfirmFocusNode = FocusNode();
  final FocusNode _fullnameFocusNode = FocusNode();
  final FocusNode _dobFocusNode = FocusNode();
  final FocusNode _mobileFocusNode = FocusNode();
  final FocusNode _nicknameFocusNode = FocusNode();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _fullnameController.dispose();
    _dobController.dispose();
    _mobileController.dispose();
    _nicknameController.dispose();
    _userFocusNode.dispose();
    _passwordFocusNode.dispose();
    _passwordConfirmFocusNode.dispose();
    _fullnameFocusNode.dispose();
    _dobFocusNode.dispose();
    _mobileFocusNode.dispose();
    _nicknameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBlocBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xffF1FCFA),
        appBar: AppBar(
          backgroundColor: const Color(0xffF1FCFA),
          leading: const BackButton(),
        ),
        body: BlocBuilder<UserBlocBloc, UserBlocState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: globalKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // todo [Image]
                      const Align(
                        child: Image(
                          image: AssetImage('assets/images/test.png'),
                          width: 200,
                          height: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // todo [TexField]
                      FormInput(
                        userController: _userController,
                        userFocusNode: _userFocusNode,
                        hintText: 'Email',
                        icon: const Icon(Icons.alternate_email_sharp),
                      ),

                      const SizedBox(
                        height: 15,
                      ),
                      FormInput(
                        userController: _nicknameController,
                        userFocusNode: _nicknameFocusNode,
                        hintText: 'Pháp danh',
                        icon: const Icon(Icons.person),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      FormInput(
                        userController: _fullnameController,
                        userFocusNode: _fullnameFocusNode,
                        hintText: 'Họ tên',
                        icon: const Icon(Icons.person),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FormInput(
                        userController: _dobController,
                        userFocusNode: _dobFocusNode,
                        hintText: 'Năm sinh',
                        icon: const Icon(Icons.calendar_today),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FormInput(
                        userController: _mobileController,
                        userFocusNode: _mobileFocusNode,
                        hintText: 'Số điện thoại',
                        icon: const Icon(Icons.phone),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: FormInputPass(
                          passwordController: _passwordController,
                          passwordFocusNode: _passwordFocusNode,
                          isObscured: _isObscured,
                          hintText: "Mật khẩu",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: FormInputPass(
                          passwordController: _passwordConfirmController,
                          passwordFocusNode: _passwordConfirmFocusNode,
                          isObscured: _isObscured,
                          hintText: "Nhập lại mật khẩu",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // todo [Sign In Btn]
                      ElevatedButton(
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            context.read<UserBlocBloc>().add(
                                  RegisterEvent(
                                    newAccount: Account(
                                      fullname: _fullnameController.text,
                                      phone: _mobileController.text,
                                      email: _userController.text,
                                      password: _passwordController.text,
                                      passwordConfirmation:
                                          _passwordConfirmController.text,
                                      dharmaName: _nicknameController.text,
                                      birthday: _dobController.text,
                                    ),
                                  ),
                                );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF21ABA6),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              "Đăng Ký",
                              style: GoogleFonts.roboto().copyWith(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
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
                              color: const Color(0xFF596061),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              "Đăng nhập",
                              style: GoogleFonts.roboto().copyWith(
                                fontSize: 14.0,
                                color: const Color(0xFF176E6D),
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
            );
          },
        ),
      ),
    );
  }
}
