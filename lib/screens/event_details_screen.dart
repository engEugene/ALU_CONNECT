import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALU CONNECT'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        children: [
          Container(
            height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusLg),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF101827), Color(0xFF07111F)],
              ),
              border: Border.all(color: AppColors.divider),
            ),
            child: const Center(
              child: Icon(Icons.desktop_windows_outlined, size: 120, color: AppColors.secondary),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _Badge('WORKSHOP'),
              _Badge('TECH FOR GOOD'),
            ],
          ),
          const SizedBox(height: 10),
          Text('AI for Social Impact', style: AppTextStyles.displaySm),
          const SizedBox(height: 4),
          Text('Oct 24 • 14:00  •  Innovation Hub', style: AppTextStyles.caption),
          const SizedBox(height: 18),
          Row(
            children: const [
              Expanded(child: _StatBox('60', 'CAP')),
              SizedBox(width: 10),
              Expanded(child: _StatBox('3h', 'DURATION')),
              SizedBox(width: 10),
              Expanded(child: _StatBox('Free', 'ENTRY')),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              border: Border.all(color: AppColors.secondary),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ENTRY FEE', style: AppTextStyles.caption),
                    Text('Free', style: AppTextStyles.labelLg),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('RSVP NOW'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('REGISTRATION DETAILS', style: AppTextStyles.labelLg),
          const SizedBox(height: 10),
          _detailCard('Available Slots', '45 / 60', 'Registration closes soon'),
          const SizedBox(height: 12),
          _detailCard('Friends attending', '12', 'Join with your network'),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppTheme.radiusFull),
      ),
      child: Text(label, style: AppTextStyles.labelSm.copyWith(color: Colors.white)),
    );
  }
}

class _StatBox extends StatelessWidget {
  const _StatBox(this.value, this.label);

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: Column(
        children: [
          Text(value, style: AppTextStyles.headingMd),
          const SizedBox(height: 2),
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}

Widget _detailCard(String title, String value, String note) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.surfaceContainer,
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      border: Border.all(color: AppColors.divider),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.labelLg),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.headingMd),
        const SizedBox(height: 2),
        Text(note, style: AppTextStyles.caption),
      ],
    ),
  );
}
