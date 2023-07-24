import 'package:booking_car_app_flutter/Controllers/Google_Map/GetCurrentUserLocation.dart';
import 'package:booking_car_app_flutter/Controllers/Providers_Screen/StateProvider.dart';

import 'package:booking_car_app_flutter/Controllers/Validation_Screen/Validation.dart';
import 'package:booking_car_app_flutter/Models/Utils.dart';
import 'package:booking_car_app_flutter/Views/SignInPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const pageName = '/SignUpPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FocusNode focusNodeFullName = FocusNode();
  FocusNode focusNodeAddress = FocusNode();
  FocusNode focusNodeMobileNumber = FocusNode();
  FocusNode focusNodeEmailAddress = FocusNode();
  FocusNode focusNodeNewPassword = FocusNode();
  FocusNode focusNodeReEnterPassword = FocusNode();
  TextEditingController adressController = TextEditingController();
  TextEditingController fullNmeController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // focusNodeAddress.skipTraversal = true;
  }

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('Authentication');
  void signUp() {
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: newPasswordController.text.toString())
        .then((value) {
      _firestore
          .doc(value.user?.uid)
          .set({
            'fullName': fullNmeController.text.toString(),
            'adress': adressController.text.toString(),
            'mobileNumber': mobileNumberController.text.toString(),
            'email': emailController.text.toString(),
            'newPassword': newPasswordController.text.toString(),
            'reEnterPassword': reEnterPasswordController.text.toString(),
            'id': value.user?.uid
          })
          .then((value) {})
          .onError((error, stackTrace) {
            Utils().toastMessage(error.toString());
          });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.shade500,
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xfff5f7fa), Color(0xffc3cfe2)])),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                  right: width * 0.57,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.09,
                    ),
                    SizedBox(
                        width: width * 0.5,
                        height: height * 0.04,
                        child: const FittedBox(child: Text('Welcome'))),
                    SizedBox(
                        width: width * 0.5,
                        height: height * 0.04,
                        child: const FittedBox(child: Text('Lets Start')))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                width: width,
                // color: Colors.green,
                child: Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.03,
                      ),
                      SizedBox(
                        width: width * 0.97,
                        height: height * 0.1,
                        child: TextFormField(
                          controller: fullNmeController,
                          autofocus: true,
                          focusNode: focusNodeFullName,
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
                            suffixIcon: Icon(Icons.person),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: Color.fromARGB(255, 102, 100, 100))),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.pink)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            labelText: 'Full Name',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 6, 66, 60)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.97,
                        height: height * 0.1,
                        child: TextFormField(
                          controller: adressController,
                          focusNode: focusNodeAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Address Should not Empty';
                            } else if (value.length < 3) {
                              return 'Address hould be atleast 3 alphabeta';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () async {
                                  Placemark locationData = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            GetUserCurrentLocation(),
                                      ));
                                  adressController.text =
                                      "${locationData.street}, ${locationData.postalCode}, ${locationData.subLocality}, ${locationData.locality}, ${locationData.administrativeArea}, ${locationData.country}";

                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.location_on,
                                )),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: Color.fromARGB(255, 102, 100, 100))),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.pink)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            labelText: 'Adress',
                            labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 6, 66, 60)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.97,
                        height: height * 0.1,
                        child: TextFormField(
                          controller: mobileNumberController,
                          focusNode: focusNodeMobileNumber,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'MobileNumber Should not empty';
                            } else if (!(value.isValidDigit())) {
                              return 'MobileNumber should be digits';
                            } else if (value.length < 11) {
                              return 'MobileNumber atLeast 11 digits';
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
                                  (BorderSide(width: 1.0, color: Colors.pink)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 6, 66, 60)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.97,
                        height: height * 0.1,
                        child: TextFormField(
                          controller: emailController,
                          focusNode: focusNodeEmailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email Should Not Empty';
                            } else if (value.isValidFormetEmail()) {
                              return 'Email format not correct';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.email),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: Color.fromARGB(255, 102, 100, 100))),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  (BorderSide(width: 1.0, color: Colors.pink)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            labelText: 'Email Adress',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 6, 66, 60)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.97,
                        height: height * 0.1,
                        child: Consumer(builder: (BuildContext context,
                            WidgetRef ref, Widget? child) {
                          final bool showPassStates =
                              ref.watch(newPasswordShowHideProvider);
                          return TextFormField(
                            controller: newPasswordController,
                            focusNode: focusNodeNewPassword,
                            obscureText: showPassStates,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'NewPassword Should not empty';
                              } else if (!(value.isValidDigit())) {
                                return 'NewPassword should be digits';
                              } else if (value.length < 6) {
                                return 'NewPassword atLeast 6 digits';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(newPasswordShowHideProvider
                                            .notifier)
                                        .update((state) => !state);
                                  },
                                  icon: Icon(showPassStates
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 1.5,
                                      color:
                                          Color.fromARGB(255, 102, 100, 100))),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: (BorderSide(
                                    width: 1.0, color: Colors.pink)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(17),
                                ),
                              ),
                              labelText: 'New Password',
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 6, 66, 60)),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        width: width * 0.97,
                        height: height * 0.1,
                        child: Consumer(builder: (BuildContext context,
                            WidgetRef ref, Widget? child) {
                          final bool showPassState =
                              ref.watch(confirmPasswordShowHideProvider);
                          return TextFormField(
                            controller: reEnterPasswordController,
                            focusNode: focusNodeReEnterPassword,
                            obscureText: showPassState,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password Should not empty';
                              }
                              // else if (value != newPasswordController.text) {
                              //   return 'both password should be same';
                              // }
                              else if (!(value.isValidDigit())) {
                                return 'Password should be digits';
                              } else if (value.length < 6) {
                                return 'Password atLeast 6 digits';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(confirmPasswordShowHideProvider
                                            .notifier)
                                        .update((state) => !state);
                                  },
                                  icon: Icon(showPassState
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      width: 1.5,
                                      color:
                                          Color.fromARGB(255, 102, 100, 100))),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: (BorderSide(
                                    width: 1.0, color: Colors.pink)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(17),
                                ),
                              ),
                              labelText: ' Re-enter Password',
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 6, 66, 60)),
                            ),
                          );
                        }),
                      ),
                      InkWell(
                        onTap: () {
                          if (newPasswordController.text.toString() ==
                                  reEnterPasswordController.text.toString() &&
                              globalKey.currentState!.validate()) {
                            signUp();
                            Navigator.of(context).pushNamed(LoginPage.pageName);
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                              'Feild Should Not to be empty and password should be same',
                              style: TextStyle(color: Colors.amber),
                            )));
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 189, 186, 180),
                                Color(0xffd1fdff)
                              ]),
                              color: Color.fromARGB(255, 8, 99, 173),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          width: width * 0.5,
                          height: height * 0.06,
                          child: Center(
                              child: SizedBox(
                                  width: width * 0.2,
                                  height: height * 0.05,
                                  child:
                                      const FittedBox(child: Text('SIGN UP')))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
