import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task/business_logic/global_cubit/global_cubit.dart';
import 'package:intern_task/presentation/view/home_products_gridview.dart';
import 'package:intern_task/presentation/widget/home_top_product.dart';
import 'package:intern_task/presentation/widget/search_bar.dart';
import 'package:intern_task/presentation/widget/select_category_listview.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<GlobalCubit>(context).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 60),

        // search
        const CustomSearchBar(),

        const SizedBox(height: 22.0),

        // image
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HomeTopProduct(),

                const SizedBox(height: 12),

                // select category listView
                const SelectCategory(),

                const SizedBox(height: 22.0),

                // home products gridview
                BlocBuilder<GlobalCubit, GlobalState>(
                  builder: (context, state) {
                    if (state is GetProductsLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetProductsFailureState) {
                      return Center(
                        child: Text(
                          state.errMessage,
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else if (state is GetProductsSuccessState) {
                      return HomeProductsGridView(
                        products: state.products,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
