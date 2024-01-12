import 'package:flutter/material.dart';
import 'package:module_10_assignment/buttonAndText.dart';
import 'package:module_10_assignment/myDialog.dart';
import 'package:module_10_assignment/variables.dart';


class MyBagPage extends StatefulWidget {
  const MyBagPage({super.key});

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 93,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total amount',
                    style: TextStyle(color: Color(0xFF9B9B9B)),
                  ),
                  const Spacer(),
                  Text('$totalAmount\$',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      //
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Center(
                              child: Text(
                            'Congratulation',
                            style: TextStyle(color: Colors.black),
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
                      minimumSize: (MediaQuery.sizeOf(context).width > 370)
                          ? const Size(343, 48)
                          : const Size(250, 48),
                    ),
                    child: const Text('CHECK OUT')),
              ],
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Bag',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
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
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 107,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
          children: [
        SizedBox(
          height: 104,
          width: 104,
          child: Image.asset(
            products[index]['image'],
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 11,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 11),
            Text(
              '${products[index]['name']}',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222222)),
            ),
            Row(
              children: [
                myRichText1(index),
                const SizedBox(
                  width: 13
                ),
                myRichText2(index),
              ],
            ),
            const SizedBox(
              height: 5
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (products[index]['quantity'] > 0) {
                        products[index]['quantity'] -= 1;
                        totalAmount -= products[index]['price'] as int;
                      }
                      setState(() {});
                    },
                    style: elevatedButton(),
                    child: const Icon(
                      Icons.remove,
                      size: 24,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      '${products[index]['quantity']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    )),
                ElevatedButton(
                    onPressed: () {
                      products[index]['quantity'] += 1;
                      totalAmount += products[index]['price'] as int;
                      if (products[index]['quantity'] == 5) {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: myDialog(index: index,),
                          ),
                        );
                      }
                      setState(() {});
                    },
                    style: elevatedButton(),
                    child: const Icon(
                      Icons.add,
                      size: 24,
                    )),
              ],
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            moreVertButton(),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${products[index]['price']}\$',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )
          ],
        ),
      ]),
    );
  }

}
