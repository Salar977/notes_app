import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        margin: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // dark mode
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Provider.of<ThemeProvider>(context).fontSize,
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
            
                // switch toogle
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                  onChanged: (value) => Provider.of<ThemeProvider>(
                    context,
                    listen: false
                  ).toggleTheme()
                ),
              ],
            ),

            const SizedBox(height: 20,),

            // Font Size
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Font Size',
                    style: TextStyle(
                      fontSize: Provider.of<ThemeProvider>(context).fontSize,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  Slider(
                    value: Provider.of<ThemeProvider>(context).fontSize,
                    min: 10,
                    max: 30,
                    divisions: 10,
                    label: Provider.of<ThemeProvider>(context).fontSize.round().toString(),
                    onChanged: (value) =>
                        Provider.of<ThemeProvider>(context, listen: false).fontSize = value,
                    activeColor: Theme.of(context).colorScheme.inversePrimary,
                    //inactiveColor: inverseColor.withOpacity(0.4),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}