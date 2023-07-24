import 'dart:ui';

import 'package:booking_car_app_flutter/Controllers/Providers_Screen/StateProvider.dart';

import 'package:booking_car_app_flutter/Controllers/Validation_Screen/Validation.dart';
import 'package:booking_car_app_flutter/Models/Utils.dart';
import 'package:booking_car_app_flutter/Views/HomeVihiclePage.dart';
import 'package:booking_car_app_flutter/Views/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const pageName = '/SignIngPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode focusNodeMobileNumber = FocusNode();
  FocusNode focusNodePAssword = FocusNode();
  FocusNode focusNodeEye = FocusNode();
  GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController signEmailController = TextEditingController();
  TextEditingController signPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNodeEye.skipTraversal = true;
  }

  final _auth = FirebaseAuth.instance;
  void signIn() {
    _auth
        .signInWithEmailAndPassword(
            email: signEmailController.text.toString(),
            password: signPasswordController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.of(context).pushNamed(HomeVihiclePage.pageName);
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.red,
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      width: width,
                      // height: height * 0.2,
                      color: Colors.teal,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/bookingsplash_image.gif',
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    )),
                Expanded(
                    flex: 7,
                    child: Container(
                      width: width,
                      color: Colors.white,
                      // decoration: BoxDecoration(
                      //     gradient: RadialGradient(
                      //         center: Alignment.center,
                      //         colors: [Color(0xff1d202c), Color(0xff15171f)])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: width * 0.4,
                                      height: height * 0.05,
                                      child: const FittedBox(
                                        child: Text(
                                          'Welcome',
                                          // textScaleFactor: 2,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.2,
                                      height: height * 0.04,
                                      child: const FittedBox(
                                        child: Text(
                                          'Back',
                                          textScaleFactor: 2,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                width: width,
                                // color: Colors.pink,
                                child: Form(
                                  key: globalKey,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                      SizedBox(
                                        width: width * 0.95,
                                        height: height * 0.1,
                                        child: TextFormField(
                                          autofocus: true,
                                          controller: signEmailController,
                                          focusNode: focusNodeMobileNumber,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Email Should Not Empty';
                                            } else if (value
                                                .isValidFormetEmail()) {
                                              return 'Email format not correct';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(17)),
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color: Colors.grey)),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: (BorderSide(
                                                  width: 1.0,
                                                  color: Colors.blue)),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(17),
                                              ),
                                            ),
                                            labelText: 'Email',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.95,
                                        height: height * 0.1,
                                        child: Consumer(builder:
                                            (BuildContext context,
                                                WidgetRef ref, Widget? child) {
                                          final bool showPassState = ref.watch(
                                              newPasswordShowHideProvider);

                                          return TextFormField(
                                            obscureText: showPassState,
                                            focusNode: focusNodePAssword,
                                            controller: signPasswordController,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Password Should not empty';
                                              } else if (!(value
                                                  .isValidDigit())) {
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
                                                        .read(
                                                            newPasswordShowHideProvider
                                                                .notifier)
                                                        .update(
                                                            (state) => !state);
                                                  },
                                                  icon: Icon(showPassState
                                                      ? Icons.visibility
                                                      : Icons.visibility_off))
                                              // Icon(Icons.remove_red_eye)
                                              ,
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  17)),
                                                      borderSide: BorderSide(
                                                          width: 3,
                                                          color: Colors.grey)),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: (BorderSide(
                                                    width: 1.0,
                                                    color: Colors.blue)),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(17),
                                                ),
                                              ),
                                              labelText: 'Password',
                                            ),
                                          );
                                        }),
                                      ),
                                      SizedBox(
                                        width: width * 0.95,
                                        // height: height * 0.02,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width: width * 0.06,
                                                height: height * 0.05,
                                                child: const FittedBox(
                                                    child: Icon(Icons.circle))),
                                            SizedBox(
                                              width: width * 0.35,
                                              height: height * 0.04,
                                              child: const FittedBox(
                                                child: Text(
                                                  ' Show Password',
                                                  // textScaleFactor: 1,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                width: width,
                                // color: Colors.teal,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.1,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.14),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, SignUpPage.pageName);
                                            },
                                            child: SizedBox(
                                              width: width * 0.3,
                                              height: height * 0.05,
                                              child: const FittedBox(
                                                child: Text(
                                                  'SIGN UP>>',
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.05),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15))),
                                              width: width * 0.4,
                                              height: height * 0.06,
                                              child: Center(
                                                  child: SizedBox(
                                                      width: width * 0.2,
                                                      height: height * 0.05,
                                                      child: FittedBox(
                                                          child: InkWell(
                                                              onTap: () {
                                                                if (globalKey
                                                                    .currentState!
                                                                    .validate()) {
                                                                  signIn();
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                          const SnackBar(
                                                                              content: Text(
                                                                    'Feild Should Not to be empty',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .amber),
                                                                  )));
                                                                }
                                                              },
                                                              child: const Text(
                                                                  'LOGIN'))))),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
