import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../models/models.dart';
import '../../widget/widgets.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key, required this.data});
  final List<Product> data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return StaggerTile(
              product: data[index],
              height: (index % 4 == 1 || index % 4 == 3)
                  ? MediaQuery.of(context).size.height * 0.35
                  : MediaQuery.of(context).size.height * 0.3);
        },
      ),
    );
  }
}
