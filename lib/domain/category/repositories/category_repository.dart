import 'package:take_breath/_core/utils/my_http.dart';
import 'package:take_breath/domain/category/models/category.dart';

class CategoryRepository {
  Future<List<Category>> getCategoryList() async {
    try {
      final response = await dio.get('/community/categories');
      if (response.statusCode == 200) {
        final List<Category> categories =
            (response.data['response'] as List<dynamic>)
                .map((json) => Category.fromJson(json))
                .toList();

        print("카테고리 리스트 : ${categories}");
        return categories;
      } else {
        throw Exception('카테고리 조회 실패');
      }
    } catch (e) {
      throw Exception("서버가 연결되어 있지 않습니다: $e");
    }
  }
}
