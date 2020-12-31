import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/presentation/widgets/loaded_data_widget.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/presentation/widgets/loader.dart';
import 'package:number_trivia_tdd_architecture/features/number_trivia/presentation/widgets/message_display_widget.dart';

class NumberTriviaPage extends StatefulWidget {
  @override
  _NumberTriviaPageState createState() => _NumberTriviaPageState();
}

class _NumberTriviaPageState extends State<NumberTriviaPage> {
  TextEditingController _number = TextEditingController();
  NumberTriviaBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<NumberTriviaBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 20.0,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Number Trivia',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                  builder: (context, state) {
                    if (state is NumberTriviaInitial)
                      return MessageDisplay(
                        message: 'Start The Game!!',
                      );
                    if (state is NumberTriviaLoadingState) return Loader();
                    if (state is NumberTriviaErrorState)
                      return MessageDisplay(
                        message: state.errorMessage,
                      );
                    if (state is NumberTriviaLoadedState)
                      return LoadedData(
                        number: state.trivia.number.toString(),
                        text: state.trivia.text,
                      );
                    return null;
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  controller: _number,
                  decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    hintText: 'Enter Number',
                    hintStyle: TextStyle(color: Colors.black26),
                    prefixIcon: Icon(Icons.format_list_numbered),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'Goo!',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () =>
                          bloc.add(GetTriviaForConcrete(number: _number.text)),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'Random Number!',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onPressed: () => bloc.add(GetTriviaForRandom()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
