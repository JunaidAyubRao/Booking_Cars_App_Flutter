import 'package:booking_car_app_flutter/Controllers/ChangeColorRiverpod/ColorStateNotifierProvider.dart';
import 'package:booking_car_app_flutter/Controllers/ChangeColorRiverpod/Colors_State.dart';
import 'package:booking_car_app_flutter/Controllers/FetchHomeVihicleItemsRiverpod/Cars_State.dart';
import 'package:booking_car_app_flutter/Controllers/FetchHomeVihicleItemsRiverpod/StateNotifierProvider.dart';
import 'package:booking_car_app_flutter/Models/Cars.dart';
import 'package:booking_car_app_flutter/Models/Utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff302b27),
      body: Consumer(
        builder: (context, ref, child) {
          var state = ref.watch(carsStateProvider);
          if (state is CarsLoadingState) {
            return const AlbumLoadingWidget();
          } else if (state is CarsLoadidState) {
            return AlbumLoadedWidget(albums: state.albums);
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

class AlbumInitialWidget extends ConsumerWidget {
  const AlbumInitialWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: InkWell(
          onTap: () {
            ref.read(carsStateProvider.notifier).fetchData();
          },
          child: const Text('Click To Load Data')),
    );
  }
}

class AlbumLoadingWidget extends ConsumerWidget {
  const AlbumLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(carsStateProvider.notifier).fetchData();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class AlbumLoadedWidget extends ConsumerWidget {
  AlbumLoadedWidget({required this.albums, super.key});
  final List<Cars> albums;
  // bool colors=Colors.white;
  final _firestore = FirebaseFirestore.instance.collection('FavouriteItems');
  final auth = FirebaseAuth.instance;
  void addFavouriteItems(Cars cars) {
    String imageName = cars.name;
    String imagePath = cars.path;
    num imagePrice = cars.price;
    num seats = cars.seats;
    String type = cars.type;
    String id = cars.id;
    _firestore
        .doc(id)
        .set({
          'path': imagePath,
          'name': imageName,
          'price': imagePrice,
          'seats': seats,
          'type': type,
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

    return ListView.builder(
        itemCount: albums.length,

        // itemExtent: 350,
        // padding: EdgeInsets.only(bottom: 100),
        itemBuilder: (BuildContext ctx, index) {
          // albums = firestoreState[];
          // final colors = colorChangeProvider;

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              width: width,
              height: height * 0.4,
              decoration: const BoxDecoration(
                  color: Color(0xff302b27),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.77, top: height * 0.02),
                    child: Consumer(builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      // final bool changeColor =
                      //     ref.watch(itemsFavouriteProvider);
                      return IconButton(
                        onPressed: () {
                          if (ref.watch(colorStateProvider.call(index))
                              is FavouriteState) {
                            ref
                                .read(colorStateProvider.call(index).notifier)
                                .nonFavourite;
                          } else {
                            ref
                                .read(colorStateProvider.call(index).notifier)
                                .favourite;
                            addFavouriteItems(albums[index]);
                            Utils().toastMessage('item added to favourite');
                          }
                        },
                        icon: Icon(
                          Icons.favorite_rounded,
                          color: ref.watch(colorStateProvider.call(index))
                                  is FavouriteState
                              ? Colors.redAccent
                              : Colors.white,
                          size: width * 0.09,
                        ),
                      );
                    }),
                  ),
                  // Text(list[index]),
                  Container(
                    width: width * 0.9,
                    height: height * 0.2,
                    // color: Colors.red,
                    child: Image.network(
                      albums[index].path.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Container(
                      // color: Colors.teal,
                      height: height * 0.07,
                      width: width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: width * 0.22,
                              height: height * 0.03,
                              child: FittedBox(
                                  child: Text(
                                albums[index].name.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              ))),
                          Container(
                            width: width * 0.8,
                            height: height * 0.001,
                            color: Colors.white,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: width * 0.22,
                                  height: height * 0.02,
                                  child: FittedBox(
                                      child: Text(
                                    'Type: ${albums[index].type.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ))),
                              SizedBox(
                                  width: width * 0.18,
                                  height: height * 0.02,
                                  child: FittedBox(
                                      child: Text(
                                    'Seats: ${albums[index].seats.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ))),
                              SizedBox(
                                  width: width * 0.3,
                                  height: height * 0.02,
                                  child: FittedBox(
                                      child: Text(
                                    'Price: Rs.${albums[index].price.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ))),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
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
