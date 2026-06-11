import 'package:alu_connect/data/mock_data.dart';
import 'package:alu_connect/models/community_data.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunitiesExploreScreen extends StatefulWidget {
  const CommunitiesExploreScreen({super.key});

  @override
  State<CommunitiesExploreScreen> createState() =>
      _CommunitiesExploreScreenState();
}

class _CommunitiesExploreScreenState
    extends State<CommunitiesExploreScreen> {
  String _search = '';
  String _selectedFilter = 'All Clubs';

  final _filters = [
    'All Clubs',
    'Academic',
    'Arts & Culture',
    'Sports & Wellness',
  ];

  List<CommunityData> get _filteredCommunities {
    final query = _search.trim().toLowerCase();
    return MockData.communities.where((c) {
      final matchesSearch = query.isEmpty ||
          c.name.toLowerCase().contains(query) ||
          c.category.toLowerCase().contains(query) ||
          c.tags.any((t) => t.toLowerCase().contains(query));
      final matchesFilter = _selectedFilter == 'All Clubs' ||
          c.category == _selectedFilter;
      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final communities = _filteredCommunities;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Communities'),
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
          TextField(
            onChanged: (v) => setState(() => _search = v),
            decoration: InputDecoration(
              hintText: 'Search clubs or communities...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: AppColors.surfaceContainer,
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppTheme.radiusMd),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 34,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _filters.map((f) {
                final active = _selectedFilter == f;
                return GestureDetector(
                  onTap: () =>
                      setState(() => _selectedFilter = f),
                  child: _FilterChip(f, active),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Text('Trending Now',
              style: AppTextStyles.headingLg),
          const SizedBox(height: 12),
          _featuredCard(context),
          const SizedBox(height: 18),
          Text('Discover Communities',
              style: AppTextStyles.headingLg),
          const SizedBox(height: 12),
          if (communities.isEmpty)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius:
                    BorderRadius.circular(AppTheme.radiusMd),
                border: Border.all(color: AppColors.divider),
              ),
              child: Center(
                child: Text(
                  'No communities found',
                  style: AppTextStyles.bodyMd.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            )
          else
            ...List.generate(communities.length, (index) {
              final c = communities[index];
              if (c == MockData.communities[0]) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _communityCard(
                  context,
                  c.name,
                  c.tags.first,
                  c.members,
                  c,
                ),
              );
            }),
        ],
      ),
    );
  }

  Widget _featuredCard(BuildContext context) {
    final featured = MockData.communities[0];
    return GestureDetector(
      onTap: () => context.push('/community-detail',
          extra: featured),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          borderRadius:
              BorderRadius.circular(AppTheme.radiusLg),
          border: Border.all(color: AppColors.secondary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius:
                    BorderRadius.circular(AppTheme.radiusFull),
              ),
              child: const Text('MOST POPULAR',
                  style: TextStyle(
                      fontSize: 11, color: Colors.white)),
            ),
            const SizedBox(height: 12),
            Text(featured.name,
                style: AppTextStyles.headingLg),
            const SizedBox(height: 4),
            Text(featured.tags.join(', '),
                style: AppTextStyles.bodyMd.copyWith(
                    color: AppColors.textSecondary)),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () => context.push(
                    '/community-detail',
                    extra: featured),
                child: const Text('Join Club'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _communityCard(BuildContext context, String title,
      String subtitle, String members, CommunityData data) {
    return GestureDetector(
      onTap: () =>
          context.push('/community-detail', extra: data),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          borderRadius:
              BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(color: AppColors.divider),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.surfaceContainerHigh,
              child: const Icon(Icons.groups,
                  color: AppColors.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: AppTextStyles.labelLg),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: AppTextStyles.caption),
                  const SizedBox(height: 2),
                  Text(members,
                      style: AppTextStyles.caption),
                ],
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => context.push(
                  '/community-detail',
                  extra: data),
              child: const Text('Join'),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool active;
  const _FilterChip(this.label, this.active);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active
              ? AppColors.primary
              : AppColors.surfaceContainer,
          borderRadius:
              BorderRadius.circular(AppTheme.radiusFull),
        ),
        child: Text(
          label,
          style: AppTextStyles.labelSm.copyWith(
            color:
                active ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
