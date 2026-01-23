import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/book_model.dart';
import '../controllers/payment_controller.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const BookCard({
    super.key,
    required this.book,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final paymentController = Get.find<PaymentController>();
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(
          book.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('Penulis : ${book.author}'),
            Text('Kategori : ${book.category}'),
            Text('Harga : Rp ${book.harga}'),
          ],
        ),
        isThreeLine: true,
        onTap: onEdit,
        trailing: SizedBox(
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.payment, color: Colors.green),
                onPressed: () => paymentController.startPayment(
                  bookTitle: book.title,
                  amount: book.harga,
                ),
                tooltip: 'Bayar',
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
                tooltip: 'Hapus',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
