import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_receipe/core/theme/theme.dart';
import 'package:food_receipe/features/random_food_receipe/presentation/cubit/receipe_cubit.dart';
import 'package:food_receipe/features/random_food_receipe/presentation/pages/home.dart';
import 'package:food_receipe/init_dependency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependency();
  runApp(BlocProvider(
    create: (context) => serviceLocator<ReceipeCubit>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    BlocProvider.of<ReceipeCubit>(context).getReceipe();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Food Receipe',
      theme: appTheme,
      home: const MyHomePage(),
    );
  }
}
