import 'package:freezed_annotation/freezed_annotation.dart';
import 'record_item.dart';

part 'recorder_state.freezed.dart';

@freezed
class RecorderState with _$RecorderState {
  const factory RecorderState({
    required List<RecordItem> records,
    required String filterType,
    required DateTime? selectedDate,
    required bool isLoading,
    required String? error,
  }) = _RecorderState;

  factory RecorderState.initial() => const RecorderState(
        records: [],
        filterType: 'all',
        selectedDate: null,
        isLoading: false,
        error: null,
      );
}
