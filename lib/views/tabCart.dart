import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_shopping/controllers/productController.dart';

class TabCart extends StatelessWidget {
  final ProductController _productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: _productController.cartList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(
                  'assets/images/${_productController.cartList[index].name}.png',
                  width: 100,
                ),
                title: Text(_productController.cartList[index].name),
                subtitle: Text(
                    '${_productController.cartList[index].price} baht x ${_productController.cartList[index].amount} unit(s)'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // remove a unit of product
                    Get.snackbar(
                      'Remove',
                      _productController.cartList[index].name,
                      duration: Duration(seconds: 1),
                    );
                    _productController.deleteProduct(index);
                    _productController.totoal();
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: 14,
          ),
          Text('Total price = ${_productController.totoal()} baht')
        ],
      ),
    );
  }
}
