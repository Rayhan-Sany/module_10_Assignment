import 'package:flutter/material.dart';
import 'package:module_10_assignment/variables.dart';
ButtonStyle elevatedButton () {
  return ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      backgroundColor: Colors.white,
      fixedSize: const Size(36, 36),
      elevation: 6,
      foregroundColor: Colors.grey,
      padding: const EdgeInsets.all(6),
      surfaceTintColor: Colors.white);
}
IconButton moreVertButton(){
  return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.more_vert,
        color: Colors.grey,
      ));
}
RichText myRichText1(int index){
  return RichText(
    text: TextSpan(
        text: 'Color: ',
        style: const TextStyle(
          color: Color(0xFF9B9B9B),
        ),
        children: [
          TextSpan(
            text: '${products[index]['color']}',
            style: const TextStyle(
              color: Color(0xFF222222),
            ),
          ),
        ]),
  );
}
RichText myRichText2(int index){
  return  RichText(
    text: TextSpan(
        text: 'Size: ',
        style: const TextStyle(
          color: Color(0xFF9B9B9B),
        ),
        children: [
          TextSpan(
            text: '${products[index]['size']}',
            style: const TextStyle(
              color: Color(0xFF222222),
            ),
          ),
        ]),
  );
}