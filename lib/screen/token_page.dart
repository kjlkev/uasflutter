import 'package:flutter/material.dart';

class TokenPage extends StatefulWidget {
  const TokenPage({Key? key}) : super(key: key);

  @override
  State<TokenPage> createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
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

  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF050206),
      elevation: 0,
      title: const Text(
        "Ethereum",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // todo
          },
        ),
      ],
    );
  }

  Widget _coin() {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/ethereum.png',
            width: (MediaQuery.of(context).size.width / 100) * 20,
          ),
          const Text(
            "0.00008 ETH",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height / 100) * 0.5,
          ),
          const Text(
            "\$0.11",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ],
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
              child: Column(
                children: const [
                  Icon(
                    Icons.download_outlined,
                    size: 48,
                  ),
                  Text(
                    "Receive",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
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
                    Icons.call_made_outlined,
                    size: 48,
                  ),
                  Text(
                    "Send",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
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
                    size: 48,
                  ),
                  Text(
                    "Swap",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _transaction(String title, bool confirmed, bool sent, String coinName,
      String totalCoin, String money) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 100) * 6,
          right: (MediaQuery.of(context).size.width / 100) * 6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 100) * 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      margin: EdgeInsets.all(
                          (MediaQuery.of(context).size.width / 100) * 4),
                      child: Icon(
                        sent
                            ? Icons.call_made_outlined
                            : Icons.download_outlined,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: (MediaQuery.of(context).size.width / 100) * 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sent ? "Send $coinName" : "Receive $coinName",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height:
                              (MediaQuery.of(context).size.height / 100) * 0.5,
                        ),
                        Text(
                          confirmed ? "Confirmed" : "Pending",
                          style: TextStyle(
                            color: confirmed ? Colors.green : Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: (MediaQuery.of(context).size.width / 100) * 4,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          totalCoin,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height:
                              (MediaQuery.of(context).size.height / 100) * 0.5,
                        ),
                        Text(
                          money,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        color: const Color(0xFF050206),
        child: Container(
          margin: EdgeInsets.only(
            top: (MediaQuery.of(context).size.height / 100) * 1,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: CustomScrollView(
            slivers: [
              _space(1),
              _coin(),
              _space(2),
              _menu(),
              _space(4),
              _divider(true),
              _space(2),
              _transaction(
                "#3 - Mar 23 at 7:20 pm from this device",
                true,
                true,
                "ETH",
                "0.03294 ETH",
                "\$43.7",
              ),
              _space(2),
              _divider(true),
              _space(2),
              _transaction(
                "Mar 22 at 2:50 pm",
                true,
                false,
                "ETH",
                "0.0334 ETH",
                "\$44.31",
              ),
              _space(2),
              _divider(true),
              _space(2),
              _transaction(
                "#2 - Mar 15 at 12:21 pm from this device",
                true,
                true,
                "ETH",
                "0.03562 ETH",
                "\$47.27",
              ),
              _space(2),
              _divider(true),
              _space(2),
              _transaction(
                "#3 - Mar 23 at 7:20 pm from this device",
                true,
                false,
                "ETH",
                "0.021 ETH",
                "\$27.86",
              ),
              _space(2),
              _divider(true),
            ],
          ),
        ),
      ),
    );
  }
}
