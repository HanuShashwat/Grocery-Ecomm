import 'package:flutter/material.dart';
import 'package:grocery_ecomm/features/home/models/product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;

  const ProductTileWidget({super.key, required this.productDataModel});

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
                      // homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
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
