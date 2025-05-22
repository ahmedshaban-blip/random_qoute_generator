import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/quote_cubit.dart';
import 'cubit/quote_state.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteCubit, QuoteState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Random Quote Generator'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: Text(
                    '"${state.text}"',
                    key: ValueKey(state.text),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: 20),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) => SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0.0, 0.5),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                  child: Text(
                    '- ${state.author}',
                    key: ValueKey(state.author),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => context.read<QuoteCubit>().generateQuote(),
                  child: Text("New Quote"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
