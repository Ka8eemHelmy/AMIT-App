import 'package:flutter/material.dart';
import '../Models/Products.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  //Define List Objects from Class Products
  List<Products> data = [
    Products(
        "https://scontent.fcai20-6.fna.fbcdn.net/v/t39.30808-6/p526x296/272024672_421759309742115_1819085404089451442_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=3pJgBMfP6YsAX_cNr5A&_nc_ht=scontent.fcai20-6.fna&oh=00_AT-pJ43g51aJ_rJHPWkKc5sAOd9GzBFkCsfGs2Ba3Ym_hQ&oe=61EF2A8E",
        "Iphone 14 Pro",
        "Iphone 14 pro, 256GB, 12MB Prime, 12 MB Front, A15",
        34999.9),
    Products(
        "https://lh3.googleusercontent.com/uY0DBQik6UA-8r3u940KST-4No0y-XK9SdLkA8cirg9XMg5hw43uvY04aMt_suipYETIU-g7GYZ12T1nUvefZBSpugr9xlvkvVb9L6p5EibJwYIX2A",
        "Air-Pods mi",
        "Man White Regular Fitness",
        899.9),
    Products(
        "https://www.jnjcanada.com/sites/consumer_ca/files/taco-images/2.0_essentialhealth1.jpg",
        "Listerine Total Care",
        "Listerine Total Care for Men",
        199.9),
    Products(
        "https://hbr.org/resources/images/article_assets/2014/10/R1411C_LABROOY.jpg",
        "Smart Twist",
        "Smart Twist you can prepare your Break fast with your Mobile",
        1749.9),
    Products(
        "https://www.lays.com/sites/lays.com/files/2021-07/XL%20LKC%20Jalapeno%20copy_0.png",
        "Lays Kettle Cooked",
        "Lays Jalapeno Chepssy",
        19.9),
    Products(
        "https://cigars.roku.com/v1/http%3A%2F%2Fimage.roku.com%2Fw%2Frapid%2Fimages%2Fundefined%2F2b205f82-ce7d-49d3-b536-75a6c42500be.png",
        "Roku Tv",
        "Roku Smart Satellite Switcher",
        499.0),
    Products(
        "https://i.pinimg.com/originals/85/7e/86/857e86fa95ec833032b8eccf5d7e6cd0.jpg",
        "Headphones Genegix",
        "Headphones Combattable with all Smart Phones",
        349.9),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          //to animate the Scroll to be Bouncing
          physics: BouncingScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1 / 1.49,
          children: List.generate(
            data.length,
            (index) => buildHomeItem(data[index]),
          ),
        ),
      ),
    );
    ;
  }

  //Widget that build one Item of Products
  Widget buildHomeItem(Products product) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "${product.imageSrc}",
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${product.productName}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ("${product.productDescription}"),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.0,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_box,
                    size: 30,
                  ),
                  color: Colors.red,
                ),
                Spacer(),
                Text(
                  "${product.productPrice.toString()} EGP",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
