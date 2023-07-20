import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task/business_logic/global_cubit/global_cubit.dart';
import 'package:intern_task/presentation/styles/colors.dart';
import 'package:intern_task/presentation/widget/default_button.dart';
import 'package:intern_task/presentation/widget/help_listview_item.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    // get help data on initial state
    BlocProvider.of<GlobalCubit>(context).getHelpData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton:
          // go to home screen button
          Padding(
        padding: const EdgeInsets.only(
          left: 72.0,
          right: 72.0,
          bottom: 18.0,
        ),
        child: DefaultButton(
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
          },
          btnText: 'Continue',
        ),
      ),

      //body
      body: Container(
        decoration: const BoxDecoration(gradient: AppColor.backgroundGradient),
        child: Column(
          children: <Widget>[
            const SizedBox(
                height: 65), // empty space to make the body in the safe area

            // screen title
            const Text(
              'Help',
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 30,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 52),

            // help info tiles
            BlocBuilder<GlobalCubit, GlobalState>(
              builder: (context, state) {
                if (state is GetHelpLoadingState) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is GetHelpFailureState) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        state.errMessage,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else if (state is GetHelpSuccessState) {
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 72),
                      itemCount: state.helpData.length,
                      itemBuilder: (context, index) {
                        return HelpListViewItem(
                          helpModel: state.helpData[index],
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
