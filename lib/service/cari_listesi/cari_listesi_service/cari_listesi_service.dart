import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:selpar/core/enum/url_enum.dart';
import 'package:selpar/service/cari_listesi/cari_listesi_model/cari_listesi_service_model.dart';

class CariListesiService {
  final Dio _dio = Dio();

  Future<List<CariData>> getCariListesiData() async {
    final Response response = await _dio.get(UrlEnum.urlCariListesi.url);
    if (response.statusCode != 200 || response.data == null) {
      return [CariData()];
    }
    final jsonBody =
        CariListesiServiceModel.fromJson(jsonDecode(response.data));

    return jsonBody.data!;
  }
}
