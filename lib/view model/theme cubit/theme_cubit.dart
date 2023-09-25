// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool isDarkTheme = false;
  changeTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkTheme = !isDarkTheme;
    emit(ThemeStateChanged());
    prefs.setBool('theme', isDarkTheme);
    getTheme();
  }

  getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('theme') != null) {
      isDarkTheme = prefs.getBool('theme')!;
      if (prefs.getBool('theme') == false) {
        emit(LightTheme());
      } else {
        emit(DarkTheme());
      }
    }
  }
}
