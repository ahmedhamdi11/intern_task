import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task/business_logic/bloc_observer.dart';
import 'package:intern_task/business_logic/global_cubit/global_cubit.dart';
import 'package:intern_task/data/data_providers/local/cache_helper.dart';
import 'package:intern_task/data/data_providers/remote/dio_helper.dart';
import 'package:intern_task/presentation/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => GlobalCubit()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ahmed Hamdi\'s task',
        theme: ThemeData(
          fontFamily: 'cairo',
          useMaterial3: true,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
        initialRoute: '/',
      ),
    );
  }
}
