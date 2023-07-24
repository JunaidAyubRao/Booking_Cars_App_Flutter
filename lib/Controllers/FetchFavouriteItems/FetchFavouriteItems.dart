import 'package:booking_car_app_flutter/Controllers/FetchFavouriteItems/FavouriteState.dart';
import 'package:booking_car_app_flutter/Controllers/FetchFavouriteItems/FavouriteStateNotifierProvider.dart';
import 'package:booking_car_app_flutter/Models/Cars.dart';
import 'package:booking_car_app_flutter/Models/Utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFavouriteWidget extends ConsumerWidget {
  const MyFavouriteWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xff302b27),
      body: Consumer(
        builder: (context, ref, child) {
          var state = ref.watch(favouriteStateNotifierProvider);
          if (state is FavouriteLoadingState) {
            return const AlbumFavouriteLoadingWidget();
          } else if (state is FavouriteLoadidState) {
            return AlbumFavouriteLoadedWidget(
                favouriteAlbums:
                    (state as FavouriteLoadidState).favouriteAlbums);
          } else {
            return AlbumFavouriteErrorWidget(
                errorMessage: (state as FavouriteErrorState).errorMessage);
          }
        },
      ),
    );
  }
}

class AlbumFavouriteLoadingWidget extends ConsumerWidget {
  const AlbumFavouriteLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(favouriteStateNotifierProvider.notifier).fetchFavouriteData();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class AlbumFavouriteLoadedWidget extends StatefulWidget {
  AlbumFavouriteLoadedWidget({required this.favouriteAlbums, super.key});
  final List<Cars> favouriteAlbums;

  @override
  State<AlbumFavouriteLoadedWidget> createState() =>
      _AlbumFavouriteLoadedWidgetState();
}

class _AlbumFavouriteLoadedWidgetState
    extends State<AlbumFavouriteLoadedWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final _auth = FirebaseAuth.instance;

    final db = FirebaseFirestore.instance
        .collection('FavouriteItems')
        .doc(_auth.currentUser!.uid);
    void userProfile() {}

    return ListView.builder(
        itemCount: widget.favouriteAlbums.length,
        itemBuilder: (BuildContext ctx, index) {
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
                    child: IconButton(
                      onPressed: () {
                        db.delete().then((value) {
                          Utils().toastMessage('Successfully Deleted');
                        }).onError((error, stackTrace) {
                          Utils().toastMessage('Not Deleted');
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: width * 0.09,
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    height: height * 0.2,
                    child: Image.network(
                      widget.favouriteAlbums[index].path.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.05),
                    child: Container(
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
                                widget.favouriteAlbums[index].name.toString(),
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
                                    'Type: ${widget.favouriteAlbums[index].price.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ))),
                              SizedBox(
                                  width: width * 0.18,
                                  height: height * 0.02,
                                  child: FittedBox(
                                      child: Text(
                                    'Seats: ${widget.favouriteAlbums[index].seats.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ))),
                              SizedBox(
                                  width: width * 0.3,
                                  height: height * 0.02,
                                  child: FittedBox(
                                      child: Text(
                                    'Price: Rs.${widget.favouriteAlbums[index].price.toString()}',
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

class AlbumFavouriteErrorWidget extends StatelessWidget {
  const AlbumFavouriteErrorWidget({required this.errorMessage, super.key});
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
