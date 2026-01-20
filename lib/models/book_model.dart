import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  String id;
  String title;
  String author;
  String category;
  int harga;
  Timestamp createdAt;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.harga,
    required this.createdAt,
  });

  factory Book.fromFirestore(Map<String, dynamic> json, String id) {
    return Book(
      id: id,
      title: json['title'],
      author: json['author'],
      category: json['category'],
      harga: json['harga'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'category': category,
      'harga': harga,
      'created_at': createdAt,
    };
  }
}
