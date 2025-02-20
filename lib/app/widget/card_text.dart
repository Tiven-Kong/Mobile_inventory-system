import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vuthy_mobile/app/theme/colors_theme.dart';


class CardText extends StatelessWidget {
  CardText({super.key ,required this.text});
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text , style:GoogleFonts.poppins(textStyle: TextStyle(color:AppColors.whitecolor, fontSize: 15 )),),

      ],
    ) ;

  }
}
