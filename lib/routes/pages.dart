import 'package:flutter_firebase/bindings/book_binding.dart';
import 'package:flutter_firebase/bindings/payment_binding.dart';
import 'package:flutter_firebase/pages/book_page.dart';
import 'package:flutter_firebase/pages/payment.page.dart';
import 'package:flutter_firebase/pages/midtrans_page.dart';
import 'package:flutter_firebase/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.book,
      page: () => BookPage(),
      binding: BookBinding(),
    ),
    GetPage(
      name: AppRoutes.payment,
      page: () => PaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: AppRoutes.midtrans,
      page: () => MidtransPage(paymentLink: Get.arguments),
    ),
  ];
}
