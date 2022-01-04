import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:wallet/models/metamask.dart';
import 'package:wallet/screens/popup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int numberOfTokens = 36000;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MetaMaskProvider()..init(),
        builder: (context, child) {
          return Scaffold(
              backgroundColor: HexColor('1c1143'),
              body: Center(
                  // width: double.infinity,
                  // decoration: BoxDecoration(
                  //   color: HexColor('1c1143'),
                  // ),
                  child:
                      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                    Image.asset(
                      'assets/images/header.png',
                      fit: BoxFit.scaleDown,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/gift.png',
                          // fit: BoxFit.scaleDown,
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.height / 8,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              // fit: BoxFit.scaleDown,
                              width: MediaQuery.of(context).size.width / 16,
                            ),
                            Text(
                              '$numberOfTokens',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                    Consumer<MetaMaskProvider>(
                        builder: (context, provider, child) {
                      late final String text;

                      if (provider.isConnected && provider.isInOperatingChain) {
                        text = 'Connected';
                      } else if (provider.isConnected &&
                          !provider.isInOperatingChain) {
                        text =
                            'Wrong chain. Please connect to ${MetaMaskProvider.operatingChain}';
                      } else if (provider.isEnabled) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PopUpScreen()));
                                },
                                child: Container(
                                  constraints:
                                      const BoxConstraints(minWidth: 100),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: HexColor('ffe125'),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Approve',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(width: 16),
                            InkWell(
                                onTap: () =>
                                    context.read<MetaMaskProvider>().connect(),
                                child: Container(
                                  constraints: BoxConstraints(minWidth: 48),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: HexColor('ffe125'),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Connect Wallet',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        );
                      } else {
                        text = 'Please use a Web3 supported browser.';
                      }
                      return Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      );
                    })
                  ])));
        });
  }
}
