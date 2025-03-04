import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vuthy_mobile/app/theme/colors_theme.dart';


class Ntext extends StatelessWidget {
  Ntext({super.key ,required this.text});
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Text(text  , style:GoogleFonts.poppins(textStyle: TextStyle(color:AppColors.whitecolor , fontSize: 10 , fontWeight: FontWeight.bold)),) ;
  }
}
