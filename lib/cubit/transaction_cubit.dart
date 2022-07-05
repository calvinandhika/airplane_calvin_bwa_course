import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_apps/models/transaction_model.dart';
import 'package:travel_apps/services/transaction_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction);
      emit(TransactionSuccess(transactions: []));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransaction() async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await TransactionService().fetchTransaction();
      emit(TransactionSuccess(transactions: transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
