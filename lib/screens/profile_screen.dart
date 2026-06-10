import 'package:alu_connect/state/alu_app_state.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final profile = state.profile;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusLg),
              gradient: const LinearGradient(
                colors: [Color(0xFF1A2033), Color(0xFF0D1424)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: AppColors.divider),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                  child: Text(profile.name[0], style: AppTextStyles.headingMd.copyWith(color: Colors.white)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(profile.name, style: AppTextStyles.headingLg),
                      const SizedBox(height: 4),
                      Text('${profile.role} • ${profile.campus}', style: AppTextStyles.caption),
                      const SizedBox(height: 10),
                      Text(profile.bio, style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text('Role mode', style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: Persona.values.map((persona) {
              final selected = state.persona == persona.label;
              return ChoiceChip(
                label: Text(persona.label),
                selected: selected,
                onSelected: (_) => state.setPersona(persona),
              );
            }).toList(growable: false),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(child: _statCard(profile.stats['Events']!, 'Hosted')),
              const SizedBox(width: 10),
              Expanded(child: _statCard(profile.stats['Communities']!, 'Joined')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _statCard(profile.stats['RSVPs']!, 'Tracked')),
              const SizedBox(width: 10),
              Expanded(child: _statCard(profile.stats['Saved']!, 'Saved')),
            ],
          ),
          const SizedBox(height: 18),
          Text('Badges', style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.badges
                .map(
                  (badge) => Chip(
                    label: Text(badge),
                    backgroundColor: AppColors.surfaceContainer,
                    side: const BorderSide(color: AppColors.divider),
                  ),
                )
                .toList(growable: false),
          ),
          const SizedBox(height: 18),
          Text('Saved opportunities', style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          if (state.savedOpportunities.isEmpty)
            _emptyState('No saved opportunities yet.')
          else
            ...state.savedOpportunities.map(
              (opportunity) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
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
                          color: opportunity.color.withValues(alpha: 0.16),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.bookmark_added_outlined, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(opportunity.title, style: AppTextStyles.labelLg),
                            const SizedBox(height: 2),
                            Text(opportunity.organizer, style: AppTextStyles.caption),
                          ],
                        ),
                      ),
                      Text(opportunity.dateLabel, style: AppTextStyles.caption),
                    ],
                  ),
                ),
              ),
            ),
          const SizedBox(height: 18),
          Text('Joined communities', style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          if (state.joinedCommunities.isEmpty)
            _emptyState('You have not joined any communities yet.')
          else
            ...state.joinedCommunities.map(
              (community) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  tileColor: AppColors.surfaceContainer,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTheme.radiusMd)),
                  leading: CircleAvatar(
                    backgroundColor: community.color.withValues(alpha: 0.16),
                    child: const Icon(Icons.groups, color: Colors.white),
                  ),
                  title: Text(community.name, style: AppTextStyles.labelLg),
                  subtitle: Text(community.nextActivity, style: AppTextStyles.caption),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _statCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppColors.divider),
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

  Widget _emptyState(String message) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Text(message, style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary)),
    );
  }
}