import 'package:auto_size_text/auto_size_text.dart';
import 'package:booking_car_app_flutter/Controllers/Providers_Screen/StateProvider.dart';
import 'package:booking_car_app_flutter/Views/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});
  static const pageName = '/StartingPage';

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  void initState() {
    super.initState();
    color;
  }

  Color color = Colors.white.withOpacity(0.4);
  void changeColor() {
    // Color changeColors = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;
    // final cleintHeight = height - kToolbarHeight;
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.5),
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/junaid.webp',
              ),
              fit: BoxFit.fill,
              scale: 0.1),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                    width: width,
                    //  color: Colors.green,
                    child: Column())),
            Expanded(
                flex: 3,
                child: Container(
                    width: width,
                    // color: Colors.red,
                    child: Column())),
            Expanded(
                flex: 4,
                child: Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.075),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    'Kana Office',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  AutoSizeText(
                                    'Standing',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  AutoSizeText(
                                    'Cars',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              width: width,
                              // color: Colors.white.withOpacity(0.1),
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.075),
                                        child: Container(
                                          width: width,
                                          // color: Colors.green.withOpacity(0.2),
                                          child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                  'create a sustanable work space with',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15)),
                                              AutoSizeText(
                                                  '100% natural bamboo',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15))
                                            ],
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: width,
                                            height: height * 0.12,
                                            // color: Colors.pink.withOpacity(0.5),
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom: height * 0.03,
                                                  left: width * 0.22,
                                                  child: Container(
                                                    width: width * 0.65,
                                                    height: height * 0.07,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    30))),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: width *
                                                                    0.13),
                                                        child: const AutoSizeText(
                                                            'Get Started',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: height * 0.0355,
                                                  right: width * 0.1,
                                                  child: Consumer(builder:
                                                      (BuildContext context,
                                                          WidgetRef ref,
                                                          Widget? child) {
                                                    final bool changeColor =
                                                        ref.watch(
                                                            colorChangeProvider);
                                                    return Container(
                                                      width: width * 0.2,
                                                      height: height * 0.06,
                                                      decoration: BoxDecoration(
                                                        color: changeColor
                                                            ? Colors.white
                                                                .withOpacity(
                                                                    0.5)
                                                            : Colors.red,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: IconButton(
                                                          onPressed: () {
                                                            ref
                                                                .read(colorChangeProvider
                                                                    .notifier)
                                                                .update(
                                                                    (state) =>
                                                                        !state);
                                                            Navigator.of(
                                                                    context)
                                                                .pushNamed(
                                                                    LoginPage
                                                                        .pageName);
                                                          },
                                                          icon: const Icon(
                                                              Icons
                                                                  .arrow_circle_right_sharp,
                                                              color: Colors
                                                                  .white)),
                                                    );
                                                  }),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ))
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
