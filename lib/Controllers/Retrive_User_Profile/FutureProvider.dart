import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final userProfileProvider =
    FutureProvider.autoDispose<Map<String, dynamic>>((ref) async {
  // Replace 'userId' with the actual user ID (e.g., obtained after authentication)
  final userId = FirebaseAuth.instance.currentUser?.uid;

  try {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('Authentication')
        .doc(userId)
        .get();

    if (userSnapshot.exists) {
      // User profile data exists in Firestore
      return userSnapshot.data() as Map<String, dynamic>;
    } else {
      // Handle the case where the user profile is not found
      return userSnapshot.hashCode as Map<String, dynamic>;
    }
  } catch (e) {
    // Handle any errors that occur during the fetch operation
    print("Error fetching user profile: $e");
    return Future.delayed(const Duration(seconds: 1));
  }
});
