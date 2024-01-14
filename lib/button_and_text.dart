import 'package:flutter/material.dart';
import 'package:module_10_assignment/variables.dart';
ButtonStyle elevatedButton (BuildContext context) {
  Size s = MediaQuery.sizeOf(context);
  return ElevatedButton.styleFrom(
      shape: const CircleBorder( ),
      backgroundColor: Colors.white,
       minimumSize:  Size( s.height/22.22//36
       , s.height/22.22//36
   ),
      elevation: 6,
      foregroundColor: Colors.grey,
     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
     padding:  EdgeInsets.all( s.height/150.33 //6
     ),
      surfaceTintColor: Colors.white);
}
IconButton moreVertButton(BuildContext context){
  Size s =MediaQuery.sizeOf(context);
  return IconButton(
      onPressed: () {},
      icon:  Icon(
        Icons.more_vert,
        color: Colors.grey,
        size: s.height/36,
      ));
}
RichText myRichText1(int index,BuildContext context){
  Size s = MediaQuery.sizeOf(context);
  return RichText(
    text: TextSpan(
        text: 'Color: ',
        style:  TextStyle(
          color: const Color(0xFF9B9B9B),
          fontSize: s.height/50
        ),
        children: [
          TextSpan(
            text: '${products[index]['color']}',
            style:  TextStyle(
              color: const Color(0xFF222222),
              fontSize: s.height/50
            ),
          ),
        ]),
  );
}
RichText myRichText2(int index,BuildContext context){
  Size s = MediaQuery.sizeOf(context);
  return  RichText(
    text: TextSpan(
        text: 'Size: ',
        style:  TextStyle(
          color: const Color(0xFF9B9B9B),
            fontSize: s.height/50
        ),
        children: [
          TextSpan(
            text: '${products[index]['size']}',
            style:  TextStyle(
              color: const Color(0xFF222222),
                fontSize: s.height/53
            ),
          ),
        ]),
  );
}