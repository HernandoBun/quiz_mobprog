import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedTheme = 0; // Default selected theme index
  int _selectedFont = 0;  // Default selected font index

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true, // Menyesuaikan tata letak saat keyboard muncul
      appBar: AppBar(
        title: Text("Settings", style: themeProvider.themeData.appBarTheme.titleTextStyle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Preview Section
              Text(
                "Preview",
                style: themeProvider.fontStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: themeProvider.themeData.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: themeProvider.themeData.primaryColor, width: 2),
                ),
                child: Column(
                  children: [
                    Text(
                      "Hello, Hernando Bun!",
                      style: themeProvider.fonts[_selectedFont].copyWith(
                        fontSize: 24,
                        color: themeProvider.themeData.textTheme.bodyLarge?.color,
                      ),
                    ),
                    Text(
                      "This is a preview of your selected theme and font.",
                      style: themeProvider.fonts[_selectedFont].copyWith(
                        fontSize: 16,
                        color: themeProvider.themeData.textTheme.bodyMedium?.color,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Theme Selection Section
              Text(
                "Choose Theme",
                style: themeProvider.fontStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                children: List.generate(themeProvider.themeNames.length, (index) {
                  return ListTile(
                    title: Text(
                      themeProvider.themeNames[index],
                      style: themeProvider.fontStyle.copyWith(fontSize: 16),
                    ),
                    leading: Radio<int>(
                      value: index,
                      groupValue: _selectedTheme,
                      activeColor: themeProvider.themeData.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          _selectedTheme = value!;
                          themeProvider.changeTheme(value);
                        });
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),

              // Font Selection Section
              Text(
                "Choose Font",
                style: themeProvider.fontStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                children: List.generate(themeProvider.fontNames.length, (index) {
                  return ListTile(
                    title: Text(
                      themeProvider.fontNames[index],
                      style: themeProvider.fonts[index].copyWith(fontSize: 16),
                    ),
                    leading: Radio<int>(
                      value: index,
                      groupValue: _selectedFont,
                      activeColor: themeProvider.themeData.primaryColor,
                      onChanged: (value) {
                        setState(() {
                          _selectedFont = value!;
                          themeProvider.changeFont(value);
                        });
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
