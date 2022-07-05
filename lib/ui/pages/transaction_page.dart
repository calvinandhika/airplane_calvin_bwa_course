import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_apps/cubit/transaction_cubit.dart';
import 'package:travel_apps/ui/widgets/transaction_card.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.isEmpty) {
            return const Center(
              child: Text('Kamu Belum Memiliki Transaksi'),
            );
          } else {
            return ListView.builder(
              itemCount: state.transactions.length,
              itemBuilder: (context, index) {
                return TransactionCard(state.transactions[index]);
              },
            );
          }
        }

        return const SizedBox(
          child: Text('Transaction Page'),
        );
      },
    );
  }
}
