import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_bloc/settings.dart';
import 'package:shopping_bloc/themes/dark-yellow.theme.dart';
import 'package:shopping_bloc/themes/dark.theme.dart';
import 'package:shopping_bloc/themes/light.theme.dart';

class ThemeBloc extends ChangeNotifier {
  var theme = lightTheme();

  ThemeBloc() {
    load();
  }

  change(String color) {
    switch (color) {
      case "light":
        {
          theme = lightTheme();
          Settings.theme = "light";
          notifyListeners();
          break;
        }

      case "dark":
        {
          theme = darkTheme();
          Settings.theme = "dark";
          notifyListeners();
          break;
        }

      case "dark-yellow":
        {
          theme = darkYellowTheme();
          Settings.theme = "dark-yellow";
          notifyListeners();
          break;
        }

      default:
        {
          theme = lightTheme();
          Settings.theme = "light";
          notifyListeners();
          break;
        }
    }
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var theme = prefs.getString("theme");
    Settings.theme = (theme == null) || (theme.isEmpty) ? "light" : theme;
    change(Settings.theme);
  }
}
