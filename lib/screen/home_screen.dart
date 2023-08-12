import 'dart:async';
import 'package:downbit/component/currency_selection_button.dart';
import 'package:downbit/component/exchange_button.dart';
import 'package:downbit/component/financial_profit.dart';
import 'package:downbit/component/search_coins.dart';
import 'package:downbit/const/color.dart';
import 'package:downbit/service/websocket_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../component/tabbar_menu.dart';
import '../repository/market_code_repository.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void>? _initialLoad;
  List<MarketCode> marketCodes = [];

  Map<String, dynamic> liveData = {}; // 실시간 데이터 저장용
  List<StreamSubscription> _subscriptions = [];


  @override
  void initState() {
    super.initState();
    _initialLoad = _loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initialLoad,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: PRIMARY_COLOR,
            body: SafeArea(
              child: renderCustomScrollView(),
            ),
          );
        } else {
        return renderIndicator();
        }
      },
    );
  }

  Widget renderIndicator(){
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16,),
              Text('정보를 불러오는 중입니다.', style: TextStyle(color: Colors.white),)
            ],
          ),
        )
    );
  }

  Future<void> _loadInitialData() async {
    final market_code_repository = MarketCodeRepository();
    int requestCount = 0;

    WebSocketService _webSocketService = WebSocketService();
    List<StreamSubscription> _subscriptions = [];

    try {
      final fetchedMarketCodes = await market_code_repository.fetchMarketCodes();
      List<MarketCode> tempMarketCodes = [];

      for (var marketCode in fetchedMarketCodes) {
        if (!marketCode.markecode.startsWith("KRW-")) {
          continue;
        }

        if (requestCount >= 30) {
          await Future.delayed(Duration(seconds: 1));
          requestCount = 0;
        }



        tempMarketCodes.add(marketCode);  // 임시 리스트에 마켓 코드 추가
        requestCount++;

        // WebSocket 연결 및 데이터 업데이트
        _subscriptions.add(
            _webSocketService.connect(codes: [marketCode.markecode]).listen(
                    (data) {
                  try {
                    String decodedString = utf8.decode(data);  // 데이터를 문자열로 변환
                    print("Decoded WebSocket Data: $decodedString"); // 변환된 데이터를 출력
                    setState(() {
                      liveData[marketCode.markecode] = json.decode(decodedString);
                    });
                  } catch (e) {
                    print("Error processing WebSocket data: $e");
                  }
                },
                onError: (error) {
                  print("WebSocket Error: $error");
                }
            )
        );
      }

      // 상태 변경 (리스트에 데이터 할당)
      setState(() {
        marketCodes = tempMarketCodes;
      });

    } catch (e) {
      print('Error: $e');
    }
  }



  @override
  void dispose() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }


  CustomScrollView renderCustomScrollView() {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ExchangeButton(),
              SearchCoins(),
              FinancialProfit(),
              CurrencySelectionButton(),
            ],
          ),
        ),
        SliverPersistentHeader(
          delegate: _SliverAppBarDelegate(TabbarMenu()),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              String market = marketCodes[index].markecode;
              var price = liveData[market]?['trade_price'] ?? "Loading...";

              return Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(marketCodes[index].koreanName, style: TextStyle(color: Colors.white),),
                    Text("$price", style: TextStyle(color: Colors.white),), // 실시간 가격을 표시
                  ],
                ),
              );
            },
            childCount: marketCodes.length,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 1000.0),
          ),
        ),
      ],
    );
  }






}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverAppBarDelegate(this.child);

  @override
  double get minExtent => 50.0;
  @override
  double get maxExtent => 50.0;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return SizedBox.expand(child: Container(
      color: PRIMARY_COLOR,
      child: child,
    ));
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}