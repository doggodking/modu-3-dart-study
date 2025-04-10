import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-04/dto/mask_store_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/dto/mask_store_response_dto.dart';

import 'mask_store_data_source.dart';

class MaskStoreDataSourceImpl implements MaskStoreDataSource {
  final String _url;

  MaskStoreDataSourceImpl({required String url}) : _url = url;

  @override
  Future<List<MaskStoreDto>> fetchMaskStores() async {
    if (_url.endsWith('.json')) {
      return _fetchFromJsonFile();
    } else {
      return _fetchFromApi();
    }
  }

  Future<http.Response> _fetchData() async {
    final http.Client client = http.Client();
    try {
      final response = await client.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('데이터 로드 실패: ${response.statusCode}');
      }
    } finally {
      client.close();
    }
  }

  Future<List<MaskStoreDto>> _fetchFromJsonFile() async {
    final response = await _fetchData();
    final responseDto = MaskStoreResponseDto.fromJson(
      json.decode(utf8.decode(response.bodyBytes)),
    );
    return responseDto.stores;
  }

  Future<List<MaskStoreDto>> _fetchFromApi() async {
    final response = await _fetchData();
    return _parseJson(response.body);
  }

  List<MaskStoreDto> _parseJson(String responseBody) {
    try {
      final dynamic jsonResponse = json.decode(responseBody);
      if (jsonResponse is List) {
        return jsonResponse.map((json) => MaskStoreDto.fromJson(json)).toList();
      } else if (jsonResponse is Map) {
        return [MaskStoreDto.fromJson(jsonResponse.cast<String, dynamic>())];
      } else {
        throw Exception('Unexpected JSON format');
      }
    } catch (e) {
      throw Exception('JSON 파싱 오류: $e');
    }
  }
}
