import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PassFormInput extends StatefulWidget {
  PassFormInput({
    super.key,
    required TextEditingController passwordController,
    required FocusNode passwordFocusNode,
    required bool isObscured,
    required String hintText,
  })  : _passwordController = passwordController,
        _passwordFocusNode = passwordFocusNode,
        _isObscured = isObscured,
        hintText = hintText;

  final TextEditingController _passwordController;
  final FocusNode _passwordFocusNode;
  bool _isObscured;
  final String hintText;
  @override
  _PassFormInputState createState() => _PassFormInputState();
}

class _PassFormInputState extends State<PassFormInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._passwordController,
      focusNode: widget._passwordFocusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.inter().copyWith(
          fontSize: 14.0,
          color: Color(0xFF4C5252),
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Container(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.lock_outline_rounded),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 12.0),
          child: IconButton(
            icon: Icon(
              widget._isObscured ? Icons.visibility : Icons.visibility_off,
              color: Color(0xAAAA000000),
            ),
            onPressed: () {
              setState(() {
                widget._isObscured = !widget._isObscured;
              });
            },
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF176E6D), width: 0.5),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 2.0),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: (value) => TValidation.validatePassword(value),
      obscureText: widget._isObscured,
      // onEditingComplete: () => TextInput.finishAutofillContext(),
    );
  }
}
