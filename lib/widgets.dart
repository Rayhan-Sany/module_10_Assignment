import 'package:flutter/material.dart';
import 'package:module_10_assignment/button_and_text.dart';
import 'package:module_10_assignment/variables.dart';

class MyDialog extends StatelessWidget {
 final int index;
   const MyDialog({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Container(
      height: s.longestSide/2.6,//254,
      width: s.shortestSide/1.4, //284,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(s.longestSide/40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Padding(
            padding: EdgeInsets.all( s.longestSide/40//20.0
            ),
            child: Text(
              'Congratulation',
              style: TextStyle(
                  fontSize: s.longestSide/34,//21,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
                vertical:s.longestSide/45 ,//18
            ),
            child: Column(
              children: [
                 Text('You Have Added',style: TextStyle(fontSize:s.longestSide/40),),
                Text('5',style: TextStyle(fontSize:s.longestSide/40),),
                Text(
                    '${products[index]['name']} on your Bag!',style: TextStyle(fontSize:s.longestSide/40),),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: s.longestSide/44//18.0
            ),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    fixedSize:  Size(s.shortestSide/1.5,//239,
                       s.longestSide/17.39 //46
                    ),
                    backgroundColor:
                    const Color(0xFFDB3022),
                    foregroundColor: Colors.white,
                    surfaceTintColor:
                    const Color(0xFFDB3022),
                    shape: const StadiumBorder()),
                child: Text('OKAY',style: TextStyle(fontSize:s.longestSide/44),)),
          ),
        ],
      ),
    );
  }
}

Container bottomNavigationBar(BuildContext context,int totalAmount)
{
  Size s =MediaQuery.sizeOf(context);
  return Container(
    height: s.longestSide / 8.3, //93,
    padding: EdgeInsets.symmetric(horizontal: s.shortestSide / 24), //15

    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: s.shortestSide / 24),//15.0
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total amount',
                style: TextStyle(
                    color: const Color(0xFF9B9B9B),
                    fontSize: s.longestSide / 45),
              ),
              const Spacer(),
              Text('$totalAmount\$',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: s.longestSide / 44.44 //18
                ),),
            ],
          ),
        ),
        SizedBox(height: s.longestSide / 105), //10

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            checkOutButton(context),
          ],
        )
      ],
    ),
  );
}

PreferredSize myAppBar(BuildContext context){
  Size s = MediaQuery.sizeOf(context);
  return PreferredSize(
    preferredSize: Size.fromHeight(s.height/15),
    child: AppBar(
      backgroundColor:const Color(0xFFF9F9F9),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: s.shortestSide / 45), //8.0
          child: Icon(
            Icons.search,
            size: s.longestSide / 28,
          ),
        ),
      ],
    ),
  );
}