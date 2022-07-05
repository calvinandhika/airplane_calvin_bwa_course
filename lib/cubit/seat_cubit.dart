// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    emit(List.from(state));
  }

  bool isSelected(String id) {
    if (state.contains(id)) {
      return true;
    } else {
      return false;
    }
  }
}
