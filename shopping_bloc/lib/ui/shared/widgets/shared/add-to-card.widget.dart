import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/cart.bloc.dart';
import 'package:shopping_bloc/models/cart-item.model.dart';
import 'package:shopping_bloc/models/product-list-item.model.dart';

class AddToCard extends StatelessWidget {
  final ProductListItemModel item;

  AddToCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    var cartItem = CartItemModel(
      id: item.id,
      price: item.price,
      image: item.image,
      quantity: 1,
      title: item.title,
    );

    if (!bloc.itemInCart(cartItem)) {
      return Container(
        width: 80,
        height: 40,
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          child: Icon(Icons.add_shopping_cart),
          textColor: Colors.white,
          onPressed: () {
            bloc.add(cartItem);
            final snackBar =
                SnackBar(content: Text('${item.title} adicionado'));

            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      );
    } else {
      return Container(
        width: 80,
        height: 40,
        child: FlatButton(
          color: Colors.red,
          child: Icon(Icons.remove_shopping_cart),
          textColor: Colors.white,
          onPressed: () {
            bloc.remove(cartItem);
            final snackBar = SnackBar(content: Text('${item.title} removido'));
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
      );
    }
  }
}
