import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/book_model.dart';

class BookService {
  final CollectionReference books = FirebaseFirestore.instance.collection(
    'books',
  );

  Stream<List<Book>> streamBooks() {
    return books.orderBy('created_at', descending: true).snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) {
        return Book.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  Future<void> addBook(Book book) {
    return books.add(book.toMap());
  }

  Future<void> updateBook(Book book) {
    return books.doc(book.id).update(book.toMap());
  }

  Future<void> deleteBook(String id) {
    return books.doc(id).delete();
  }
}
