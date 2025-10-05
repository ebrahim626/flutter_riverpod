import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

class CardNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return const {};
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

final totalCartProvider = Provider<int>((ref){
    final totalCartProduct = ref.watch(cardNotifierProvider);
    int total = 0;
    for (Product product in totalCartProduct){
     total += product.price;
    }
    return total;
  });
