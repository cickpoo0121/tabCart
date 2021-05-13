import 'package:flutter/material.dart';
import 'package:tab_shopping/controllers/productController.dart';
import 'package:tab_shopping/views/tabCart.dart';
import 'package:tab_shopping/views/tabProduct.dart';
import 'package:get/get.dart';

class TabMain extends StatelessWidget {
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shopping'),
        ),
        bottomNavigationBar: Container(
          // height: 70,
          color: Colors.blue,
          child: TabBar(
            tabs: [
              Tab(
                text: 'Product',
                // icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Cart',
                // icon: Icon(Icons.card_travel),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabProduct(),
            TabCart(),
          ],
        ),
      ),
    );
  }
}
