import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALU Connect'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Large heading - 36px
              Text(
                'Welcome to ALU Connect',
                style: AppTextStyles.displaySm.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: AppTheme.spacingMd),

              // Medium heading - 24px
              Text(
                'Get Started',
                style: AppTextStyles.headingMd.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppTheme.spacingSm),

              // Body text - 16px
              Text(
                'This is a simple example screen showing how to use the theme system. You can see typography, colors, spacing, and components in action.',
                style: AppTextStyles.bodyMd.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppTheme.spacingLg),

              // Primary Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Primary button pressed!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppTheme.spacingMd,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                    ),
                  ),
                  child: Text(
                    'Primary Button',
                    style: AppTextStyles.labelLg.copyWith(
                      color: AppColors.onPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.spacingMd),

              // Secondary Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Secondary button pressed!')),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.secondary,
                    side: const BorderSide(color: AppColors.secondary),
                    padding: const EdgeInsets.symmetric(
                      vertical: AppTheme.spacingMd,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                    ),
                  ),
                  child: Text(
                    'Secondary Button',
                    style: AppTextStyles.labelLg.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.spacingLg),

              // Card Example
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingMd),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  border: Border.all(
                    color: AppColors.outline,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Example',
                      style: AppTextStyles.headingMd.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingSm),
                    Text(
                      'This card uses the theme system for colors, spacing, and border radius.',
                      style: AppTextStyles.bodyMd.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.spacingLg),

              // Text Styles Showcase
              Text(
                'Typography Examples',
                style: AppTextStyles.headingMd.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppTheme.spacingMd),

              Text(
                'Label Small - 12px',
                style: AppTextStyles.labelSm.copyWith(
                  color: AppColors.secondary,
                ),
              ),
              const SizedBox(height: AppTheme.spacingSm),

              Text(
                'Body Medium - 16px',
                style: AppTextStyles.bodyMd.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppTheme.spacingSm),

              Text(
                'Body Large - 18px',
                style: AppTextStyles.bodyLg.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
