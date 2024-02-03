import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDropdownButton<T> extends StatefulWidget {
  const AppDropdownButton({
    Key? key,
    this.label,
    this.value,
    this.items,
    this.onSaved,
    this.onChanged,
    this.readOnly = false,
    this.validate = true,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 13,
      horizontal: 14,
    ),
    this.fillColor = Colors.white,
  }) : super(key: key);

  final T? value;
  final String? label;
  final ValueSetter<T?>? onSaved;
  final ValueChanged<T?>? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final bool readOnly;
  final bool validate;
  final EdgeInsets contentPadding;
  final Color fillColor;

  @override
  State<AppDropdownButton<T>> createState() => _AppDropdownButtonState<T>();
}

class _AppDropdownButtonState<T> extends State<AppDropdownButton<T>> {
  T? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(covariant AppDropdownButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _value = widget.value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<T>(
        style: const TextStyle(color: Colors.white70),
        dropdownColor: Colors.grey.shade900,
        isExpanded: true,
        value: _value,
        items: widget.items,
        onSaved: widget.onSaved,
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: widget.readOnly
              ? const SizedBox()
              : const Icon(CupertinoIcons.chevron_down, size: 16),
        ),
        validator: widget.validate
            ? (T? value) {
                if (value == null) {
                  return "This field is required";
                } else if (value is String && (value).isEmpty) {
                  return "This field is required";
                } else {
                  return null;
                }
              }
            : null,
        onChanged: (v) {
          _value = v;
          setState(() {});
          if (widget.onChanged != null) {
            widget.onChanged!(v);
          }
        },
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          filled: true,
          labelText: widget.label,
          labelStyle: const TextStyle(color: Colors.white54),
          fillColor: const Color(0xff1a0f0d),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white38, width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white38, width: 1),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
        ),
      ),
    );
  }
}
