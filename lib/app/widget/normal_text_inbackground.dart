import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vuthy_mobile/app/theme/colors_theme.dart';


class NBtext extends StatelessWidget {
  NBtext({super.key ,required this.text});
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Text(text  , style:GoogleFonts.poppins(textStyle: TextStyle(color:AppColors.blackcolor , fontSize: 13 , )),) ;
  }
}
