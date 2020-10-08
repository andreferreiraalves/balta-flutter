import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopping_bloc/blocs/cart.bloc.dart';
import 'package:shopping_bloc/models/cart-item.model.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;

  CartItem({@required this.item});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    final price = new NumberFormat("#,##0.00", "pt_BR");

    return Container(
      height: 120,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.all(10),
            child: Image.network(
              item.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title),
                Text(
                  "R\$ ${price.format(item.price)}",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 10),
                Text("R\$ ${price.format(item.price * item.quantity)}"),
                Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: FlatButton(
                          child: Text("-"),
                          onPressed: () {
                            bloc.decrease(item);
                          },
                        ),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: Text(item.quantity.toString()),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: FlatButton(
                          child: Text("+"),
                          onPressed: () {
                            bloc.increate(item);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
