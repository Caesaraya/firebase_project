import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_controller.dart';
import '../models/book_model.dart';

void showBookFormDialog(BookController controller, {Book? book}) {
  final titleC = TextEditingController(text: book?.title ?? '');
  final authorC = TextEditingController(text: book?.author ?? '');
  final categoryC = TextEditingController(text: book?.category ?? '');
  final hargaC = TextEditingController(text: book?.harga.toString() ?? '');

  final isEdit = book != null;

  Get.defaultDialog(
    title: isEdit ? 'Edit Buku' : 'Tambah Buku',
    content: Column(
      children: [
        TextField(
          controller: titleC,
          decoration: const InputDecoration(labelText: 'Judul'),
        ),
        TextField(
          controller: authorC,
          decoration: const InputDecoration(labelText: 'Penulis'),
        ),
        TextField(
          controller: categoryC,
          decoration: const InputDecoration(labelText: 'Kategori'),
        ),
        TextField(
          controller: hargaC,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Harga'),
        ),
      ],
    ),
    textCancel: 'Batal',
    textConfirm: isEdit ? 'Update' : 'Simpan',
    confirmTextColor: Colors.white,
    onConfirm: () {
      if (titleC.text.isEmpty ||
          authorC.text.isEmpty ||
          categoryC.text.isEmpty ||
          hargaC.text.isEmpty) {
        Get.snackbar(
          'Error',
          'Semua field wajib diisi',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final harga = int.tryParse(hargaC.text);
      if (harga == null) {
        Get.snackbar(
          'Error',
          'Harga harus berupa angka',
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
            harga: harga,
            createdAt: book.createdAt,
          ),
        );
      } else {
        controller.addBook(
          title: titleC.text,
          author: authorC.text,
          category: categoryC.text,
          harga: harga,
        );
      }

      Get.back();
    },
  );
}
