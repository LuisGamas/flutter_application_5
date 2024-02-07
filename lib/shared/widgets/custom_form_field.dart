import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomFormField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final bool showPasswordButton;
  final bool? enabled;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.showPasswordButton = false,
    this.enabled = true,
    this.onChanged,
    this.validator,
  });

  @override
  CustomFormFieldState createState() => CustomFormFieldState();
}

class CustomFormFieldState extends State<CustomFormField> {
  
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );

    return TextFormField(
      onChanged: widget.onChanged,
      validator: widget.validator,
      obscureText: _obscureText,
      enabled: widget.enabled,
      decoration: InputDecoration(
        label: widget.label != null ? Text(widget.label!) : null,
        hintText: widget.hint,
        errorText: widget.errorMessage,
        focusColor: colors.primary,
        enabledBorder: border.copyWith(borderSide: BorderSide(color: colors.outline)),
        disabledBorder: border.copyWith(borderSide: BorderSide(color: colors.surfaceVariant)),
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: colors.error)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: colors.error)),
        suffixIcon: widget.showPasswordButton
            ? IconButton(
                icon: Icon(_obscureText ? Ionicons.eye_outline : Ionicons.eye_off_outline),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}