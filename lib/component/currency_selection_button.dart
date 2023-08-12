import 'package:flutter/material.dart';

class CurrencySelectionButton extends StatelessWidget {
  const CurrencySelectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        TextButton(
          onPressed: () {},
          child: Text('KRW'),
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: Colors.blue)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder()),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('BTC',style: TextStyle(color: Colors.grey),),
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: Colors.grey)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder()),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('USDT',style: TextStyle(color: Colors.grey)),
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: Colors.grey)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder()),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('관심',style: TextStyle(color: Colors.grey)),
          style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: Colors.grey)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder()),
          ),
        ),
      ],
    );
  }
}
