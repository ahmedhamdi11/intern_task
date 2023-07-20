part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

// login states
class LoginLoadingState extends GlobalState {}

class LoginSuccessState extends GlobalState {}

class LoginFailureState extends GlobalState {
  final String errMessage;

  LoginFailureState(this.errMessage);
}

// otp states
class OtpLoadingState extends GlobalState {}

class OtpSuccessState extends GlobalState {}

class OtpFailureState extends GlobalState {
  final String errMessage;

  OtpFailureState(this.errMessage);
}

// get help states
class GetHelpLoadingState extends GlobalState {}

class GetHelpSuccessState extends GlobalState {
  final List<HelpModel> helpData;

  GetHelpSuccessState(this.helpData);
}

class GetHelpFailureState extends GlobalState {
  final String errMessage;

  GetHelpFailureState(this.errMessage);
}

//  get products states
class GetProductsLoadingState extends GlobalState {}

class GetProductsSuccessState extends GlobalState {
  final List<ProductsModel> products;

  GetProductsSuccessState(this.products);
}

class GetProductsFailureState extends GlobalState {
  final String errMessage;

  GetProductsFailureState(this.errMessage);
}
