import 'package:e_commerce/core/enums/view_state.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void applyState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
