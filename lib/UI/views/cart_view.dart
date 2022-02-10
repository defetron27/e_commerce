import 'package:e_commerce/UI/widgets/cart_item_card.dart';
import 'package:e_commerce/core/viewmodels/cart_model.dart';
import 'package:e_commerce/helpers/constants.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  final CartModel model;

  const CartView({Key? key, required this.model}) : super(key: key);

  _showConfirmationAlertDialog(BuildContext context) {
    Widget confirmButton = FlatButton(
      child: const Text("Confirm"),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
    );
    Widget cancelButton = FlatButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop(false);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Confirm Purchase?"),
      content: Text("Grant Total: \$${model.totalCost}"),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((confirmedPurchased) {
      if (confirmedPurchased) {
        _showConfirmedAlertDialog(context);
      }
    });
  }

  _showConfirmedAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: const Text("Ok"),
      onPressed: () {
        model.clearCart();
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Ordered Confirmed"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(ViewTitle.Cart),
        actions: <Widget>[
          model.cartSize > 0
              ? IconButton(
                  icon: const Icon(Icons.done),
                  onPressed: () async {
                    _showConfirmationAlertDialog(context);
                  },
                )
              : Container()
        ],
      ),
      body: model.cartSize > 0
          ? ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Padding(
                      child: CartItemCard(model.getProduct(index),
                          model.getProductQuantity(index)),
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ],
                );
              },
              itemCount: model.getCartSummary().keys.length,
            )
          : Center(
              child: Text(
                'Your cart is empty',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
    );
  }
}
