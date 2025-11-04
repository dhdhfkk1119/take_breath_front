import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'recorder_state.dart';
import 'record_item.dart';

class RecorderNotifier extends StateNotifier<RecorderState> {
  RecorderNotifier() : super(RecorderState.initial()) {
    _loadRecords();
  }

  void _loadRecords() {
    final testRecords = [
      const RecordItem(
        id: 1,
        title: "오늘도 힘든 하루였다",
        content: "상사의 부당한 지시로 인해...",
        date: "2024.01.15",
        imageCount: 2,
        audioCount: 1,
      ),
      const RecordItem(
        id: 2,
        title: "회의 중 불쾌한 발언",
        content: "성차별적인 발언을 들었다",
        date: "2024.01.14",
        imageCount: 0,
        audioCount: 2,
      ),
      const RecordItem(
        id: 3,
        title: "야근 강요 기록",
        content: "또 다시 야근을 강요당했다. 이번이 벌써...",
        date: "2024.01.13",
        imageCount: 1,
        audioCount: 0,
      ),
      const RecordItem(
        id: 4,
        title: "부당한 업무 지시",
        content: "내 업무 범위가 아닌데 계속 시킨다",
        date: "2024.01.12",
        imageCount: 3,
        audioCount: 1,
      ),
      const RecordItem(
        id: 5,
        title: "부당한 업무 지시",
        content: "내 업무 범위가 아닌데 계속 시킨다",
        date: "2024.01.12",
        imageCount: 3,
        audioCount: 1,
      ),
      const RecordItem(
        id: 6,
        title: "야근 강요 기록",
        content: "또 다시 야근을 강요당했다. 이번이 벌써...",
        date: "2024.01.13",
        imageCount: 1,
        audioCount: 0,
      ),
    ];

    state = state.copyWith(records: testRecords);
  }

  void setFilter(String filterType) {
    state = state.copyWith(filterType: filterType);
  }

  void setSelectedDate(DateTime? date) {
    state = state.copyWith(selectedDate: date);
  }

  List<RecordItem> getFilteredRecords() {
    List<RecordItem> filtered = state.records;

    if (state.selectedDate != null) {
      String selectedDateStr =
          "${state.selectedDate!.year}.${state.selectedDate!.month.toString().padLeft(2, '0')}.${state.selectedDate!.day.toString().padLeft(2, '0')}";
      filtered =
          filtered.where((record) => record.date == selectedDateStr).toList();
    }

    switch (state.filterType) {
      case 'week':
        filtered = filtered.where((record) {
          DateTime recordDate = _parseDate(record.date);
          DateTime now = DateTime.now();
          DateTime weekAgo = now.subtract(const Duration(days: 7));
          return recordDate.isAfter(weekAgo) && recordDate.isBefore(now);
        }).toList();
        break;
      case 'month':
        filtered = filtered.where((record) {
          DateTime recordDate = _parseDate(record.date);
          DateTime now = DateTime.now();
          return recordDate.year == now.year && recordDate.month == now.month;
        }).toList();
        break;
      case 'image':
        filtered = filtered.where((record) => record.imageCount > 0).toList();
        break;
      case 'audio':
        filtered = filtered.where((record) => record.audioCount > 0).toList();
        break;
      case 'all':
      default:
        break;
    }

    return filtered;
  }

  DateTime _parseDate(String dateStr) {
    List<String> parts = dateStr.split('.');
    return DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  Future<void> addRecord(RecordItem record) async {
    state = state.copyWith(isLoading: true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final updatedRecords = [...state.records, record];
      state = state.copyWith(
        records: updatedRecords,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  void deleteRecord(int id) {
    final updatedRecords =
        state.records.where((record) => record.id != id).toList();
    state = state.copyWith(records: updatedRecords);
  }

  void updateRecord(RecordItem updatedRecord) {
    final updatedRecords = state.records.map((record) {
      return record.id == updatedRecord.id ? updatedRecord : record;
    }).toList();
    state = state.copyWith(records: updatedRecords);
  }

  void reset() {
    state = RecorderState.initial();
    _loadRecords();
  }
}

// Riverpod Providers
final recorderProvider =
    StateNotifierProvider<RecorderNotifier, RecorderState>((ref) {
  return RecorderNotifier();
});

final filteredRecordsProvider = Provider<List<RecordItem>>((ref) {
  final notifier = ref.watch(recorderProvider.notifier);
  return notifier.getFilteredRecords();
});
