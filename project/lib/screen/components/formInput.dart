import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    super.key,
    required this.userController,
    required this.userFocusNode,
    required this.hintText,
    required this.icon,
  });

  final TextEditingController userController;
  final FocusNode userFocusNode;
  final String hintText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextFormField(
        controller: userController,
        focusNode: userFocusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.inter().copyWith(
            fontSize: 14.0,
            color: const Color(0xFF4C5252),
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(10.0),
            child: icon,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF176E6D), width: 0.5),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 2.0),
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        // validator: (name) => TValidation.validateEmail(name),
      ),
    );
  }
}
