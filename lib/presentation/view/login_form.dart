import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intern_task/business_logic/global_cubit/global_cubit.dart';
import 'package:intern_task/presentation/styles/colors.dart';
import 'package:intern_task/presentation/widget/default_button.dart';
import 'package:intern_task/presentation/widget/default_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _name;
  late TextEditingController _phone;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _name = TextEditingController();
    _phone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalCubit cubit = BlocProvider.of<GlobalCubit>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28.0),
      padding: const EdgeInsets.all(28.0),
      decoration: ShapeDecoration(
        color: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        shadows: const [
          BoxShadow(
            color: AppColor.shadowsColor,
            blurRadius: 20,
            offset: Offset(2, 5),
          )
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(children: [
          const Text(
            'Welcome',
            style: TextStyle(
              color: Color(0xFF464646),
              fontSize: 30,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            color: AppColor.primaryColor,
            width: 120,
            height: 2,
          ),
          const SizedBox(
            height: 42,
          ),
          DefaultTextField(
            controller: _name,
            validator: (value) {
              if (value!.isEmpty) {
                return 'name can not be empty';
              } else {
                return null;
              }
            },
            hint: 'Enter your Full Name',
          ),
          const SizedBox(
            height: 8.0,
          ),
          DefaultTextField(
            controller: _phone,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'phone can not be empty';
              } else {
                return null;
              }
            },
            hint: 'Enter your Phone Number',
          ),
          const SizedBox(
            height: 16.0,
          ),
          BlocConsumer<GlobalCubit, GlobalState>(
            listener: (context, state) {
              if (state is LoginFailureState) {
                Fluttertoast.showToast(
                  msg: state.errMessage,
                  backgroundColor: Colors.red,
                );
              }
              if (state is LoginSuccessState) {
                Fluttertoast.showToast(
                  msg: cubit.loginRespons.code!,
                  backgroundColor: AppColor.primaryColor,
                );
                Navigator.of(context).pushNamed(
                  '/otp',
                  arguments: _phone.text,
                );
              }
            },
            builder: (context, state) {
              if (state is LoginLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return DefaultButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    cubit.loginUser(name: _name.text, phoneNumber: _phone.text);
                  }
                },
                btnText: 'Login',
              );
            },
          ),
        ]),
      ),
    );
  }
}
