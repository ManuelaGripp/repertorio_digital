import 'package:dio/dio.dart';

class VagalumeServices {
  String searchParams;
  VagalumeServices({
    required this.searchParams,
  });

  final dio = Dio();

  void getSong() async {
    final response = await dio
        .get('https://api.vagalume.com.br/search.artmus?$searchParams');
    print(response);
  }
}
