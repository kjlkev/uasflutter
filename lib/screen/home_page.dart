import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metamask/bloc/home/home_bloc.dart';
import 'package:metamask/data/model/saldo_model.dart';
import 'package:metamask/screen/receive_page.dart';
import 'package:metamask/screen/token_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SaldoModel? saldoModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Bloc get saldo
    BlocProvider.of<HomeBloc>(context).add(GetSaldo());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  Widget _space(int spacer) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: (MediaQuery.of(context).size.height / 100) * spacer,
      ),
    );
  }

  Widget _divider(bool isItFull) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          left: isItFull ? 0 : (MediaQuery.of(context).size.width / 100) * 6,
          right: isItFull ? 0 : (MediaQuery.of(context).size.width / 100) * 6,
        ),
        color: Colors.grey,
        height: (MediaQuery.of(context).size.height / 100) * 0.1,
      ),
    );
  }

  Widget _appBar() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(
          top: (MediaQuery.of(context).size.height / 100) * 5,
          left: (MediaQuery.of(context).size.width / 100) * 6,
          right: (MediaQuery.of(context).size.width / 100) * 6,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                Text(
                  "Metamask",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _profile(SaldoModel data) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 6,
          right: (MediaQuery.of(context).size.width / 100) * 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: (MediaQuery.of(context).size.width / 100) * 30,
                height: (MediaQuery.of(context).size.width / 100) * 30,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width / 100) * 4,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Kevin J",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height / 100) * 1,
                    ),
                    Text(
                      // separate by thousand
                      "\$ ${data.saldo.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _walletId() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 6,
          right: (MediaQuery.of(context).size.width / 100) * 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "ox9250...Bc94",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menu() {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReceivePage(),
                    ),
                  ).then((value) =>
                      BlocProvider.of<HomeBloc>(context).add(GetSaldo()));
                },
                child: Column(
                  children: const [
                    Icon(
                      Icons.download_outlined,
                      color: Colors.white,
                      size: 48,
                    ),
                    Text(
                      "Receive",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                children: const [
                  Icon(
                    Icons.call_made_outlined,
                    color: Colors.white,
                    size: 48,
                  ),
                  Text(
                    "Send",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                children: const [
                  Icon(
                    Icons.swap_horiz_outlined,
                    color: Colors.white,
                    size: 48,
                  ),
                  Text(
                    "Swap",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tokens() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 6,
          right: (MediaQuery.of(context).size.width / 100) * 6,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tokens",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 28),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 100) * 1,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TokenPage(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset('assets/images/ethereum.png'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ethereum",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height:
                              (MediaQuery.of(context).size.height / 100) * 0.5,
                        ),
                        const Text(
                          "\$0.11",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addWallet() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            "Don't see your token?",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
          Text(
            "Import Tokens",
            style: TextStyle(
                color: Color(0xFF1E27FF),
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is GetSaldoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetSaldoSuccess) {
          return Scaffold(
            body: Container(
                color: const Color(0xFF050206),
                child: Stack(
                  children: [
                    CustomScrollView(
                      slivers: [
                        _appBar(),
                        _space(2),
                        _profile(state.saldoModel),
                        _walletId(),
                        _space(2),
                        _divider(false),
                        _space(2),
                        _menu(),
                        _space(4),
                        _tokens(),
                        _space(1),
                        _divider(true),
                      ],
                    ),
                    _addWallet(),
                  ],
                )),
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }
}
