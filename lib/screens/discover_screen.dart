import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALU Connect'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        children: [
          _searchBar(),
          const SizedBox(height: 12),
          SizedBox(
            height: 34,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _Chip('All', true),
                _Chip('Events', false),
                _Chip('Hackathons', false),
                _Chip('Info', false),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text('Featured Highlights', style: AppTextStyles.headingLg),
          const SizedBox(height: 12),
          _highlightCard(
            context,
            title: 'Global Fintech Hackathon',
            subtitle: 'Closing in 2 days',
            onTap: () => context.push('/event/1'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('All Opportunities', style: AppTextStyles.headingLg),
              Text('Sort by: recent', style: AppTextStyles.caption),
            ],
          ),
          const SizedBox(height: 12),
          _opportunityCard(
            title: 'Data Science Fellowship',
            subtitle: 'Standard Chartered - remote',
            tag: 'Nov 5',
          ),
          const SizedBox(height: 12),
          _opportunityCard(
            title: 'Leadership Seminar Series',
            subtitle: 'ALU Leadership Lab - Main Campus',
            tag: 'Nov 12',
          ),
          const SizedBox(height: 12),
          _opportunityCard(
            title: 'UX Design Challenge',
            subtitle: 'Adobe Student Community - Virtual',
            tag: 'Dec 1',
          ),
        ],
      ),
    );
  }

  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search opportunities...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: AppColors.surfaceContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _highlightCard(BuildContext context,
      {required String title, required String subtitle, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A2033), Color(0xFF090F1E)],
          ),
          border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppTheme.radiusFull),
              ),
              child: Text('URGENT', style: AppTextStyles.labelSm.copyWith(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            Text(title, style: AppTextStyles.headingMd),
            Text(subtitle, style: AppTextStyles.caption),
          ],
        ),
      ),
    );
  }

  Widget _opportunityCard({required String title, required String subtitle, required String tag}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.workspace_premium_outlined, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.labelLg),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTextStyles.caption),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(tag, style: AppTextStyles.caption),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                ),
                child: const Text('Apply'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this.label, this.active);

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? AppColors.primary : AppColors.surfaceContainer,
          borderRadius: BorderRadius.circular(AppTheme.radiusFull),
        ),
        child: Text(label, style: AppTextStyles.labelSm.copyWith(color: active ? Colors.white : AppColors.textPrimary)),
      ),
    );
  }
}
