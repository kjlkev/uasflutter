import 'package:flutter/material.dart';

class AppTextfield extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? errorText;
  final TextInputType textInputType;

  const AppTextfield({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.onChanged,
    this.errorText,
    required this.textInputType,
  });

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          autofocus: false,
          controller: widget.controller,
          onChanged: widget.onChanged,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: const TextStyle(fontSize: 16, color: Colors.black45),
              fillColor: Colors.white,
              filled: true,
              // prefixIcon text
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "\$ ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 5,
                minHeight: 5,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: Colors.grey, width: 1))),
        ),
      ],
    );
  }
}
