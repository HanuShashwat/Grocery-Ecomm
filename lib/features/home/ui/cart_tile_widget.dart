import 'package:flutter/material.dart';
import 'package:grocery_ecomm/features/cart/ui/cart_bloc.dart';

import '../models/product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartTileWidget({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '\$' + productDataModel.price.toString(),
            style: TextStyle(fontSize: 18, fontWeight: .bold),
          ),
          const SizedBox(height: 4),
          Text(
            productDataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: .bold),
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(productDataModel.description),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(
                      //   HomeProductWishlistButtonClickedEvent(
                      //     clickedProduct: productDataModel,
                      //   ),
                      // );
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(
                        ItemRemoveFromCartEvent(
                          productDataModel: productDataModel,
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_bag),
                  ),
                ],
              ),
            ],
          ),
          // Text(productDataModel.price.toString()),
        ],
      ),
    );
  }
}
