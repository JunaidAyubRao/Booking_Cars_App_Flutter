import 'package:booking_car_app_flutter/Controllers/Fetch_Orders/OrderFetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersCarPage extends ConsumerWidget {
  const OrdersCarPage({super.key});

  static const pageName = '/OrdersCarPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final clientHeight = height - kToolbarHeight;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 245, 245),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 245, 245),
        // title: const Icon(Icons.arrow_back),
        elevation: 0,
      ),
      body: OrderWidget(),
      // body: Container(
      //     width: width,
      //     height: clientHeight,
      //     // color: Colors.blue,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Expanded(
      //             flex: 15,
      //             child: Container(
      //               width: width * 0.98,
      //               decoration: const BoxDecoration(
      //                   color: Color.fromARGB(255, 248, 245, 245),
      //                   borderRadius: BorderRadius.only(
      //                       topLeft: Radius.circular(25),
      //                       topRight: Radius.circular(25))),
      //               child: Column(
      //                 children: [
      //                   SizedBox(
      //                     width: width * 0.9,
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.center,
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         Row(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             Container(
      //                               width: width * 0.24,
      //                               height: height * 0.15,
      //                               decoration: const BoxDecoration(
      //                                   color: Colors.white,
      //                                   boxShadow: [
      //                                     BoxShadow(
      //                                         offset: Offset(-1, 5),
      //                                         color: Color.fromARGB(
      //                                             255, 199, 194, 191),
      //                                         blurRadius: 10,
      //                                         spreadRadius: 2),
      //                                   ],
      //                                   borderRadius: BorderRadius.all(
      //                                       Radius.circular(20))),
      //                               child: Column(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.center,
      //                                 children: [
      //                                   SizedBox(
      //                                       width: width * 0.15,
      //                                       height: height * 0.02,
      //                                       child: const FittedBox(
      //                                           child: Text(
      //                                         'Type',
      //                                         style: TextStyle(
      //                                             fontWeight: FontWeight.bold),
      //                                       ))),
      //                                   SizedBox(
      //                                       width: width * 0.1,
      //                                       height: height * 0.02,
      //                                       child: const Icon(
      //                                         Icons.key,
      //                                         color: Colors.blue,
      //                                       )),
      //                                   SizedBox(
      //                                       width: width * 0.1,
      //                                       height: height * 0.05,
      //                                       child: const Icon(
      //                                         Icons.car_crash,
      //                                         color: Colors.blue,
      //                                       )),
      //                                   SizedBox(
      //                                       width: width * 0.15,
      //                                       height: height * 0.02,
      //                                       child: const FittedBox(
      //                                           child: Text(
      //                                         '',
      //                                         style: TextStyle(
      //                                             fontWeight: FontWeight.bold),
      //                                       ))),
      //                                 ],
      //                               ),
      //                             ),
      //                             Container(
      //                               width: width * 0.24,
      //                               height: height * 0.15,
      //                               decoration: const BoxDecoration(
      //                                   color: Colors.white,
      //                                   boxShadow: [
      //                                     BoxShadow(
      //                                         offset: Offset(-1, 5),
      //                                         color: Color.fromARGB(
      //                                             255, 199, 194, 191),
      //                                         blurRadius: 10,
      //                                         spreadRadius: 2),
      //                                   ],
      //                                   borderRadius: BorderRadius.all(
      //                                       Radius.circular(20))),
      //                               child: Column(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.center,
      //                                 children: [
      //                                   SizedBox(
      //                                       width: width * 0.15,
      //                                       height: height * 0.02,
      //                                       child: const FittedBox(
      //                                           child: Text(
      //                                         'Seat',
      //                                         style: TextStyle(
      //                                             fontWeight: FontWeight.bold),
      //                                       ))),
      //                                   SizedBox(
      //                                       width: width * 0.3,
      //                                       height: height * 0.05,
      //                                       child: const Icon(
      //                                         Icons.bed_rounded,
      //                                         color: Colors.blue,
      //                                       )),
      //                                   SizedBox(
      //                                       width: width * 0.15,
      //                                       height: height * 0.02,
      //                                       child: const FittedBox(
      //                                           child: Text(
      //                                         '',
      //                                         style: TextStyle(
      //                                             fontWeight: FontWeight.bold),
      //                                       ))),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         Container(
      //                           width: width * 0.24,
      //                           height: height * 0.15,
      //                           decoration: const BoxDecoration(
      //                               color: Colors.white,
      //                               boxShadow: [
      //                                 BoxShadow(
      //                                     offset: Offset(-1, 5),
      //                                     color: Color.fromARGB(
      //                                         255, 199, 194, 191),
      //                                     blurRadius: 10,
      //                                     spreadRadius: 2),
      //                               ],
      //                               borderRadius:
      //                                   BorderRadius.all(Radius.circular(20))),
      //                           child: Column(
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             children: [
      //                               SizedBox(
      //                                   width: width * 0.15,
      //                                   height: height * 0.02,
      //                                   child: const FittedBox(
      //                                       child: Text(
      //                                     'Price',
      //                                     style: TextStyle(
      //                                         fontWeight: FontWeight.bold),
      //                                   ))),
      //                               SizedBox(
      //                                   width: width * 0.1,
      //                                   height: height * 0.05,
      //                                   child: const Icon(
      //                                     Icons.phone,
      //                                     color: Colors.blue,
      //                                   )),
      //                               SizedBox(
      //                                   width: width * 0.15,
      //                                   height: height * 0.02,
      //                                   child: FittedBox(
      //                                       child: Text(
      //                                     '',
      //                                     style: const TextStyle(
      //                                         fontWeight: FontWeight.bold),
      //                                   ))),
      //                             ],
      //                           ),
      //                         ),
      //                         Row(
      //                           mainAxisAlignment:
      //                               MainAxisAlignment.spaceBetween,
      //                           children: [
      //                             Container(
      //                               width: width * 0.24,
      //                               height: height * 0.15,
      //                               decoration: const BoxDecoration(
      //                                   color: Colors.white,
      //                                   boxShadow: [
      //                                     BoxShadow(
      //                                         offset: Offset(-1, 5),
      //                                         color: Color.fromARGB(
      //                                             255, 199, 194, 191),
      //                                         blurRadius: 10,
      //                                         spreadRadius: 2),
      //                                   ],
      //                                   borderRadius: BorderRadius.all(
      //                                       Radius.circular(20))),
      //                               child: Column(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.center,
      //                                 children: [
      //                                   SizedBox(
      //                                       width: width * 0.15,
      //                                       height: height * 0.03,
      //                                       child: const FittedBox(
      //                                           child: Text(
      //                                         'Mobile no.',
      //                                         style: TextStyle(
      //                                             fontWeight: FontWeight.bold),
      //                                       ))),
      //                                   SizedBox(
      //                                       width: width * 0.1,
      //                                       height: height * 0.04,
      //                                       child: const Icon(
      //                                         Icons.person_add_alt,
      //                                         color: Colors.blue,
      //                                       )),
      //                                   SizedBox(
      //                                       width: width * 0.2,
      //                                       height: height * 0.03,
      //                                       child: const FittedBox(
      //                                           child: Text(
      //                                         '',
      //                                         style: TextStyle(
      //                                             fontWeight: FontWeight.bold),
      //                                       ))),
      //                                 ],
      //                               ),
      //                             ),
      //                             Container(
      //                               width: width * 0.24,
      //                               height: height * 0.15,
      //                               decoration: const BoxDecoration(
      //                                   color: Colors.white,
      //                                   boxShadow: [
      //                                     BoxShadow(
      //                                         offset: Offset(-1, 5),
      //                                         color: Color.fromARGB(
      //                                             255, 199, 194, 191),
      //                                         blurRadius: 10,
      //                                         spreadRadius: 2),
      //                                   ],
      //                                   borderRadius: BorderRadius.all(
      //                                       Radius.circular(20))),
      //                               child: Column(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.center,
      //                                 children: [
      //                                   SizedBox(
      //                                       width: width * 0.15,
      //                                       height: height * 0.02,
      //                                       child: const FittedBox(
      //                                           child: Text(
      //                                         'Vehicle no.',
      //                                         style: TextStyle(
      //                                             fontWeight: FontWeight.bold),
      //                                       ))),
      //                                   SizedBox(
      //                                       width: width * 0.1,
      //                                       height: height * 0.05,
      //                                       child: const Icon(
      //                                         Icons.star,
      //                                         color: Colors.blue,
      //                                       )),
      //                                   SizedBox(
      //                                       width: width * 0.15,
      //                                       height: height * 0.02,
      //                                       child:const FittedBox(
      //                                           child: Text(
      //                                         '',
      //                                         style:  TextStyle(
      //                                             fontWeight: FontWeight.bold),
      //                                       ))),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: height * 0.03,
      //                   ),
      //                   Container(
      //                     width: width * 0.7,
      //                     height: height * 0.002,
      //                     color: const Color.fromARGB(255, 213, 215, 215),
      //                   )
      //                 ],
      //               ),
      //             ))
      //       ],
      //     )),
    );
  }
}
