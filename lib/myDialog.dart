import 'package:flutter/material.dart';
import 'package:module_10_assignment/variables.dart';

class myDialog extends StatelessWidget {
  int index;
   myDialog({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 254,
      width: 284,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Congratulation',
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 18),
            child: Column(
              children: [
                const Text('You Have Added'),
                const Text('5'),
                Text(
                    '${products[index]['name']} on your Bag!'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                    fixedSize: const Size(239, 46),
                    backgroundColor:
                    const Color(0xFFDB3022),
                    foregroundColor: Colors.white,
                    surfaceTintColor:
                    const Color(0xFFDB3022),
                    shape: const StadiumBorder()),
                child: const Text('OKAY')),
          ),
        ],
      ),
    );
  }
}
