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
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: s.width / 45), //8.0
            child: Icon(
              Icons.search,
              size: s.height / 28,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: s.width / 25.5, right: s.width / 35, bottom: s.width / 22.5),
        //16.0
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Bag',
              style: TextStyle(
                  fontSize: s.height / 20, //40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: s.height / 80

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
      height: MediaQuery.sizeOf(context).height / 6.6,
      //107,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: s.height / 70.1428 //14
          ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(s.height / 100 //8
            ),
      ),
      child: Row(children: [
        SizedBox(
          height: s.height / 6.6, //104,
          width: s.height / 7, //104,
          child: Image.asset(
            products[index]['image'],
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: s.width / 37.4545, //11,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: s.height / 72.72 //11
                ),
            Text(
              '${products[index]['name']}',
              style: TextStyle(
                  fontSize: s.height / 45, //16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF222222)),
            ),
            Row(
              children: [
                myRichText1(index, context),
                SizedBox(width: s.width / 27.70 //13
                    ),
                myRichText2(index, context),
              ],
            ),
            SizedBox(height: s.height / 125 //5
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
                    child: Icon(Icons.remove, size: s.height / 33.33 //24,
                        )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: s.width / 60 //5
                      ),
                  child: Text(
                    '${products[index]['quantity']}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: s.height / 37.44 //18
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
                          style: TextStyle(color:Colors.black,fontSize:s.height/48),),
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
                  child: Icon(Icons.add, size: s.height / 33.33),
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
            SizedBox(height: s.height / 34),
            Text(
              '${products[index]['price'] * products[index]['quantity']}\$',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: s.height / 38.36),

              ///22
            )
          ],
        ),
      ]),
    );
  }
}
