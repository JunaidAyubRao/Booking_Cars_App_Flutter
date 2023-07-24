import 'package:booking_car_app_flutter/Controllers/FetchHomeVihicleItemsRiverpod/FetchData.dart';
import 'package:booking_car_app_flutter/Controllers/Retrive_User_Profile/FutureProvider.dart';
import 'package:booking_car_app_flutter/Views/AddVihiclePage.dart';
import 'package:booking_car_app_flutter/Views/FavouritePage.dart';
import 'package:booking_car_app_flutter/Views/Orders_Screen.dart';
import 'package:booking_car_app_flutter/Views/SignInPage.dart';
import 'package:booking_car_app_flutter/Views/SignUpPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeVihiclePage extends StatefulWidget {
  const HomeVihiclePage({super.key});
  static const pageName = '/HomeVihiclePage';

  @override
  State<HomeVihiclePage> createState() => _HomeVihiclePageState();
}

class _HomeVihiclePageState extends State<HomeVihiclePage> {
  final firestre =
      FirebaseFirestore.instance.collection('products').snapshots();
  late Future<DocumentSnapshot<Map<String, dynamic>>> fireStoreProfile;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    fireStoreProfile = FirebaseFirestore.instance
        .collection('Authentication')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final clientHeight = height - kToolbarHeight;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff302b27),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0xff302b27),
          // elevation: 0,
          title: const Text('My Home Page'),
        ),
        body: SafeArea(
          child: Container(
              width: width,
              height: clientHeight,
              color: Color(0xff302b27),
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        width: width,
                        color: Color(0xff302b27),
                      )),
                  Expanded(
                      flex: 20,
                      child: Container(
                        height: height * 0.4,
                        width: width * 0.92,
                        color: Colors.white,
                        child: const MyWidget(),
                        // StreamBuilder(
                        //     stream: firestre,
                        //     builder: (BuildContext context,
                        //         AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        //             snapshot) {
                        //       if (snapshot.connectionState ==
                        //           ConnectionState.waiting) {
                        //         return const Center(
                        //           child: CircularProgressIndicator(),
                        //         );
                        //       } else if (snapshot.hasData) {
                        //         return Center(
                        //           child: GridView.builder(
                        //               gridDelegate:
                        //                   const SliverGridDelegateWithFixedCrossAxisCount(
                        //                       crossAxisCount: 1,
                        //                       // childAspectRatio: 5 / 5,
                        //                       crossAxisSpacing: 20,
                        //                       mainAxisSpacing: 20),
                        //               itemCount: snapshot.data!.docs.length,
                        //               itemBuilder: (BuildContext ctx, index) {
                        //                 Cars cars = Cars.fromMap(
                        //                     snapshot.data!.docs[index].data());
                        //                 return Container(
                        //                   decoration: const BoxDecoration(
                        //                       color: Colors.blue,
                        //                       borderRadius: BorderRadius.all(
                        //                           Radius.circular(20))),
                        //                   child: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: [
                        //                       Padding(
                        //                         padding: EdgeInsets.only(
                        //                             left: width * 0.77,
                        //                             top: height * 0.02),
                        //                         child: Consumer(builder:
                        //                             (BuildContext context,
                        //                                 WidgetRef ref,
                        //                                 Widget? child) {
                        //                           final bool changeColor =
                        //                               ref.watch(
                        //                                   itemsFavouriteProvider);
                        //                           return IconButton(
                        //                             onPressed: () {
                        //                               addFavouriteItems(cars);
                        //                               Utils().toastMessage('added to favourite');
                        //                               // String imageName =
                        //                               //     cars.name;
                        //                               // String imagePath =
                        //                               //     cars.path;
                        //                               // num imagePrice = cars.price;
                        //                               // String id = cars.id;
                        //                               // _firestore.doc().set({
                        //                               //   'imageName': imageName,
                        //                               //   'imagePath': imagePath,
                        //                               //   'imagePrice': imagePrice,
                        //                               //   'id': id
                        //                               // }).then((value) {
                        //                               //   Utils().toastMessage(
                        //                               //       'Successfully Added Data');
                        //                               // }).onError(
                        //                               //     (error, stackTrace) {
                        //                               //   Utils().toastMessage(
                        //                               //       error.toString());
                        //                               // });
                        //                               ref
                        //                                   .read(
                        //                                       itemsFavouriteProvider
                        //                                           .notifier)
                        //                                   .update(
                        //                                       (state) => !state);
                        //                             },
                        //                             icon: Icon(
                        //                               Icons.favorite_rounded,
                        //                               color: changeColor
                        //                                   ? Colors.white
                        //                                   : Colors.red,
                        //                               size: width * 0.09,
                        //                             ),
                        //                           );
                        //                         }),
                        //                       ),
                        //                       // Text(list[index]),
                        //                       Container(
                        //                         width: width * 0.9,
                        //                         height: height * 0.2,
                        //                         // color: Colors.red,
                        //                         child: Image.network(
                        //                           cars.path,
                        //                           fit: BoxFit.fill,
                        //                         ),
                        //                       ),
                        //                       Padding(
                        //                         padding: EdgeInsets.only(
                        //                             left: width * 0.05),
                        //                         child: Container(
                        //                           // color: Colors.teal,
                        //                           height: height * 0.07,
                        //                           width: width * 0.9,
                        //                           child: Column(
                        //                             crossAxisAlignment:
                        //                                 CrossAxisAlignment.start,
                        //                             mainAxisAlignment:
                        //                                 MainAxisAlignment
                        //                                     .spaceBetween,
                        //                             children: [
                        //                               SizedBox(
                        //                                   width: width * 0.22,
                        //                                   height: height * 0.03,
                        //                                   child: FittedBox(
                        //                                       child: Text(
                        //                                     cars.name,
                        //                                     style:
                        //                                         const TextStyle(
                        //                                             fontWeight:
                        //                                                 FontWeight
                        //                                                     .w900,
                        //                                             color: Colors
                        //                                                 .white),
                        //                                   ))),
                        //                               Container(
                        //                                 width: width * 0.8,
                        //                                 height: height * 0.001,
                        //                                 color: Colors.white,
                        //                               ),
                        //                               Row(
                        //                                 mainAxisAlignment:
                        //                                     MainAxisAlignment
                        //                                         .spaceBetween,
                        //                                 children: [
                        //                                   SizedBox(
                        //                                       width: width * 0.22,
                        //                                       height:
                        //                                           height * 0.02,
                        //                                       child: FittedBox(
                        //                                           child: Text(
                        //                                         'Type: ${cars.type}',
                        //                                         style: const TextStyle(
                        //                                             fontWeight:
                        //                                                 FontWeight
                        //                                                     .w500,
                        //                                             color: Colors
                        //                                                 .white),
                        //                                       ))),
                        //                                   SizedBox(
                        //                                       width: width * 0.18,
                        //                                       height:
                        //                                           height * 0.02,
                        //                                       child: FittedBox(
                        //                                           child: Text(
                        //                                         'Seats: ${cars.seats}',
                        //                                         style: const TextStyle(
                        //                                             fontWeight:
                        //                                                 FontWeight
                        //                                                     .w500,
                        //                                             color: Colors
                        //                                                 .white),
                        //                                       ))),
                        //                                   SizedBox(
                        //                                       width: width * 0.3,
                        //                                       height:
                        //                                           height * 0.02,
                        //                                       child: FittedBox(
                        //                                           child: Text(
                        //                                         'Price: Rs.${cars.price}',
                        //                                         style: const TextStyle(
                        //                                             fontWeight:
                        //                                                 FontWeight
                        //                                                     .w500,
                        //                                             color: Colors
                        //                                                 .white),
                        //                                       ))),
                        //                                 ],
                        //                               )
                        //                             ],
                        //                           ),
                        //                         ),
                        //                       )
                        //                     ],
                        //                   ),
                        //                 );
                        //               }),
                        //         );
                        //       } else {
                        //         return const Text('Something went wrong');
                        //       }
                        //     }),
                      ))
                ],
              )),
        ),
        floatingActionButton: SizedBox(
          height: height * 0.07,
          width: width * 0.45,
          child: FloatingActionButton(
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            backgroundColor:const Color.fromARGB(255, 21, 21, 20),
            onPressed: () {
              Navigator.of(context).pushNamed(AddVihiclePage.pageName);
            },
            child: Center(
                child: SizedBox(
                    width: width * 0.3,
                    height: height * 0.05,
                    child: const FittedBox(
                        child: Text(
                      '+ ADD VEHICLE',
                      style: TextStyle(fontWeight: FontWeight.w900),
                    )))),
          ),
        ),
        drawer: SafeArea(
          child: Drawer(
              backgroundColor: const Color(0xff302b27),
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                    // gradient: LinearGradient(
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight,
                    //     colors: [Color(0xff675263), Color(0xff382e36)])
                  ),
                  child: Column(children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        // color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (() {
                                Navigator.of(context).pop();
                              }),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 273, top: 3),
                                child: Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Consumer(
                                          builder: (context, ref, child) {
                                        final userProfileAsyncValue =
                                            ref.watch(userProfileProvider);
                                        return userProfileAsyncValue.when(
                                          data: (userProfileData) {
                                            if (userProfileData != null) {
                                              return Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  FittedBox(
                                                    child: Text(
                                                      'Username: ${userProfileData['fullName']}',
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Color(
                                                              0xffcaa21e)),
                                                    ),
                                                  ),
                                                  FittedBox(
                                                    child: Text(
                                                      'Email: ${userProfileData['email']}',
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Color(
                                                              0xffcaa21e)),
                                                    ),
                                                  ),
                                                  FittedBox(
                                                    child: Text(
                                                      'PhoneNumber: ${userProfileData['mobileNumber']}',
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Color(
                                                              0xffcaa21e)),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return const Text(
                                                  'User profile not found');
                                            }
                                          },
                                          error: (error, stackTrace) => Text(
                                              'Error fetching user profile: $error'),
                                          loading: () =>
                                              const CircularProgressIndicator(),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: clientHeight * 0.06,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    width: width * 0.6,
                                    height: 1,
                                    color:
                                        const Color.fromARGB(255, 92, 87, 91),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 6,
                        child: Container(
                            // color: Colors.green,
                            child: Column(children: [
                          SizedBox(
                              width: 270,
                              height: clientHeight * 0.4,
                              // color: Colors.green,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: clientHeight * 0.05,
                                          width: 50,
                                          child: const FittedBox(
                                            child: Icon(
                                              Icons.add_home,
                                              color: Color(0xffcaa21e),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                HomeVihiclePage.pageName);
                                          },
                                          child: SizedBox(
                                            width: 50,
                                            height: clientHeight * 0.05,
                                            child: const FittedBox(
                                              child: Text(
                                                'Home',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 270,
                                      height: clientHeight * 0.004,
                                      color: const Color(0xff50404a),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: clientHeight * 0.05,
                                          width: 50,
                                          child: const FittedBox(
                                            child: Icon(
                                              Icons.favorite_sharp,
                                              color: Color(0xffcaa21e),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                FavouritePage.pageName);
                                          },
                                          child: SizedBox(
                                            width: 70,
                                            height: clientHeight * 0.05,
                                            child: const FittedBox(
                                              child: Text(
                                                'Favourite',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 270,
                                      height: clientHeight * 0.004,
                                      color: const Color(0xff50404a),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: clientHeight * 0.05,
                                          width: 50,
                                          child: const FittedBox(
                                            child: Icon(
                                              Icons.card_travel,
                                              color: Color(0xffcaa21e),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (() {
                                            Navigator.pushNamed(context,
                                                OrdersCarPage.pageName);
                                          }),
                                          child: SizedBox(
                                            width: 60,
                                            height: clientHeight * 0.05,
                                            child: const FittedBox(
                                              child: Text(
                                                'My Cart',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 270,
                                      height: clientHeight * 0.004,
                                      color: const Color(0xff50404a),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: clientHeight * 0.05,
                                          width: 50,
                                          child: const FittedBox(
                                            child: Icon(
                                              Icons.sign_language_sharp,
                                              color: Color(0xffcaa21e),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (() {
                                            FirebaseAuth.instance.signOut();
                                            Navigator.pushNamed(
                                                context, LoginPage.pageName);
                                          }),
                                          child: SizedBox(
                                            width: 60,
                                            height: clientHeight * 0.05,
                                            child: const FittedBox(
                                              child: Text(
                                                'Sign Out',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 270,
                                      height: clientHeight * 0.004,
                                      color: const Color(0xff50404a),
                                    ),
                                  ]))
                        ])))
                  ]))),
        ),
      ),
    );
  }
}
