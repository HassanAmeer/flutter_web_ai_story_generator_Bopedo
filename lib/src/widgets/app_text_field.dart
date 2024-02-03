import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    this.borderColor,
    Key? key,
    this.hint,
    this.onTap,
    this.label,
    this.value,
    this.obscure = false,
    this.suffix,
    this.onSaved,
    this.onChanged,
    this.readonly = false,
    this.validator,
    this.keyboardType,
    this.floatLabel = false,
    this.textEditingController,
    this.isBold = false,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.fillColor,
    this.style,
    this.bottomPadding,
    this.focusedBorderColor,
    this.prefix,
    this.hintStyle,
    this.hintColor,
    this.showBorder = true,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 13,
      horizontal: 14,
    ),
    this.borderRadius,
    this.focusNode,
    this.inputFormatters,
    this.cursorColor,
    this.autoFillHints,
    this.magnifierConfiguration = TextMagnifierConfiguration.disabled,
  }) : super(key: key);

  final Color? cursorColor;
  final FocusNode? focusNode;
  final EdgeInsets contentPadding;
  final bool? isBold;
  final double? bottomPadding;
  final TextStyle? style;
  final bool? obscure;
  final String? hint;
  final String? label;
  final String? value;
  final bool readonly;
  final Widget? suffix;
  final bool? floatLabel;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final FormFieldSetter<String>? onSaved;
  final FormFieldSetter<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final int? maxLines;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final Color? focusedBorderColor;
  final Widget? prefix;
  final TextStyle? hintStyle;
  final Color? hintColor;
  final bool showBorder;
  final double? borderRadius;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final List<String>? autoFillHints;
  final TextMagnifierConfiguration magnifierConfiguration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? 12),
      child: TextFormField(
        magnifierConfiguration: magnifierConfiguration,
        autofillHints: autoFillHints,
        onTap: onTap,
        onSaved: onSaved,
        focusNode: focusNode,
        onChanged: onChanged,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        initialValue: value,
        maxLines: maxLines,
        readOnly: readonly,
        //minLines: minLines,
        validator: validator,
        obscureText: obscure ?? false,
        controller: textEditingController,
        scrollPadding: const EdgeInsets.all(100),
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white54),
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          prefixIcon: prefix,
          suffixIcon: suffix,
          labelText: label,
          hintText: hint ?? '',
          hintStyle: const TextStyle(
            color: Colors.white38,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white38,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color:
                  showBorder ? borderColor ?? Colors.black : Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white38,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
          filled: true,
          fillColor: const Color(0xff1a0f0d),
        ),
      ),
    );
  }
}
