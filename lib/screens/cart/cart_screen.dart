import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/product_providers.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cardProducts = ref.watch(reducedProductProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children:
                cardProducts.map((product) {
                  return Container(
                    padding: const EdgeInsetsGeometry.symmetric(vertical: 10),
                    child: Row(children: [
                      Image.asset(product.image),
                      Text(product.title),
                      Text(product.price.toString())
                    ],),
                  );
                }).toList(), // output cart products here
            ),

            // output totals here
          ],
        ),
      ),
    );
  }
}