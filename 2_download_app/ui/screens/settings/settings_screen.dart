import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void handleThemeChange(BuildContext context, ThemeColor theme) {
    Provider.of<ThemeColorProvider>(context, listen: false)
      .setTheme(theme);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeColorProvider>(context);
    final currentThemeColor = themeProvider.current;

    return Container(
      color: currentThemeColor.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(
            "Settings",
            style: AppTextStyles.heading.copyWith(
              color: currentThemeColor.color,
            ),
          ),
          const SizedBox(height: 50),
          Text(
            "Theme",
            style: AppTextStyles.label.copyWith(color: AppColors.textLight),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ThemeColor.values
                .map(
                  (theme) => ThemeColorButton(
                    themeColor: theme,
                    isSelected: theme == currentThemeColor,
                    onTap: (value) {
                      handleThemeChange(context, value);
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
