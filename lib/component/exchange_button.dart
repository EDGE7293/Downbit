import 'package:flutter/material.dart';
import 'package:downbit/const/color.dart';

class ExchangeButton extends StatelessWidget {
  final ButtonStyle ebst = ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
  final TextStyle ts = TextStyle(color: Colors.white);


   ExchangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(flex: 4),
        ElevatedButton(
          onPressed: () {},
          style: ebst,
          child: Text(
            '거래소',
            style: ts.copyWith(color: PRIMARY_COLOR),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ebst.copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(PRIMARY_COLOR),
          ),
          child: Text(
            'NFT',
            style: ts,
          ),
        ),
        Spacer(flex: 1),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.message),
          color: Colors.white,
        ),
      ],
    );
  }
}
