import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { to_amber, to_lightBlue }

/// Class ini digunakan untuk merubah state warna pada tampilan
class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.amber;

  /// [initialState] diisi dengan **warna** yang ingin dijadikan sebagai **warna** default
  ///
  /// Contoh:
  /// ```
  /// ColorBloc(Colors.amber)
  /// ```
  ColorBloc(Color initialState) : super(initialState);

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.to_amber) ? Colors.amber : Colors.lightBlue;
    yield _color;
  }
}
