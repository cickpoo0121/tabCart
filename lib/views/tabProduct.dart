import 'package:flutter/material.dart';
import 'package:tab_shopping/controllers/productController.dart';
import 'package:get/get.dart';

class TabProduct extends StatelessWidget {
  final ProductController _productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _productController.productList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(
            'assets/images/${_productController.productList[index].name}.png',
            width: 100,
          ),
          title: Text(_productController.productList[index].name),
          subtitle: Text('${_productController.productList[index].price}'),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // add product
              Get.snackbar(
                'Adding',
                _productController.productList[index].name,
                duration: Duration(seconds: 1),
              );
              _productController.addToCart(index);
              _productController.totoal();
            },
          ),
        );
      },
    );
  }
}
