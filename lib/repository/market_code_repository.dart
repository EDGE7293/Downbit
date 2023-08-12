import 'package:dio/dio.dart';


class MarketCode {
  final String markecode;
  final String koreanName;
  final String englishName;

  MarketCode({required this.markecode, required this.koreanName, required this.englishName});

  factory MarketCode.fromJson(Map<String, dynamic> json) {
    return MarketCode(
      markecode: json['market'],
      koreanName: json['korean_name'],
      englishName: json['english_name'],
    );
  }
}

class MarketCodeRepository {
  final Dio _dio = Dio();

  Future<List<MarketCode>> fetchMarketCodes() async {
    try {
      final response = await _dio.get('https://api.upbit.com/v1/market/all');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        return jsonData.map((json) => MarketCode.fromJson(json)).toList();
      } else {
        throw Exception('마켓코드 가져오기 실패');
      }
    } catch (e) {
      throw Exception('마켓코드 가져오기 실패 $e');
    }
  }
}
