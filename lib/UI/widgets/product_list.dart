import 'package:e_commerce/UI/widgets/product_card.dart';
import 'package:e_commerce/core/models/product.dart';
import 'package:e_commerce/core/viewmodels/cart_model.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList(this.products, this.cartModel, {Key? key}) : super(key: key);

  final List<Product> products;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Padding(
              child: InkWell(
                child: ProductCard(products[index]),
                onTap: () {
                  // TODO 15: Call Add To Cart
                }
              ),
              padding: const EdgeInsets.all(10.0),
            ),
          ],
        );
      },
      itemCount: products.length,
    );
  }
}
