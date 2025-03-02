import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: LoadingAnimationWidget.inkDrop(
              color: Theme.of(context).primaryColor,
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
