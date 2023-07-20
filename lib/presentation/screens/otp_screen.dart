import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intern_task/business_logic/global_cubit/global_cubit.dart';
import 'package:intern_task/data/data_providers/local/cache_helper.dart';
import 'package:intern_task/presentation/styles/colors.dart';
import 'package:intern_task/presentation/widget/default_button.dart';
import 'package:intern_task/presentation/widget/otp_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    GlobalCubit cubit = BlocProvider.of<GlobalCubit>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // background gradient
        decoration: const BoxDecoration(
          gradient: AppColor.backgroundGradient,
        ),

        // body
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 80.0,
                ),

                // screen title
                const Text(
                  'Verify Phone',
                  style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 100.0),

                // otp fields
                OtpFields(
                  formKey: formKey,
                ),

                const SizedBox(height: 80.0),

                // resend otp code button
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(height: 80.0),

                // verify code button
                BlocConsumer<GlobalCubit, GlobalState>(
                  listener: (context, state) {
                    if (state is OtpFailureState) {
                      _onFailureState(state);
                    }
                    if (state is OtpSuccessState) {
                      // if verify user is success then show the respons message
                      // and navigate to the help screen
                      // and save the user data in the cach using the shared prefs
                      _onSuccessState(state, context);
                    }
                  },
                  builder: (context, state) {
                    if (state is OtpLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return DefaultButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.verifyUser(
                            code: cubit.otpField1 +
                                cubit.otpField2 +
                                cubit.otpField3 +
                                cubit.otpField4,
                            phoneNumber: widget.phoneNumber,
                          );
                        }
                      },
                      btnText: 'Verify',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onFailureState(OtpFailureState state) {
    // show the error message in a toast
    Fluttertoast.showToast(
      msg: state.errMessage,
      backgroundColor: Colors.red,
    );
  }

  void _onSuccessState(OtpSuccessState state, BuildContext context) {
    // show the success message in a toast
    Fluttertoast.showToast(
      msg: state.response.message,
      backgroundColor: AppColor.primaryColor,
    );

    // navigate to the help screen
    Navigator.of(context).pushNamedAndRemoveUntil('/help', (route) => false);

    // save user data
    CacheHelper.saveDataSharedPreference(
      key: 'id',
      value: state.response.account!.id,
    );
    CacheHelper.saveDataSharedPreference(
      key: 'name',
      value: state.response.account!.name,
    );
    CacheHelper.saveDataSharedPreference(
      key: 'phone',
      value: state.response.account!.phone,
    );
  }
}
