import 'package:booking_car_app_flutter/Controllers/Validation_Screen/Validation.dart';
import 'package:booking_car_app_flutter/Models/InsertVihicleData.dart';
import 'package:booking_car_app_flutter/Views/BookingPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddVihiclePage extends StatelessWidget {
  AddVihiclePage({super.key});
  static const pageName = '/AddVihiclePage';
  FocusNode focusNodeModelName = FocusNode();
  FocusNode focusNodeVihicleNumber = FocusNode();

  FocusNode focusNodeMobileNumber = FocusNode();

  FocusNode focusNodeType = FocusNode();

  FocusNode focusNodeSeats = FocusNode();

  FocusNode focusNodPrice = FocusNode();

  FocusNode focusNodeLocation = FocusNode();
  TextEditingController modelNameController = TextEditingController();
  TextEditingController vihicleNumberController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffbdc2e8), Color(0xffe6dee9)])),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: width,
                // color: Colors.teal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: height * 0.17,
                        ),
                        SizedBox(
                            width: width * 0.2,
                            height: height * 0.04,
                            child: FittedBox(
                                child: InkWell(
                                    onTap: (() {
                                      Navigator.pop(context);
                                    }),
                                    child: const Icon(Icons.arrow_back)))),
                        SizedBox(
                            width: width * 0.5,
                            height: height * 0.04,
                            child: const FittedBox(child: Text('Add Vehicle')))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Form(
                key: globalKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: width * 0.97,
                      height: height * 0.1,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: modelNameController,
                        // autofocus: true,
                        // focusNode: focusNodeModelName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name Should not Empty';
                          } else if (!(value.isValidName())) {
                            return 'Name Format should be in alphabets only';
                          } else if (value.length < 3) {
                            return 'Name hould be atleast 3 alphabeta';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.model_training),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 102, 100, 100))),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                (BorderSide(width: 1.0, color: Colors.blue)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(17),
                            ),
                          ),
                          labelText: 'Model Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.97,
                      height: height * 0.1,
                      child: TextFormField(
                        controller: vihicleNumberController,
                        // focusNode: focusNodeVihicleNumber,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'vihicle number Should not Empty';
                          } else if (value.length < 3) {
                            return 'vihicle number hould be atleast 3 alphabeta';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.hail_sharp),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 102, 100, 100))),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                (BorderSide(width: 1.0, color: Colors.blue)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(17),
                            ),
                          ),
                          labelText: 'Vihicle Number',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.97,
                      height: height * 0.1,
                      child: TextFormField(
                        controller: mobileNumberController,
                        // focusNode: focusNodeMobileNumber,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'MobileNumber Should not empty';
                          } else if (!(value.isValidDigit())) {
                            return 'MobileNumber should be digits';
                          } else if (value.length < 11) {
                            return 'MobileNumber atLeast 6 digits';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.mobile_friendly),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 102, 100, 100))),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                (BorderSide(width: 1.0, color: Colors.blue)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(17),
                            ),
                          ),
                          labelText: 'Mobile Number',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.97,
                      height: height * 0.1,
                      child: TextFormField(
                        controller: typeController,
                        // focusNode: focusNodeType,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name Should not Empty';
                          } else if (!(value.isValidName())) {
                            return 'Name Format should be in alphabets only';
                          } else if (value.length < 3) {
                            return 'Name hould be atleast 3 alphabeta';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.type_specimen),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 102, 100, 100))),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                (BorderSide(width: 1.0, color: Colors.blue)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(17),
                            ),
                          ),
                          labelText: 'Type',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.97,
                      height: height * 0.1,
                      child: TextFormField(
                        controller: seatsController,
                        // focusNode: focusNodeSeats,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'MobileNumber Should not empty';
                          } else if (!(value.isValidDigit())) {
                            return 'MobileNumber should be digits';
                          } else if (value.length < 1) {
                            return 'MobileNumber atLeast 5 digits';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.security),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 102, 100, 100))),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                (BorderSide(width: 1.0, color: Colors.blue)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(17),
                            ),
                          ),
                          labelText: 'No.of Seats',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.97,
                      height: height * 0.1,
                      child: TextFormField(
                        controller: priceController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'price shuold not be empty';
                          } else if (!(value.isValidDigit())) {
                            return 'please input a valid digit';
                          } else {
                            return null;
                          }
                        },
                        // focusNode: focusNodPrice,
                        decoration: const InputDecoration(
                          // suffixIcon: Icon(Icons.phone),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 102, 100, 100))),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                (BorderSide(width: 1.0, color: Colors.blue)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(17),
                            ),
                          ),
                          labelText: '\$ Price/Day',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.97,
                      height: height * 0.1,
                      child: TextFormField(
                        controller: locationController,
                        // focusNode: focusNodeLocation,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'location Should not Empty';
                          } else if (value.length < 3) {
                            return 'location hould be atleast 3 alphabeta';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.location_history),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 102, 100, 100))),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                (BorderSide(width: 1.0, color: Colors.blue)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(17),
                            ),
                          ),
                          labelText: 'Your Location',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffdfe9f3), Color(0xffffffff)]),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                width: width * 0.5,
                height: height * 0.06,
                child: Center(
                    child: InkWell(
                  onTap: (() {
                    if (globalKey.currentState!.validate()) {
                      // insertData();
                      Navigator.of(context).pushNamed(BookingCarPage.pageName,
                          arguments: InsertDataVihicles(
                              name: modelNameController.text.toString(),
                              vihiclenumber:
                                  vihicleNumberController.text.toString(),
                              phoneNumber: double.parse(
                                  mobileNumberController.text.toString()),
                              type: typeController.text.toString(),
                              seats:
                                  double.parse(seatsController.text.toString()),
                              price:
                                  double.parse(priceController.text.toString()),
                              location: locationController.text.toString()));
                    }
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                      'Feild Should Not to be empty',
                      style: TextStyle(color: Colors.amber),
                    )));
                  }),
                  child: SizedBox(
                      width: width * 0.2,
                      height: height * 0.05,
                      child: const FittedBox(child: Text('Confirm'))),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
