import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/domain/category/models/category.dart';
import 'package:take_breath/domain/category/repositories/category_repository.dart';

final categoryProvider =
    NotifierProvider<CategoryNotifier, BaseState<List<Category>>>(
        () => CategoryNotifier());

class CategoryNotifier extends Notifier<BaseState<List<Category>>> {
  final CategoryRepository _repository = CategoryRepository();

  @override
  BaseState<List<Category>> build() => BaseState.initial();

  Future<void> getCategoryList() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final categories = await _repository.getCategoryList();
      state = state.copyWith(isLoading: false, data: categories);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
