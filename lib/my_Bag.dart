import 'package:flutter/material.dart';
import 'package:module_10_assignment/button_and_text.dart';
import 'package:module_10_assignment/widgets.dart';
import 'package:module_10_assignment/variables.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({super.key});

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    totalAmount = calculateTotalAmount();
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(context, totalAmount),
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: myAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(
            left: s.shortestSide / 25.5, right: s.shortestSide / 35, bottom: s.shortestSide / 22.5),
        //16.0
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Bag',
              style: TextStyle(
                  fontSize: s.longestSide / 20, //40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: s.longestSide / 80

                ///10
                ),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  itemBuilder: (context, index) => myList(index),
                  itemCount: products.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container myList(int index) {
    Size s = MediaQuery.sizeOf(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.sizeOf(context).longestSide / 6.6,
      //107,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: s.longestSide / 70.1428 //14
          ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(s.longestSide / 100 //8
            ),
      ),
      child: Row(children: [
        SizedBox(
          height: s.longestSide / 6.6, //104,
          width: s.longestSide / 7, //104,
          child: Image.asset(
            products[index]['image'],
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: s.shortestSide / 37.4545, //11,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: s.longestSide / 72.72 //11
                ),
            Text(
              '${products[index]['name']}',
              style: TextStyle(
                  fontSize: s.longestSide / 45, //16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF222222)),
            ),
            Row(
              children: [
                myRichText1(index, context),
                SizedBox(width: s.shortestSide / 27.70 //13
                    ),
                myRichText2(index, context),
              ],
            ),
            SizedBox(height: s.longestSide / 125 //5
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (products[index]['quantity'] > 1) {
                        products[index]['quantity'] -= 1;
                        totalAmount -= products[index]['price'] as int;
                      }
                      setState(() {});
                    },
                    style: elevatedButton(context),
                    child: Icon(Icons.remove, size: s.longestSide / 33.33 //24,
                        )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: s.shortestSide / 60 //5
                      ),
                  child: Text(
                    '${products[index]['quantity']}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: s.longestSide / 37.44 //18
                        ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (products[index]['quantity'] < 10) {
                      products[index]['quantity'] += 1;
                      totalAmount += products[index]['price'] as int;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Center(
                          child: Text(
                              'You Can\'t Buy More Than 10 ${products[index]['name']} At a Time',
                          style: TextStyle(color:Colors.black,fontSize:s.longestSide/48),),
                        ),
                        backgroundColor:Colors.white,
                      ),
                      );
                    }
                    if (products[index]['quantity'] == 5) {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: MyDialog(
                            index: index,
                          ),
                        ),
                      );
                    }
                    setState(() {});
                  },
                  style: elevatedButton(context),
                  child: Icon(Icons.add, size: s.longestSide / 33.33),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            moreVertButton(context),
            SizedBox(height: s.longestSide / 34),
            Text(
              '${products[index]['price'] * products[index]['quantity']}\$',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: s.longestSide / 38.36),

              ///22
            )
          ],
        ),
      ]),
    );
  }
}
