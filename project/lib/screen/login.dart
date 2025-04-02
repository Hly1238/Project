import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/blocs/bloc.dart';
import 'package:project/blocs/event.dart';
import 'package:project/blocs/state.dart';
import 'package:project/models/account.dart';
import 'package:project/screen/components/formInput.dart';
import 'package:project/repos/account.dart';
import 'package:project/screen/components/passFormInput.dart';
import 'package:project/screen/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _isObscured = true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
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
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Stack(
              children: [
                Center(
                  child: Form(
                    key: globalKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // todo [Image]
                        Align(
                          child: Image(
                            image: AssetImage('/images/test.png'),
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
                        // Pass
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

                        // todo [Sign In Btn]
                        InkWell(
                          onTap: () => {
                            if (globalKey.currentState!.validate())
                              {
                                // HandleLogin(_userController.text,
                                //     _passwordController.text, context)
                                context.read<UserBloc>().add(LoginEvent(
                                    username: _userController.text,
                                    password: _passwordController.text))
                              }
                          },
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
                              "Bạn chưa có tài khoản? ",
                              style: GoogleFonts.roboto().copyWith(
                                fontSize: 14.0,
                                color: Color(0xFF596061),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signup(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "Đăng ký",
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
                state is LoadingState
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(),
                state is SuccessState
                    ? CupertinoAlertDialog(
                        title: new Text("Đăng nhập"),
                        content: new Text("${state.message}"),
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }

  void showAlert() async {
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
}
