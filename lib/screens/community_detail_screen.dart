import 'package:alu_connect/models/community_data.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityDetailScreen extends StatelessWidget {
  final CommunityData community;
  const CommunityDetailScreen({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.surfaceContainerHigh,
            child: const Icon(Icons.person, size: 16, color: AppColors.textPrimary),
          ),
        ),
        title: Text('ALU Connect', style: AppTextStyles.headingMd),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: AppColors.textPrimary),
          ),
        ],
      ),
      body: ListView(
        children: [
          // Banner with overlay
          Stack(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(community.bannerUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 220,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xCC0b1326)],
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      community.name,
                      style: AppTextStyles.headingXl.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.group_outlined, size: 14, color: Colors.white70),
                        const SizedBox(width: 4),
                        Text(community.members, style: AppTextStyles.caption.copyWith(color: Colors.white70)),
                        const SizedBox(width: 12),
                        const Icon(Icons.verified_outlined, size: 14, color: Colors.white70),
                        const SizedBox(width: 4),
                        Text(community.category, style: AppTextStyles.caption.copyWith(color: Colors.white70)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // About section
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingMd),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                border: Border.all(color: AppColors.divider),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About the Community',
                    style: AppTextStyles.headingMd.copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    community.about,
                    style: AppTextStyles.bodyMd.copyWith(color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: community.tags.map((tag) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                        border: Border.all(color: AppColors.divider),
                      ),
                      child: Text(tag, style: AppTextStyles.labelSm),
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),

          // Leadership section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('LEADERSHIP', style: AppTextStyles.labelSm.copyWith(letterSpacing: 1.2)),
                const SizedBox(height: 12),
                ...community.leaders.map((leader) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _leaderCard(name: leader.name, role: leader.role),
                )),
              ],
            ),
          ),

          // Join card
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingMd),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                border: Border.all(color: AppColors.divider),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(community.joinTitle, style: AppTextStyles.headingLg),
                  const SizedBox(height: 8),
                  Text(
                    community.joinDescription,
                    style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => context.push(
                        '/membership-application',
                        extra: community,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                        ),
                      ),
                      child: const Text('Apply for Membership'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Member perks section
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppTheme.spacingMd, 0, AppTheme.spacingMd, AppTheme.spacingMd),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                border: Border.all(color: AppColors.divider),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                        ),
                        child: const Icon(Icons.workspace_premium_outlined,
                            color: AppColors.primary, size: 18),
                      ),
                      const SizedBox(width: 10),
                      Text('MEMBER PERKS',
                          style: AppTextStyles.labelSm.copyWith(letterSpacing: 1.2)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ...community.perks.asMap().entries.map((entry) => Column(
                    children: [
                      _perkItem(entry.value),
                      if (entry.key < community.perks.length - 1)
                        const Divider(color: AppColors.divider, height: 24),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (value) {
          const routes = ['/home', '/explore', '/chats', '/profile'];
          context.go(routes[value]);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Chats'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _leaderCard({required String name, required String role}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.primary.withValues(alpha: 0.15),
            child: const Icon(Icons.person, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppTextStyles.labelLg),
              const SizedBox(height: 2),
              Text(role, style: AppTextStyles.caption),
            ],
          ),
        ],
      ),
    );
  }

  Widget _perkItem(String text) {
    return Row(
      children: [
        const Icon(Icons.check_circle_outline, color: AppColors.primary, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text,
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.textPrimary)),
        ),
      ],
    );
  }
}