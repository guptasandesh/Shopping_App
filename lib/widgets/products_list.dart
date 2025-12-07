import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/pages/product_detail_page.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
   final List<String> filters = const['All', 'H&M', 'Zara', 'Polo Assn', 'Ralph Lauren'];
  late String selectedFilter;

  @override
  void initState(){
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(119, 119, 119, 1),
                        ),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                      );
    return SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Clothes\nCollection", 
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0
                      ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter ?
                         Theme.of(context).colorScheme.primary : 
                         Color.fromRGBO(233, 239, 244, 1),
                        side: BorderSide(
                          color: Color.fromRGBO(233, 239, 244, 1),
                        ),
                        shape: RoundedRectangleBorder(  
                          borderRadius: BorderRadiusGeometry.circular(50),
                        ),
                        label: Text(filter),
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15
                          ),
                        ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index){
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context){
                              return ProductDetailPage(product: product);
                            }
                          ),
                        );
                      },
                      child: ProductCard(
                        title: product['title'] as String, 
                        price: product['price'] as double,
                        image: product['imageUrl'] as String,
                        ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
  }
}