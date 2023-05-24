import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CircularProgressProvider with ChangeNotifier {
  bool _value = false;
  bool get getValue => _value;
  setValue(bool value) {
    LoadingAnimationWidget.twistingDots(
      leftDotColor: const Color(0xFF1A1A3F),
      rightDotColor: const Color(0xFFFFBF00),
      size: 200,
    );
    value = _value;
    notifyListeners();
  }
}
