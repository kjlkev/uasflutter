import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:metamask/data/model/saldo_model.dart';
import 'package:metamask/data/source/MetamaskDatabase.dart';

part 'receive_event.dart';
part 'receive_state.dart';

class ReceiveBloc extends Bloc<ReceiveEvent, ReceiveState> {
  ReceiveBloc() : super(ReceiveInitial()) {
    on<ReceiveEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SendSaldo>((event, emit) async {
      emit(SendSaldoLoading());
      try {
        final int result = await MetamaskDatabase.db.addSaldo(
          int.parse(event.amount),
        );

        if (result > 0) {
          emit(SendSaldoSuccess(
              'Success add to saldo with amount ${event.amount}'));
        } else {
          emit(SendSaldoFailed('Failed to send saldo'));
        }
      } catch (e) {
        emit(SendSaldoFailed(e.toString()));
      }
    });
  }
}
