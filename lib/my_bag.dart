import 'package:flutter/material.dart';
import 'package:module_10_assignment/button_and_text.dart';
import 'package:module_10_assignment/my_dialog.dart';
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
    return Scaffold(
      bottomNavigationBar: Container(
        height: s.height / 8.3, //93,
        padding: EdgeInsets.symmetric(horizontal: s.width / 24), //15

        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: s.width / 24),//15.0
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total amount',
                    style: TextStyle(
                        color: const Color(0xFF9B9B9B),
                        fontSize: s.height / 45),
                  ),
                  const Spacer(),
                  Text('$totalAmount\$',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: s.height / 44.44 //18
                          ),),
                ],
              ),
            ),
            SizedBox(height: s.height / 105), //10

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      //
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Center(
                              child: Text(
                            'Congratulation',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: s.height / 45,
                            ),
                          )),
                          backgroundColor: Colors.white,
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFDB3022),
                        surfaceTintColor: const Color(0xFFDB3022),
                        foregroundColor: Colors.white,
                        minimumSize: Size(s.width * 0.85, s.height / 16.66)),
                    child: Text(
                      'CHECK OUT',
                      style: TextStyle(fontSize: s.height / 45),
                    )),
              ],
            )
          ],
        ),
      ),
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
            left: s.width / 22.5, right: s.width / 23.5, bottom: s.width / 22.5 ),
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
          height: s.height / 7, //104,
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
                      if (products[index]['quantity'] > 0) {
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
                    ),),
                ElevatedButton(
                    onPressed: () {
                      products[index]['quantity'] += 1;
                      totalAmount += products[index]['price'] as int;
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
            SizedBox(height: s.height / 25),
            Text(
              '${products[index]['price']}\$',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: s.height / 38.36),
                  ///22
            )
          ],
        ),
      ]),
    );
  }
}
