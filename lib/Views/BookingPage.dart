import 'package:booking_car_app_flutter/Models/InsertVihicleData.dart';
import 'package:booking_car_app_flutter/Models/Utils.dart';
import 'package:booking_car_app_flutter/Views/Orders_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookingCarPage extends StatelessWidget {
  BookingCarPage({super.key, required this.vihicles});
  InsertDataVihicles vihicles;

  static const pageName = '/BookingCarPage';
  final firestore = FirebaseFirestore.instance.collection('Orders');
  String id = DateTime.now().microsecondsSinceEpoch.toString();
  void insertData() {
    // TestingModel testingModel = TestingModel(name: "Latu", rollNo: 12);
    // firestore.doc().set(testingModel.toMap());
    firestore.doc().set({
      'modelName': vihicles.name,
      'vihicleNumber': vihicles.vihiclenumber,
      'mobileNumber': vihicles.phoneNumber,
      'type': vihicles.type,
      'seats': vihicles.seats,
      'price': vihicles.price,
      'location': vihicles.location,
      'id': id
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final clientHeight = height - kToolbarHeight;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // title: const Icon(Icons.arrow_back),
        elevation: 0,
      ),
      body: Container(
          width: width,
          height: clientHeight,
          color: Colors.blue,
          child: Expanded(
            flex: 23,
            child: Column(
              children: [
                Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        SizedBox(
                          width: width,
                          height: height * 0.2,
                          child: Image.asset(
                            "assets/images/bookingcar.png",
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    )),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: width * 0.3,
                                    height: height * 0.1,
                                    child:
                                        FittedBox(child: Text(vihicles.name))),
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
                                                vihicles.type,
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
                                                vihicles.seats.toString(),
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
                                                'Price',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                vihicles.price.toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.05,
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
                                                vihicles.phoneNumber.toString(),
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
                                                vihicles.vihiclenumber,
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
                                                'Location',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))),
                                          SizedBox(
                                              width: width * 0.1,
                                              height: height * 0.05,
                                              child: const Icon(
                                                Icons.add_location,
                                                color: Colors.blue,
                                              )),
                                          SizedBox(
                                              width: width * 0.15,
                                              height: height * 0.02,
                                              child: FittedBox(
                                                  child: Text(
                                                vihicles.location,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              insertData();
                              Navigator.pushNamed(
                                  context, OrdersCarPage.pageName);
                              Utils()
                                  .toastMessage('Your Order has been placed');
                            },
                            child: Container(
                              width: width * 0.4,
                              height: height * 0.07,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 36, 194, 41),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(-1, 5),
                                        color:
                                            Color.fromARGB(255, 199, 194, 191),
                                        blurRadius: 10,
                                        spreadRadius: 2),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Center(
                                child: SizedBox(
                                    width: width * 0.25,
                                    height: height * 0.03,
                                    child: const FittedBox(
                                        child: Text(
                                      'Book Now',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ))),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
