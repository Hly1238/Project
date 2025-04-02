import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/bloc/user_bloc_bloc.dart';

import 'package:project/screen/components/formInput.dart';
import 'package:project/screen/components/formInputPass.dart';
import 'package:project/screen/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _isObscured = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    _userFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1FCFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffF1FCFA),
        leading: const BackButton(),
      ),
      body: BlocBuilder<UserBlocBloc, UserBlocState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              children: [
                Form(
                  key: globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // todo [Image]
                      const Align(
                        child: Image(
                          image: AssetImage('assets/images/test.png'),
                          width: 300,
                          height: 300,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // todo [Login TexField]
                      FormInput(
                        userController: _userController,
                        userFocusNode: _userFocusNode,
                        hintText: 'Email',
                        icon: const Icon(Icons.alternate_email_sharp),
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

                      // todo [Sign In Btn]
                      ElevatedButton(
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            context.read<UserBlocBloc>().add(
                                  LoginEvent(
                                    username: _userController.text,
                                    password: _passwordController.text,
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
                      const SizedBox(
                        height: 15,
                      ),

                      // todo [Sign up]
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bạn chưa có tài khoản? ",
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
                                  builder: (context) => const Signup(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              "Đăng ký",
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
                state is LoadingState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(),
                state is SuccessState
                    ? CupertinoAlertDialog(
                        title: const Text("Đăng nhập"),
                        content: Text(state.message),
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }

  // await Account().register(
  //   account: AccountModel(
  //       fullname: 'Khanhtran2',
  //       phone: '0909272410',
  //       email: 'kylekhanh@gmail.com',
  //       password: '123456',
  //       password_confirmation: '123456',
  //       dharma_name: 'Tâm Phật',
  //       birthday: '2024-01-01'),
  // );
}
