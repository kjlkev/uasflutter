import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metamask/bloc/home/home_bloc.dart';
import 'package:metamask/bloc/receive/receive_bloc.dart';
import 'package:metamask/data/model/saldo_model.dart';
import 'package:metamask/screen/home_page.dart';
import 'package:metamask/screen/widgets/app_textfield.dart';

class ReceivePage extends StatefulWidget {
  const ReceivePage({super.key});

  @override
  State<ReceivePage> createState() => _ReceivePageState();
}

class _ReceivePageState extends State<ReceivePage> {
  final etSaldoController = TextEditingController();
  String? saldo;

  Widget _space(int spacer) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: (MediaQuery.of(context).size.height / 100) * spacer,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF050206),
      elevation: 0,
      title: const Text(
        "Receive",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _saldoTextfield() {
    return SliverToBoxAdapter(
      child: AppTextfield(
        title: "Saldo",
        hint: "0.00",
        controller: etSaldoController,
        onChanged: (value) {
          saldo = value;
        },
        textInputType: TextInputType.number,
      ),
    );
  }

  Widget _button() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          bottom: (MediaQuery.of(context).size.width / 100) * 4,
        ),
        child: ElevatedButton(
          // On press fetch cost
          onPressed: () {
            // TODO
            BlocProvider.of<ReceiveBloc>(context).add(SendSaldo(saldo!));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF050206),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: (MediaQuery.of(context).size.width / 100) * 4,
            ),
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "Tambah Saldo",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReceiveBloc, ReceiveState>(
      listener: (context, state) {
        if (state is SendSaldoLoading) {
          // Do Nothing
        } else if (state is SendSaldoSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePage(
                        title: 'Metamask ',
                      ))).then(
              (value) => BlocProvider.of<HomeBloc>(context).add(GetSaldo()));
        } else if (state is SendSaldoFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: _appBar(),
        body: Container(
          color: const Color(0xFF050206),
          child: Container(
            margin: EdgeInsets.only(
              top: (MediaQuery.of(context).size.height / 100) * 1,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: (MediaQuery.of(context).size.width / 100) * 6,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    _space(4),
                    _saldoTextfield(),
                  ],
                ),
                _button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
