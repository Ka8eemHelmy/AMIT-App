import 'package:amit_task/Layouts/CartScreen.dart';
import 'package:amit_task/Layouts/CategoriesScreen.dart';
import 'package:amit_task/Layouts/MenuScreen.dart';
import 'package:amit_task/Layouts/ProductsScreen.dart';
import 'package:amit_task/Layouts/SignUpScreen.dart';
import 'package:amit_task/Models/Carts.dart';
import 'package:amit_task/Models/Categories.dart';
import 'package:amit_task/Models/Products.dart';
import 'package:amit_task/Models/User.dart';
import 'package:amit_task/Shared/Cubit/AppStates.dart';
import 'package:amit_task/Shared/Network/Remote/DioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  //Define List Objects from Screens
  List<Widget> screens = [
    ProductsScreen(),
    CategoriesScreen(),
    CartScreen(),
    MenuScreen(),
  ];

  //Index of Button Navigator
  int navigationIndex = 0;

  //Define of State of Suffix Icon of Password
  bool passIcon = true;

  //Define List of Map Categories Data
  List<Category> categoriesList = [];

  //Define List of Map Products Data
  List<Product> productsList = [];

  //Define List of Cart
  // List<Carts> cartsList = [];

  //Define User Model
  User? user;

  //Define List of Products of Category by ID
  List<Product> ProductsOfCategory=[];

  //Define bool toggle get product
  bool toggleProducts = true;

  //Change Index of BottomNavigationBar
  void bottomNavigationIndexChanged(int index) {
    navigationIndex = index;
    if (navigationIndex == 0) {
      getProductssData();
    } else if (navigationIndex == 1) {
      getCategoriesData();
    }
    emit(BottomNavigationIndexChanged());
  }

  //Change Suffix Icon of ObsecureText
  void passwordSuffixChanged(bool icon) {
    passIcon = icon;
    emit(PasswordSuffixChanged());
  }

  //Get Categories Data From API
  void getCategoriesData() {
    emit(GetCategoriesDataLoading());
    if (categoriesList.length == 0) {
      DioHelper.getData(url: 'api/categories', query: {
        '': '',
      }).then((value) {
        for (final catMap in value.data['categories']) {
          Category cat = Category.fromJson(catMap);
          categoriesList.add(cat);
        }
        // print(value.data.toString());
        // categories=value.data['categories'];
        //  print(categoriesList.toString());
        emit(GetCategoriesDataSuccess());
      }).catchError((error) {
        print('Error getData : $error');
        emit(GetCategoriesDataError(error));
      });
    } else {
      emit(GetCategoriesDataSuccess());
    }
  }

  //Get Products Data From API
  void getProductssData() {
    emit(GetProductsDataLoading());
    if (productsList.length == 0) {
      DioHelper.getData(url: 'api/products', query: {
        '': '',
      }).then((value) {
        for (final mapProduct in value.data['products']) {
          Product product = Product.fromJson(mapProduct);
          productsList.add(product);
        }
        // print(value.data.toString());
        // productsList=value.data['products'];
        // print(productsList.toString());
        emit(GetProductsDataSuccess());
      }).catchError((error) {
        print('Error getData : $error');
        emit(GetProductsDataError(error));
      });
    } else {
      emit(GetProductsDataSuccess());
    }
  }

  void userLogin(String email, String password) {
    emit(LoginLoading());
    DioHelper.postData(
      url: 'api/login',
      data: {
        "email": "$email",
        "password": "$password",
      },
    ).then((value) {
      //print(value.data);
      for (final mapProduct in value.data[0]) {
        user = User.fromJson(mapProduct);
      }
      print('token here : ${user!.token}');
      //getUserData();
      emit(LoginSuccess());
    }).catchError((error) {
      print('Error Login here : $error');
      emit(LoginError(error));
    });
  }

  void getUserData() {
    emit(GetUserDataLoading());
    //DioHelper.dio!.options.headers["Authorization"] = "Bearer " + user.token;
    DioHelper.getData(url: 'api/user', query: {
      '': '',
    }).then((value) {
      for (final mapProduct in value.data[0]) {
        user = User.fromJson2(mapProduct);
      }
      print(user.toString());
      emit(GetUserDataSuccess());
    }).catchError((error) {
      print('Error getData : $error');
      emit(GetUserDataError(error));
    });
  }

  void userRegister(String name, String email, String password) {
    emit(RegisterLoading());
    DioHelper.postData(
      url: 'api/register',
      data: {
        "name" : "$name",
        "email": "$email",
        "password": "$password",
      },
    ).then((value) {
      print(value.data);
      user!.name = name;
      user!.email = email;
      for (final mapProduct in value.data[0]) {
        user = User.fromJson(mapProduct);
      }
      print('token here : ${user!.token}');
      //getUserData();
      emit(RegisterSuccess());
    }).catchError((error) {
      print('Error Login here : $error');
      emit(RegisterError(error));
    });
  }

  void getCategoryProducts(int catID){
    emit(GetCategoryProductsLoading());
    ProductsOfCategory=[];
    for(int i=0;i<productsList.length;i++){
      if(productsList[i].categoryID==catID){
        ProductsOfCategory.add(productsList[i]);
      }
    }
    toggleProduct(false);
    emit(GetCategoryProductsSuccess());
  }

  void toggleProduct(bool toggle){
    toggleProducts = toggle;
  }

// void changeQuantityOfCart(Product product, int quantity){
//
// }
}
