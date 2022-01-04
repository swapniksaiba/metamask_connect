import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PopUpScreen extends StatefulWidget {
  const PopUpScreen({Key? key}) : super(key: key);

  @override
  _PopUpScreenState createState() => _PopUpScreenState();
}

class _PopUpScreenState extends State<PopUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Column(
              children: [
                Image.asset('assets/animations/unboxing.gif'),
                SizedBox(height: 32),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Close',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
