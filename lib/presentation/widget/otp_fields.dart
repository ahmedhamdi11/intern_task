import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task/business_logic/global_cubit/global_cubit.dart';
import 'package:intern_task/presentation/widget/default_text_field.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({
    super.key,
    required this.formKey,
  });
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    GlobalCubit cubit = BlocProvider.of<GlobalCubit>(context);

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // field 1
          SizedBox(
            width: 60,
            height: 60,
            child: DefaultTextField(
              validator: (value) {
                if (value!.isEmpty) {
                  return '';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  cubit.otpField1 = value;
                }
              },
              autofocus: true,
              hint: '0',
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),

          // field 2
          SizedBox(
            width: 60,
            height: 60,
            child: DefaultTextField(
              validator: (value) {
                if (value!.isEmpty) {
                  return '';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  cubit.otpField2 = value;
                }
              },
              hint: '0',
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),

          // field 3
          SizedBox(
            width: 60,
            height: 60,
            child: DefaultTextField(
              validator: (value) {
                if (value!.isEmpty) {
                  return '';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                  cubit.otpField3 = value;
                }
              },
              hint: '0',
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),

          // field 4
          SizedBox(
            width: 60,
            height: 60,
            child: DefaultTextField(
              validator: (value) {
                if (value!.isEmpty) {
                  return '';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                cubit.otpField4 = value;
              },
              hint: '0',
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
