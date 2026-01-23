import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_controller.dart';
import '../models/book_model.dart';

void showBookFormDialog(BookController controller, {Book? book}) {
  final titleC = TextEditingController(text: book?.title ?? '');
  final authorC = TextEditingController(text: book?.author ?? '');
  final categoryC = TextEditingController(text: book?.category ?? '');
  final priceC = TextEditingController(text: book?.harga.toString() ?? '');

  final isEdit = book != null;

  Get.defaultDialog(
    title: isEdit ? 'Edit Book' : 'Add Book',
    titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    content: SizedBox(
      width: MediaQuery.of(Get.context!).size.width * 0.7,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: titleC,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Book Title',
                prefixIcon: const Icon(Icons.book),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: authorC,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Author',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: categoryC,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Category',
                prefixIcon: const Icon(Icons.category),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: priceC,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'Price',
                prefixIcon: const Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    textCancel: 'Cancel',
    textConfirm: isEdit ? 'Update' : 'Save',
    confirmTextColor: Colors.white,
    onConfirm: () {
      if (titleC.text.trim().isEmpty ||
          authorC.text.trim().isEmpty ||
          categoryC.text.trim().isEmpty ||
          priceC.text.trim().isEmpty) {
        Get.snackbar(
          'Validation Error',
          'All fields are required',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final price = int.tryParse(priceC.text);
      if (price == null) {
        Get.snackbar(
          'Validation Error',
          'Price must be a number',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      if (isEdit) {
        controller.updateBook(
          Book(
            id: book.id,
            title: titleC.text,
            author: authorC.text,
            category: categoryC.text,
            harga: price,
            createdAt: book.createdAt,
          ),
        );
      } else {
        controller.addBook(
          title: titleC.text,
          author: authorC.text,
          category: categoryC.text,
          harga: price,
        );
      }

      Get.back();
    },
  );
}
