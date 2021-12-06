import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  final String description;
  final String reviewer;
  final double rate;
  final Timestamp timeReviewed;

  ReviewModel({
    required this.description,
    required this.reviewer,
    required this.rate,
    required this.timeReviewed,
  });
}
