import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/theme_provider.dart';

class settingPage extends StatelessWidget {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Setting')),
        body: Consumer<ThemeProvider>(builder: (ctx, provider, __) {
          return SwitchListTile.adaptive(
            title: Text('Dark Mode'),
            subtitle: Text('Enable Dark Mode'),
            onChanged: (value) {
              provider.updateTheme(value: value);

            },
            value: provider.getThemeValue(),
          );
        })
    );
  }
}
