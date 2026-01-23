import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';

class PaymentController extends GetxController {
  var isLoading = false.obs;

  /// Simple payment demo - just opens Midtrans payment page
  /// For production, replace with your actual payment link
  Future<void> startPayment({required String bookTitle, required int amount}) async {
    isLoading.value = true;

    try {
      debugPrint('Starting payment for $bookTitle - Rp $amount');
      
      // Demo payment link - replace with your actual payment link
      // You can create one at: https://dashboard.sandbox.midtrans.com/
      final paymentLink = 'https://app.sandbox.midtrans.com/payment-links/43074111-e7d0-4c9c-b25c-a42ff1c2ea54';
      
      // Or use a Snap token if you have one:
      // final snapToken = 'YOUR_SNAP_TOKEN_HERE';
      // final paymentLink = 'https://app.sandbox.midtrans.com/snap/v2/vtweb/$snapToken';

      debugPrint('Payment link: $paymentLink');
      
      // Navigate to midtrans page with payment link
      Get.toNamed(AppRoutes.midtrans, arguments: paymentLink);
    } catch (e) {
      debugPrint('Error: $e');
      Get.snackbar('Error', 'Payment error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}