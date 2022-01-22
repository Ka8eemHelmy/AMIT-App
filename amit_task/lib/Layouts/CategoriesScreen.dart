import 'package:amit_task/Models/Categories.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  //Define List Objects from Class Categories
  List<Categories> data = [
    Categories("Fashion",
        "https://i.guim.co.uk/img/media/684c80ad06a245a3ed80395c92011069c606aaeb/0_0_5000_3000/master/5000.jpg?width=465&quality=45&auto=format&fit=max&dpr=2&s=917bf98d0b214a93c44d63bf5cdd1342"),
    Categories("Electronics",
        "https://cdn.mena-tech.com/wp-content/uploads/2021/08/MR-Future-Products-2020-2.png"),
    Categories(
        "Baby Products", "https://www.businessinsider.in/photo/53377697.cms"),
    Categories("Health & Beauty",
        "https://thumbs.dreamstime.com/b/sunscreen-body-lotion-perfume-sunglasses-yellow-scarf-pink-hand-bag-beauty-health-care-sunscreen-body-lotion-perfume-167024967.jpg"),
    Categories("Phones",
        "https://www.zdnet.com/a/img/resize/dcf1d6851d1478396d72d97ff5af06731ddccfd9/2021/09/15/b8fde65c-ceff-4349-8cb8-94d6afbf0243/apple-iphone-13-colors.jpg?width=1200&height=900&fit=crop&auto=webp"),
    Categories("Super Market",
        "https://tijaratuna.com/wp-content/uploads/2021/04/%D8%A3%D8%B4%D9%87%D8%B1-%D8%B3%D9%88%D8%A8%D8%B1-%D9%85%D8%A7%D8%B1%D9%83%D8%AA-%D9%81%D9%8A-%D9%85%D8%B5%D8%B1-1-630x300.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
            //to animate the Scroll to be Bouncing
            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1 / 0.7,
            children: List.generate(
              data.length,
              (index) => buildCategories(data[index]),
            ),
          ),
        ),
      ),
    );
  }

  //Widget that build one Item of Categories
  Widget buildCategories(Categories cat) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            cat.catImageURL,
            fit: BoxFit.cover,
            height: 200.0,
            width: double.infinity,
          ),
          Container(
            color: Colors.grey.withOpacity(0.7),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 2.0,
              ),
              child: Text(
                cat.catName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
