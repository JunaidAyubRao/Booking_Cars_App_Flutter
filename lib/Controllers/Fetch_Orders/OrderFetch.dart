import 'package:booking_car_app_flutter/Controllers/FetchHomeVihicleItemsRiverpod/Cars_State.dart';
import 'package:booking_car_app_flutter/Controllers/FetchHomeVihicleItemsRiverpod/StateNotifierProvider.dart';
import 'package:booking_car_app_flutter/Controllers/Fetch_Orders/OrdersState.dart';
import 'package:booking_car_app_flutter/Controllers/Fetch_Orders/OrdersStateNotifierProvider.dart';
import 'package:booking_car_app_flutter/Models/OrdersPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 245, 245),
      body: Consumer(
        builder: (context, ref, child) {
          var state = ref.watch(ordersStateProvider);
          if (state is OrdersLoadingState) {
            return const OrdersLoadingWidget();
          } else if (state is OrdersLoadidState) {
            return OrdersLoadedWidget(orderss: state.orders);
          } else {
            return AlbumErrorWidget(
              errorMessage: (state as AlbumErrorWidget).errorMessage,
            );
          }
        },
      ),
    );
  }
}

class OrdersInitialWidget extends ConsumerWidget {
  const OrdersInitialWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: InkWell(
          onTap: () {
            ref.read(ordersStateProvider.notifier).fetchData();
          },
          child: const Text('Click To Load Data')),
    );
  }
}

class OrdersLoadingWidget extends ConsumerWidget {
  const OrdersLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(ordersStateProvider.notifier).fetchData();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class OrdersLoadedWidget extends ConsumerWidget {
  OrdersLoadedWidget({required this.orderss, super.key});
  final List<Orders> orderss;
  // bool colors=Colors.white;
  final _firestore = FirebaseFirestore.instance.collection('Orders');
  final auth = FirebaseAuth.instance;
  void addFavouriteItems(Orders orderss) {
    String type = orderss.type;
    num seats = orderss.seats;
    num price = orderss.price;
    String vihicleNumber = orderss.vihicleNumber;
    num mobileNumber = orderss.mobileNumber;
    String id = orderss.id;

    _firestore
        .doc(id)
        .set({
          'type': type,
          'price': price,
          'seats': seats,
          'mobileNumber': mobileNumber,
          'vihicleNumber': vihicleNumber,
          'id': id
        })
        .then((value) {})
        .onError((error, stackTrace) {});
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final clientHeight = height - kToolbarHeight;

    return ListView.builder(
        itemCount: orderss.length,

        // itemExtent: 350,
        // padding: EdgeInsets.only(bottom: 100),
        itemBuilder: (BuildContext ctx, index) {
          // albums = firestoreState[];
          // final colors = colorChangeProvider;

          return Container(
              width: width,
              height: clientHeight,
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 15,
                      child: Container(
                        width: width * 0.98,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 248, 245, 245),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: Column(
                          children: [
                            SizedBox(
                              width: width * 0.9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: width * 0.24,
                                        height: height * 0.15,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(-1, 5),
                                                  color: Color.fromARGB(
                                                      255, 199, 194, 191),
                                                  blurRadius: 10,
                                                  spreadRadius: 2),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: width * 0.15,
                                                height: height * 0.02,
                                                child: const FittedBox(
                                                    child: Text(
                                                  'Type',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))),
                                            SizedBox(
                                                width: width * 0.1,
                                                height: height * 0.02,
                                                child: const Icon(
                                                  Icons.key,
                                                  color: Colors.blue,
                                                )),
                                            SizedBox(
                                                width: width * 0.1,
                                                height: height * 0.05,
                                                child: const Icon(
                                                  Icons.car_crash,
                                                  color: Colors.blue,
                                                )),
                                            SizedBox(
                                                width: width * 0.15,
                                                height: height * 0.02,
                                                child: FittedBox(
                                                    child: Text(
                                                  orderss[index]
                                                      .type
                                                      .toString(),
                                                  style:const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.24,
                                        height: height * 0.15,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(-1, 5),
                                                  color: Color.fromARGB(
                                                      255, 199, 194, 191),
                                                  blurRadius: 10,
                                                  spreadRadius: 2),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: width * 0.15,
                                                height: height * 0.02,
                                                child: const FittedBox(
                                                    child: Text(
                                                  'Seat',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))),
                                            SizedBox(
                                                width: width * 0.3,
                                                height: height * 0.05,
                                                child: const Icon(
                                                  Icons.bed_rounded,
                                                  color: Colors.blue,
                                                )),
                                            SizedBox(
                                                width: width * 0.15,
                                                height: height * 0.02,
                                                child: FittedBox(
                                                    child: Text(
                                                  orderss[index]
                                                      .seats
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: width * 0.24,
                                    height: height * 0.15,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(-1, 5),
                                              color: Color.fromARGB(
                                                  255, 199, 194, 191),
                                              blurRadius: 10,
                                              spreadRadius: 2),
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: width * 0.15,
                                            height: height * 0.02,
                                            child: const FittedBox(
                                                child: Text(
                                              'Price',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                        SizedBox(
                                            width: width * 0.1,
                                            height: height * 0.05,
                                            child: const Icon(
                                              Icons.phone,
                                              color: Colors.blue,
                                            )),
                                        SizedBox(
                                            width: width * 0.15,
                                            height: height * 0.02,
                                            child: FittedBox(
                                                child: Text(
                                              orderss[index].price.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: width * 0.24,
                                        height: height * 0.15,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(-1, 5),
                                                  color: Color.fromARGB(
                                                      255, 199, 194, 191),
                                                  blurRadius: 10,
                                                  spreadRadius: 2),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: width * 0.15,
                                                height: height * 0.03,
                                                child: const FittedBox(
                                                    child: Text(
                                                  'Mobile no.',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))),
                                            SizedBox(
                                                width: width * 0.1,
                                                height: height * 0.04,
                                                child: const Icon(
                                                  Icons.person_add_alt,
                                                  color: Colors.blue,
                                                )),
                                            SizedBox(
                                                width: width * 0.2,
                                                height: height * 0.03,
                                                child: FittedBox(
                                                    child: Text(
                                                  orderss[index]
                                                      .mobileNumber
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.24,
                                        height: height * 0.15,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(-1, 5),
                                                  color: Color.fromARGB(
                                                      255, 199, 194, 191),
                                                  blurRadius: 10,
                                                  spreadRadius: 2),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: width * 0.15,
                                                height: height * 0.02,
                                                child: const FittedBox(
                                                    child: Text(
                                                  'Vehicle no.',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))),
                                            SizedBox(
                                                width: width * 0.1,
                                                height: height * 0.05,
                                                child: const Icon(
                                                  Icons.star,
                                                  color: Colors.blue,
                                                )),
                                            SizedBox(
                                                width: width * 0.15,
                                                height: height * 0.02,
                                                child: FittedBox(
                                                    child: Text(
                                                  orderss[index]
                                                      .vihicleNumber
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                            Container(
                              width: width * 0.7,
                              height: height * 0.002,
                              color: const Color.fromARGB(255, 213, 215, 215),
                            )
                          ],
                        ),
                      ))
                ],
              ));
        });
  }
}

class AlbumErrorWidget extends StatelessWidget {
  const AlbumErrorWidget({required this.errorMessage, super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.red,
        child: Text(errorMessage),
      ),
    );
  }
}
