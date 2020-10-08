import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/cart.bloc.dart';
import 'package:shopping_bloc/models/cart-item.model.dart';
import 'package:shopping_bloc/ui/shared/cart/cart-item.widget.dart';
import 'package:shopping_bloc/ui/shared/widgets/shared/loader.widget.dart';

class CartPage extends StatelessWidget {
  var bloc;

  final price = new NumberFormat("#,##0.00", "pt_BR");
  var items = List<CartItemModel>();

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CartBloc>(context);

    items = bloc.cart;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Loader(
                object: bloc.get(),
                callback: list,
              ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "R\$ ${price.format(bloc.total)}",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  FlatButton(
                    child: Text("Checkout"),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Dismissible(
          child: CartItem(
            item: items[index],
          ),
          key: Key(items[index].id),
          onDismissed: (direction) {
            bloc.remove(items[index]);
          },
          background: Container(
            color: Colors.red.withOpacity(0.1),
          ),
        );
      },
    );
  }
}
