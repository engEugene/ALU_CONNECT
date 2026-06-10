import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunitiesExploreScreen extends StatelessWidget {
  const CommunitiesExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Communities'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search clubs or communities...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: AppColors.surfaceContainer,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 34,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _FilterChip('All Clubs', true),
                _FilterChip('Academic', false),
                _FilterChip('Arts & Culture', false),
                _FilterChip('Innovation', false),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('Trending Now', style: AppTextStyles.headingLg),
          const SizedBox(height: 12),
          _featuredCard(context),
          const SizedBox(height: 18),
          Text('Discover Communities', style: AppTextStyles.headingLg),
          const SizedBox(height: 12),
          _communityCard(context, 'Debate Society', 'Sharpener your rhetoric and critical thinking', '156 Members'),
          const SizedBox(height: 12),
          _communityCard(context, 'Arts Guild', 'A space for artists to collaborate', '83 Members'),
          const SizedBox(height: 12),
          _communityCard(context, 'Sports Council', 'The governing body for varsity sports', '320 Members'),
          const SizedBox(height: 12),
          _communityCard(context, 'Music Ensemble', 'From classical to jazz fusion', '45 Members'),
          const SizedBox(height: 12),
          _communityCard(context, 'Finance Club', 'Learn investing, analysis, and planning', '103 Members'),
        ],
      ),
    );
  }

  Widget _featuredCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(color: AppColors.secondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppTheme.radiusFull),
            ),
            child: const Text('MOST POPULAR', style: TextStyle(fontSize: 11, color: Colors.white)),
          ),
          const SizedBox(height: 12),
          Text('Tech Hub Elite', style: AppTextStyles.headingLg),
          const SizedBox(height: 4),
          Text('Mastery through elite coding and collaboration', style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () => context.push('/community-detail'),
              child: const Text('Join Club'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _communityCard(BuildContext context, String title, String subtitle, String members) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.surfaceContainerHigh,
            child: Icon(Icons.groups, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.labelLg),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTextStyles.caption),
                const SizedBox(height: 2),
                Text(members, style: AppTextStyles.caption),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () => context.push('/community-detail'),
            child: const Text('Join'),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip(this.label, this.active);

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