import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/api_service.dart';
import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/counselor/repositories/counselor_repository.dart';

final counselorRepositoryProvider = Provider((ref) {
  return CounselorRepository(apiService: ApiService(dio: dio));
});
