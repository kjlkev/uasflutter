part of 'receive_bloc.dart';

abstract class ReceiveState extends Equatable {
  const ReceiveState();

  @override
  List<Object> get props => [];
}

class ReceiveInitial extends ReceiveState {}

class SendSaldoLoading extends ReceiveState {}

class SendSaldoSuccess extends ReceiveState {
  final String message;

  const SendSaldoSuccess(this.message);
}

class SendSaldoFailed extends ReceiveState {
  final String message;

  const SendSaldoFailed(this.message);
}
