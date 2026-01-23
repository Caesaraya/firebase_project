import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/book_model.dart';
import '../services/firestore_services.dart';

class BookController extends GetxController {
  final BookService _service = BookService();

  var books = <Book>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  void fetchBooks() {
    isLoading.value = true;
    _service.streamBooks().listen((data) {
      books.value = data;
      isLoading.value = false;
    });
  }

  Future<void> addBook({
    required String title,
    required String author,
    required String category,
    required int harga,
  }) async {
    Book book = Book(
      id: '',
      title: title,
      author: author,
      category: category,
      harga: harga,
      createdAt: Timestamp.now(),
    );
    await _service.addBook(book);
  }

  Future<void> updateBook(Book book) async {
    await _service.updateBook(book);
  }

  Future<void> deleteBook(String id) async {
    await _service.deleteBook(id);
  }
}
