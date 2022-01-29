abstract class AppStates {}

class InitialState extends AppStates{}

class BottomNavigationIndexChanged extends AppStates{}

class PasswordSuffixChanged extends AppStates{}

class GetCategoriesDataSuccess extends AppStates{}

class GetCategoriesDataLoading extends AppStates{}

class GetCategoriesDataError extends AppStates{
  final String error;
  GetCategoriesDataError(this.error);
}

class GetProductsDataSuccess extends AppStates{}

class GetProductsDataLoading extends AppStates{}

class GetProductsDataError extends AppStates{
  final String error;
  GetProductsDataError(this.error);
}

class LoginLoading extends AppStates{}

class LoginSuccess extends AppStates{}

class LoginError extends AppStates{
  final String error;
  LoginError(this.error);
}

class GetUserDataLoading extends AppStates{}

class GetUserDataSuccess extends AppStates{}

class GetUserDataError extends AppStates{
  final String error;
  GetUserDataError(this.error);
}

class RegisterLoading extends AppStates{}

class RegisterSuccess extends AppStates{}

class RegisterError extends AppStates{
  final String error;
  RegisterError(this.error);
}
