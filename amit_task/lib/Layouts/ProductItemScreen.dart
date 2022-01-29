import 'package:amit_task/Models/Products.dart';
import 'package:flutter/material.dart';

class ProductItemScreen extends StatelessWidget {
  final Product product;
  ProductItemScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage(product.avatar),
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${product.title}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${product.name}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.black,
                    thickness: 2.0,
                  ),
                  Row(
                    children: [
                      Text(
                        '${product.priceFinalText}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.indeterminate_check_box_rounded,
                          size: 30,
                        ),
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '1',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_box_rounded,
                          size: 30,
                        ),
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.black,
                    thickness: 2.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${product.description}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Spacer(),
                  SizedBox(height: 30.0,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {},
                    child: Container(
                      width: double.infinity,
                      height: 60.0,
                      alignment: Alignment.center,
                      child: Text(
                        'Add to Cart',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
