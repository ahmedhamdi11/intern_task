import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_task/presentation/styles/colors.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    this.suffix,
    this.hint,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.autofocus = false,
    this.inputFormatters,
    this.controller,
  });
  final Widget? suffix;
  final String? hint;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.28),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        cursorColor: AppColor.primaryColor,
        autofocus: autofocus,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: suffix,
          ),
          suffixIconConstraints: const BoxConstraints(maxHeight: 42),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFFB1B1B1),
            fontSize: 10,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
