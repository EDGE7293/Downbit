import 'package:flutter/material.dart';

import '../const/color.dart';

class FinancialProfit extends StatelessWidget {
  const FinancialProfit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SUB_COLOR,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '총매수',
                          style: TextStyle(
                              fontWeight: FontWeight.w100, color: Colors.white),
                        ),
                        Text(
                          '220',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '총평가',
                          style: TextStyle(
                              fontWeight: FontWeight.w100, color: Colors.white),
                        ),
                        Text(
                          '33',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '평가손익',
                        style: TextStyle(
                            fontWeight: FontWeight.w100, color: Colors.white),
                      ),
                      Text(
                        '-185',
                        style: TextStyle(
                            color: Colors.blue[900], fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '수익률',
                        style: TextStyle(
                            fontWeight: FontWeight.w100, color: Colors.white),
                      ),
                      Text(
                        '-84.68%',
                        style: TextStyle(
                            color: Colors.blue[900], fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
