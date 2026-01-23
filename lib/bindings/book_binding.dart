import 'package:get/get.dart';
import '../controllers/book_controller.dart';
import '../controllers/payment_controller.dart';

class BookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookController>(() => BookController());
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
