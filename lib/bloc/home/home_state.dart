part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GetSaldoLoading extends HomeState {}

class GetSaldoSuccess extends HomeState {
  final SaldoModel saldoModel;

  const GetSaldoSuccess(this.saldoModel);
}

class GetSaldoFailure extends HomeState {
  final String error;

  const GetSaldoFailure(this.error);
}
