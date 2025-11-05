import 'package:take_breath/domain/point/models/point_model.dart';

import '../../../_core/utils/api_service.dart';
import '../../../_core/utils/formatTime.dart';

class PointRepository {
  final ApiService _api;

  PointRepository(this._api);

  // 내 포인트 잔액 조회
  Future<int> getBalance() async {
    final data = await _api.get('/points/balance');
    return data['point'];
  }

  // 포인트 내역 조회
  Future<List<PointTransaction>> getHistory({
    int page = 0,
    int size = 10,
  }) async {
    final data = await _api.get(
      '/points/history',
      queryParameters: {'page': page, 'size': size},
    );

    final List<dynamic> content = data['content'];

    return content.map((json) {
      return PointTransaction(
        id: json['id'],
        amount: json['amount'],
        type: json['type'] == 'CHARGE' ? 'charge' : 'use',
        dateTime: FormatTime.parseKoreanFormat(json['createdAt']),
        description: json['description'] ?? '포인트 내역',
      );
    }).toList();
  }
}






