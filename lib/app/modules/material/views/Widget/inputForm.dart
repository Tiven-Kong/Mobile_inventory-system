import 'package:flutter/material.dart';

import '../../../../theme/colors_theme.dart';
import '../../../../widget/normal_text_inbackground.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key, required this.controll_er, required this.tittle});

  final TextEditingController controll_er;
  final String tittle;

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: NBtext(text: widget.tittle),
          ),
          TextFormField(
            controller: widget.controll_er,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: AppColors.primarycolor,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),



        ],
      ),
    );
  }
}
