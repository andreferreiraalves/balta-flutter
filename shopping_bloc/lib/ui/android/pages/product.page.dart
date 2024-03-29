import 'package:flutter/material.dart';
import 'package:shopping_bloc/models/product-details.model.dart';
import 'package:shopping_bloc/repositories/product.repository.dart';
import 'package:shopping_bloc/ui/shared/widgets/shared/pregress-indicator.widget.dart';

class ProductPage extends StatelessWidget {
  final String tag;
  final _repository = new ProductRepository();

  ProductPage({@required this.tag});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailsModel>(
      future: _repository.get(tag),
      builder: (context, snapshot) {
        ProductDetailsModel product = snapshot.data;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text("Aguardando...");
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: GenericProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) return Center(child: Text(snapshot.error));
            return content(product);
        }
        return null;
      },
    );
  }

  Widget content(ProductDetailsModel product) {
    return Scaffold(
      appBar: AppBar(),
      body: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Container(
            width: 200,
            child: Image.network(product.images[index]),
          );
        },
      ),
    );
  }
}
