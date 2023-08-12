import 'package:flutter/material.dart';

class TabbarMenu extends StatelessWidget {
  const TabbarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {

                },
                child: Row(
                  children: [
                    Text('한글명', style: TextStyle(color: Colors.white)),
                    Icon(Icons.sync_alt, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {

                },
                child: Row(
                  children: [
                    Text('현재가', style: TextStyle(color: Colors.white)),
                    Icon(Icons.swap_vert, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // 여기에 현재가 버튼을 눌렀을 때의 동작을 넣으세요
                },
                child: Row(
                  children: [
                    Text('전일대비', style: TextStyle(color: Colors.white)),
                    Icon(Icons.swap_vert, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {

                },
                child: Row(
                  children: [
                    Text('거래대금', style: TextStyle(color: Colors.white)),
                    Icon(Icons.swap_vert, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
