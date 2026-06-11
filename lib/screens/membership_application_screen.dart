import 'package:alu_connect/models/community_data.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MembershipApplicationScreen extends StatefulWidget {
  final CommunityData community;
  const MembershipApplicationScreen({super.key, required this.community});

  @override
  State<MembershipApplicationScreen> createState() =>
      _MembershipApplicationScreenState();
}

class _MembershipApplicationScreenState
    extends State<MembershipApplicationScreen> {
  String? _selectedSpecialization;
  final _ambitionController = TextEditingController();
  final _portfolioController = TextEditingController();

  @override
  void dispose() {
    _ambitionController.dispose();
    _portfolioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.spacingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // Title
              Text(
                'Apply for Membership',
                style: AppTextStyles.headingXl,
              ),
              const SizedBox(height: 6),
              Text(
                'Tell us why you\'d be a great fit for the ${widget.community.name} community.',
                style: AppTextStyles.bodyMd.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 28),

              // Step 1 — Specialization
              _stepCard(
                stepLabel: 'STEP 1: ${widget.community.specializationLabel}',
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: widget.community.specializations.map((spec) {
                    final selected = _selectedSpecialization == spec;
                    return GestureDetector(
                      onTap: () =>
                          setState(() => _selectedSpecialization = spec),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          color: selected
                              ? Colors.transparent
                              : Colors.transparent,
                          borderRadius:
                              BorderRadius.circular(AppTheme.radiusFull),
                          border: Border.all(
                            color: selected
                                ? AppColors.primary
                                : AppColors.outline,
                            width: selected ? 1.5 : 1,
                          ),
                        ),
                        child: Text(
                          spec,
                          style: AppTextStyles.labelMd.copyWith(
                            color: selected
                                ? AppColors.primary
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),

              // Step 2 — Ambition
              _stepCard(
                stepLabel: 'STEP 2: YOUR AMBITION',
                child: TextField(
                  controller: _ambitionController,
                  maxLines: 3,
                  style: AppTextStyles.bodyMd,
                  decoration: InputDecoration(
                    hintText:
                        'What major technical challenge are you currently obsessed with?',
                    hintStyle: AppTextStyles.bodyMd.copyWith(
                      color: AppColors.textTertiary,
                    ),
                    filled: true,
                    fillColor: AppColors.surfaceContainerHigh,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Step 3 — Proof of craft
              _stepCard(
                stepLabel: 'STEP 3: PROOF OF CRAFT',
                child: TextField(
                  controller: _portfolioController,
                  style: AppTextStyles.bodyMd,
                  decoration: InputDecoration(
                    hintText: 'GitHub / Portfolio URL',
                    hintStyle: AppTextStyles.bodyMd.copyWith(
                      color: AppColors.textTertiary,
                    ),
                    prefixIcon: const Icon(
                      Icons.link,
                      color: AppColors.textTertiary,
                      size: 18,
                    ),
                    filled: true,
                    fillColor: AppColors.surfaceContainerHigh,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                    ),
                  ),
                  child: const Text('Submit Application'),
                ),
              ),
              const SizedBox(height: 16),

              // Cancel
              Center(
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Text(
                    'Cancel',
                    style: AppTextStyles.labelLg.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stepCard({required String stepLabel, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stepLabel,
            style: AppTextStyles.labelSm.copyWith(
              letterSpacing: 1.2,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  void _submit() {
    if (_selectedSpecialization == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your specialization')),
      );
      return;
    }
    if (_ambitionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please describe your ambition')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Application submitted!')),
    );
    context.pop();
  }
}