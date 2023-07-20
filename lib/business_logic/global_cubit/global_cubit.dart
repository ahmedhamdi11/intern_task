import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task/constants/end_points.dart';
import 'package:intern_task/data/data_providers/remote/dio_helper.dart';
import 'package:intern_task/data/models/help_model.dart';
import 'package:intern_task/data/models/products_model.dart';
import 'package:intern_task/data/network/requests/login_request.dart';
import 'package:intern_task/data/network/requests/otp_request.dart';
import 'package:intern_task/data/network/responses/get_products_response.dart';
import 'package:intern_task/data/network/responses/help_response.dart';
import 'package:intern_task/data/network/responses/login_response.dart';
import 'package:intern_task/data/network/responses/otp_response.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

// login
  Future<void> loginUser({
    required String name,
    required String phoneNumber,
  }) async {
    emit(LoginLoadingState());

    // create login request model to use it in the login post request
    final request = LoginRequest(name: name, phoneNumber: phoneNumber);

    try {
      // login user using name and phone number that the login request provids
      final response = await DioHelper.postData(
        url: '$kBaseURL$kVerifyPhone',
        body: request.toJson(),
      );

      // pass the response to the login response model
      LoginResponse loginRespons = LoginResponse.fromJson(response.data);

      if (loginRespons.status == 200) {
        emit(LoginSuccessState(loginRespons));
      } else {
        emit(LoginFailureState(loginRespons.message));
      }
    } catch (e) {
      if (e is DioError) {
        emit(LoginFailureState(e.message));
      } else {
        emit(LoginFailureState(e.toString()));
      }
    }
  }

// otp
  late String otpField1;
  late String otpField2;
  late String otpField3;
  late String otpField4;

  Future<void> verifyUser({
    required String code,
    required String phoneNumber,
  }) async {
    emit(OtpLoadingState());

    // create otp request model to use it in the post request
    final request = OtpRequest(code: code, phone: phoneNumber);

    try {
      // post the otp request
      final response = await DioHelper.postData(
        url: '$kBaseURL$kOtp',
        body: request.toJson(),
      );

      // pass the response to the otp response model
      OtpResponse otpResponse = OtpResponse.fromJson(response.data);

      if (otpResponse.status == 200) {
        emit(OtpSuccessState(otpResponse));
      } else {
        emit(OtpFailureState(otpResponse.message));
      }
    } catch (e) {
      if (e is DioError) {
        emit(OtpFailureState(e.message));
      } else {
        emit(LoginFailureState(e.toString()));
      }
    }
  }

  // get products
  Future getProducts() async {
    emit(GetProductsLoadingState());

    try {
      // fetch the products data
      final response = await DioHelper.getData(url: '$kBaseURL$kgetProducts');

      // pass the response to the products response model
      GetProductsResponse productsResponse =
          GetProductsResponse.fromJson(response.data);

      if (productsResponse.status == 200) {
        emit(GetProductsSuccessState(productsResponse.products!));
      } else {
        emit(GetProductsFailureState(
          productsResponse.message,
        ));
      }
    } catch (e) {
      if (e is DioError) {
        emit(
          GetProductsFailureState(
            e.message,
          ),
        );
      } else {
        emit(
          GetProductsFailureState(
            e.toString(),
          ),
        );
      }
    }
  }

  // get Help Data
  Future getHelpData() async {
    emit(GetHelpLoadingState());

    try {
      // fetch the help data
      var response = await DioHelper.getData(url: '$kBaseURL$kgetHelp');

      // pass the response to the help response model
      HelpResponse helpResponse = HelpResponse.fromJson(response.data);

      if (helpResponse.status == 200) {
        emit(GetHelpSuccessState(helpResponse.help!));
      } else {
        emit(
          GetHelpFailureState(
            helpResponse.message,
          ),
        );
      }
    } catch (e) {
      if (e is DioError) {
        emit(GetHelpFailureState(
          e.message,
        ));
      } else {
        emit(
          GetHelpFailureState(
            e.toString(),
          ),
        );
      }
    }
  }
}
