import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:metamask/data/model/saldo_model.dart';
import 'package:metamask/data/source/MetamaskDatabase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetSaldo>((event, emit) async {
      emit(GetSaldoLoading());
      try {
        final SaldoModel saldoModel = await MetamaskDatabase.db.getSaldo();
        debugPrint("Saldo : ${saldoModel.saldo}");
        emit(GetSaldoSuccess(saldoModel));
      } catch (e) {
        emit(GetSaldoFailure(e.toString()));
      }
    });
  }
}
