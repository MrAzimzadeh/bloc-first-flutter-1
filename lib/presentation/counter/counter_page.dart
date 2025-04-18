import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentation/counter/counter_bloc/counter_bloc.dart';
import 'package:myapp/presentation/counter/counter_bloc/counter_event.dart';
import 'package:myapp/presentation/counter/counter_bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});
  TextEditingController controller = TextEditingController();
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    print('Build Counter');
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _bloc.add(DCounterEvent(10));
          },
          child: Icon(Icons.deblur),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('data'),

              BlocConsumer<CounterBloc, CounterState>(
                listener: (context, state) {
                  if (state is ListerCounterState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.counter.toString())),
                    );
                  }
                },
                bloc: _bloc,
                builder: (context, state) => Text(state.counter.toString()),
              ),

              // Text(
              //   'Counter ${context.watch<CounterBloc>().state.counter}',
              //   style: TextStyle(fontSize: 20),
              // ),
              TextField(controller: controller),
              ElevatedButton(
                onPressed: () {
                  // context.read<CounterBloc>().add(
                  //   PlusCounterEvent(int.parse(controller.text)),
                  // );
                  _bloc.add(PlusCounterEvent(int.parse(controller.text)));
                },
                child: Text('+1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
