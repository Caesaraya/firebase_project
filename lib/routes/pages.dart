import 'package:flutter_firebase/bindings/book_binding.dart';
import 'package:flutter_firebase/pages/book_page.dart';
import 'package:flutter_firebase/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.book,
      page: () => BookPage(),
      binding: BookBinding(),
    ),
  ];
}
