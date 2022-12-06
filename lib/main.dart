import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metamask/bloc/home/home_bloc.dart';
import 'package:metamask/bloc/receive/receive_bloc.dart';
import 'package:metamask/data/source/MetamaskDatabase.dart';
import 'package:metamask/screen/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MetamaskDatabase.initDB();

  await MetamaskDatabase.db.createSaldoForTheFirstTime();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
        BlocProvider(
          create: (_) => ReceiveBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF050206),
        ),
        home: const HomePage(title: 'Metamask'),
      ),
    );
  }
}
