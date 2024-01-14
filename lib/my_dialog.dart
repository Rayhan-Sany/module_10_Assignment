import 'package:flutter/material.dart';
import 'package:module_10_assignment/variables.dart';

class MyDialog extends StatelessWidget {
 final int index;
   const MyDialog({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Container(
      height: s.height/2.6,//254,
      width: s.width/1.4, //284,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(s.height/40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Padding(
            padding: EdgeInsets.all( s.height/40//20.0
            ),
            child: Text(
              'Congratulation',
              style: TextStyle(
                  fontSize: s.height/34,//21,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
                vertical:s.height/45 ,//18
            ),
            child: Column(
              children: [
                 Text('You Have Added',style: TextStyle(fontSize:s.height/40),),
                Text('5',style: TextStyle(fontSize:s.height/40),),
                Text(
                    '${products[index]['name']} on your Bag!',style: TextStyle(fontSize:s.height/40),),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: s.height/44//18.0
            ),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    fixedSize:  Size(s.width/1.5,//239,
                       s.height/17.39 //46
                    ),
                    backgroundColor:
                    const Color(0xFFDB3022),
                    foregroundColor: Colors.white,
                    surfaceTintColor:
                    const Color(0xFFDB3022),
                    shape: const StadiumBorder()),
                child: Text('OKAY',style: TextStyle(fontSize:s.height/44),)),
          ),
        ],
      ),
    );
  }
}
