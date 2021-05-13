import 'package:tab_shopping/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // List of products in shop, static
  var productList = <Product>[];

  // List of product in cart, dynamic
  var cartList = <Product>[].obs;
  var totalPrice = 0.0.obs;

// load data first
  @override
  void onInit() {
    super.onInit();
    print('==============> Load data');

    // if no products
    if (productList.isEmpty) {
      productList.add(Product(name: 'Shirt', price: 220));
      productList.add(Product(name: 'Shoe', price: 550));
    }
  }

  void addToCart(int index) {
    print('==============> add product');

    // is cart empty ?
    if (cartList.isEmpty) {
      cartList.add(productList[index]);
      cartList[0].amount = 1;
      totalPrice.value += cartList[0].price;
      return;
    }

    // the product exists or not?
    int i = 0;
    for (i = 0; i < cartList.length; i++) {
      if (cartList[i].name == productList[index].name) {
        // prodect exits
        cartList[i].amount++;
        totalPrice.value += cartList[i].price;

        break;
      }
    }

    if (i == cartList.length) {
      // product does not exist in cart
      cartList.add(productList[index]);
      cartList.last.amount = 1;
      totalPrice.value += cartList.last.price;
    }

    print('Cart leng ${cartList.length}');
  }

  void deleteProduct(int index) {
    // cartList[index].amount--;

    // delete a unit of product from cart
    if (cartList[index].amount > 1) {
      var product = cartList[index];
      product.amount--;
      cartList[index] = product;
    } else {
      cartList.removeAt(index);
    }
  }

  totoal() {
    var testTotal = 0.0.obs;

    for (int i = 0; i < cartList.length; i++) {
      testTotal.value += cartList[i].amount * cartList[i].price;
      print('================== ${testTotal}');
      print(cartList[i].price);
    }

    return testTotal;
  }
}
