import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/presentation/page/number_trivia_page.dart';
import 'package:number_trivia_tdd_architecture/injection_container.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Number Trivia',
      home: BlocProvider(
        create: (context) => serviceLocator<NumberTriviaBloc>(),
        child: NumberTriviaPage(),
      ),
    );
  }
}
