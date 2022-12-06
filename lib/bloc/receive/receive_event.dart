part of 'receive_bloc.dart';

abstract class ReceiveEvent extends Equatable {
  const ReceiveEvent();

  @override
  List<Object> get props => [];
}

class SendSaldo extends ReceiveEvent {
  final String amount;

  const SendSaldo(this.amount);
}
