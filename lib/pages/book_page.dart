import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_controller.dart';
import '../widgets/book_card.dart';
import '../widgets/book_dialog.dart';

class BookPage extends GetView<BookController> {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Book Management')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.books.isEmpty) {
          return const Center(child: Text('No books yet'));
        }

        final isWideScreen = screenWidth >= 600;

        if (isWideScreen) {
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3 / 0.95,
            ),
            itemCount: controller.books.length,
            itemBuilder: (context, index) {
              final book = controller.books[index];
              return BookCard(
                book: book,
                onEdit: () => showBookFormDialog(controller, book: book),
                onDelete: () => controller.deleteBook(book.id),
              );
            },
          );
        } else {
          return ListView.builder(
            itemCount: controller.books.length,
            itemBuilder: (context, index) {
              final book = controller.books[index];
              return BookCard(
                book: book,
                onEdit: () => showBookFormDialog(controller, book: book),
                onDelete: () => controller.deleteBook(book.id),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBookFormDialog(controller);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
