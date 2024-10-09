import 'package:flutter/material.dart';
import 'package:weightmagine/core/theme/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final bool obscureText;
  final VoidCallback ontap;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  final FormFieldValidator<String?> validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    required this.obscureText,
    required this.ontap,
    this.onChanged,
    required this.keyboardType,
    required this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      onTap: widget.ontap,
      controller: widget.controller,
      style: Theme.of(context).textTheme.displayMedium,
      validator: widget.validator,
      obscureText: widget.obscureText && !isPasswordVisible,
      keyboardType: widget.keyboardType,
      cursorHeight: 20,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.displayMedium,
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() => isPasswordVisible = !isPasswordVisible);
                },
                icon: Icon(isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
              )
            : widget.suffixIcon,
        suffixIconColor: AppColors.primaryColor,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: AppColors.primaryColor,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusColor: AppColors.primaryColor,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
