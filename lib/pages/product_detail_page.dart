import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({
    super.key,
    required this.product,
    });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedSize = 0;

  void onTap(){
    if(selectedSize != 0){
      Provider.of<CartProvider>(context, listen: false).addProduct({  
    'id': widget.product['id'],
    'title': widget.product['title'],
    'price': widget.product['price'],
    'imageUrl': widget.product['imageUrl'],
    'company': widget.product['company'],
    'sizes': selectedSize,
    });
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product added successfully!!"
          )
        )
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select a size!!"
          )
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details"
          ),
      ),
      body: Column(
        children: [
          Spacer(),
          Image.asset(widget.product["imageUrl"] as String, height: 250,),
          Spacer(),
          Center(
            child: Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
              ),
          ),
          Spacer(flex: 4),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Color.fromRGBO(224, 225, 226, 1),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${widget.product['price']}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20),

                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index){
                      final size = (widget.product['sizes'] as List<int>)[index];
                  
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor: selectedSize == size ? 
                            Theme.of(context).colorScheme.primary : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: onTap,
                    icon: Icon(Icons.shopping_cart, color: Colors.black,),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    label: Text(
                      "Add to cart",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}