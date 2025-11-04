import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// StateNotifier 정의
class ImageListNotifier extends StateNotifier<List<XFile>> {
  ImageListNotifier() : super([]);

  void addImages(List<XFile> newImages) {
    state = [...state, ...newImages].take(10).toList();
  }

  void removeImage(int index) {
    final list = [...state];
    list.removeAt(index);
    state = list;
  }

  void clear() {
    state = [];
  }
}

// Provider 정의
final imagePickerListProvider =
    StateNotifierProvider<ImageListNotifier, List<XFile>>(
        (ref) => ImageListNotifier());
