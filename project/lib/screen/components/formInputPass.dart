import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInputPass extends StatefulWidget {
  FormInputPass({
    super.key,
    required this.passwordController,
    required this.passwordFocusNode,
    required this.isObscured,
    required this.hintText,
  });

  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  bool isObscured;
  final String hintText;
  @override
  _FormInputPassState createState() => _FormInputPassState();
}

class _FormInputPassState extends State<FormInputPass> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      focusNode: widget.passwordFocusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.inter().copyWith(
          fontSize: 14.0,
          color: const Color(0xFF4C5252),
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Container(
          padding: const EdgeInsets.all(10.0),
          child: const Icon(Icons.lock_outline_rounded),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 12.0),
          child: IconButton(
            icon: Icon(
              widget.isObscured ? Icons.visibility : Icons.visibility_off,
              color: const Color(0xaaaa000000),
            ),
            onPressed: () {
              setState(() {
                widget.isObscured = !widget.isObscured;
              });
            },
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF176E6D), width: 0.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 2.0),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: (value) => TValidation.validatePassword(value),
      obscureText: widget.isObscured,
      // onEditingComplete: () => TextInput.finishAutofillContext(),
    );
  }
}
