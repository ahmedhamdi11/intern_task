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
  late LoginResponse loginRespons;
  Future<void> loginUser(
      {required String name, required String phoneNumber}) async {
    emit(LoginLoadingState());
    final request = LoginRequest(name: name, phoneNumber: phoneNumber);

    try {
      final response = await DioHelper.postData(
          url: '$kBaseURL$kVerifyPhone', body: request.toJson());
      loginRespons = LoginResponse.fromJson(response.data);
      if (loginRespons.status == 200) {
        emit(LoginSuccessState());
      } else {
        emit(LoginFailureState(loginRespons.message ?? 'faild to login'));
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
  String? otpField1;
  String? otpField2;
  String? otpField3;
  String? otpField4;

  late OtpResponse otpResponse;
  Future<void> verifyUser(
      {required String code, required String phoneNumber}) async {
    emit(OtpLoadingState());
    final request = OtpRequest(code: code, phone: phoneNumber);

    try {
      final response = await DioHelper.postData(
          url: '$kBaseURL$kOtp', body: request.toJson());
      print(response.data);

      otpResponse = OtpResponse.fromJson(response.data);
      if (otpResponse.status == 200) {
        emit(OtpSuccessState());
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
      var response = await DioHelper.getData(url: '$kBaseURL$kgetProducts');
      if (response.statusCode == 200) {
        GetProductsResponse productsResponse =
            GetProductsResponse.fromJson(response.data);

        if (productsResponse.status == 200) {
          emit(GetProductsSuccessState(productsResponse.products!));
        } else {
          emit(GetProductsFailureState(
            productsResponse.message,
          ));
        }
      } else {
        emit(GetProductsFailureState(
          'faild to Get Products ,status code: ${response.statusCode}',
        ));
      }
    } catch (e) {
      if (e is DioError) {
        emit(GetProductsFailureState(
          e.message,
        ));
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
      var response = await DioHelper.getData(url: '$kBaseURL$kgetHelp');
      if (response.statusCode == 200) {
        HelpResponse helpResponse = HelpResponse.fromJson(response.data);

        if (helpResponse.status == 200) {
          emit(GetHelpSuccessState(helpResponse.help!));
        } else {
          emit(GetHelpFailureState(
            helpResponse.message,
          ));
        }
      } else {
        emit(GetHelpFailureState(
          'faild to load help page,status code: ${response.statusCode}',
        ));
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
