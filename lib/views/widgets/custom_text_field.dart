// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../Helpers/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.keyboardType,
    this.isAmount = true,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isAmount;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.number,
      validator: isAmount
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an $label'.toUpperCase();
              }
              if (double.tryParse(value) == null) {
                return 'Please Enter Only Number'.toUpperCase();
              }
              return null;
            }
          : (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an $label'.toUpperCase();
              }
              if (value.length <= 3) {
                return '$label should be more than 3 characters '.toUpperCase();
              }
              return null;
            },
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: cLight.withOpacity(.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
