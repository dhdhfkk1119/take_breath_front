import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/api_service.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import '../repositories/point_repository.dart';

final pointRepositoryProvider = Provider<PointRepository>((ref) {
  final apiService = ApiService(dio: dio);
  return PointRepository(apiService);
});