import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

class CardNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return const {
      Product(
          id: '4',
          title: 'Red Backpack',
          price: 14,
          image: 'assets/products/backpack.png'),
    };
  }

  void addProduct(Product product) {
    if(!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if(state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }

}

final cardNotifierProvider = NotifierProvider<CardNotifier, Set<Product>>(
  () {
    return CardNotifier();
  },
);
