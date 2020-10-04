import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum ColorEvent { to_amber, to_lightBlue }

/// Class ini digunakan untuk merubah state warna pada tampilan
class ColorBloc extends HydratedBloc<ColorEvent, Color> {
  /// [initialState] diisi dengan **warna** yang ingin dijadikan sebagai **warna** default
  ///
  /// Contoh:
  /// ```
  /// ColorBloc(Colors.amber)
  /// ```
  ColorBloc(Color initialState) : super(initialState);

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    yield (event == ColorEvent.to_amber) ? Colors.amber : Colors.lightBlue;
  }

  @override
  Color fromJson(Map<String, dynamic> json) {
    try {
      return Color(json["color"] as int);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, int> toJson(Color state) {
    try {
      return {"color": state.value};
    } catch (_) {
      return null;
    }
  }
}
