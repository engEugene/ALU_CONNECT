import 'package:alu_connect/data/mock_data.dart';
import 'package:alu_connect/state/alu_app_state.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final profile = appState.profile;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppTheme.radiusLg),
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
                  backgroundColor:
                      AppColors.primary.withValues(alpha: 0.15),
                  child: Text(
                    MockData.userProfile['initials'] ?? 'A',
                    style: AppTextStyles.headingMd
                        .copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(profile.name,
                          style: AppTextStyles.headingLg),
                      const SizedBox(height: 4),
                      Text(
                        '${profile.role} \u2022 ${profile.campus}',
                        style: AppTextStyles.caption,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        profile.bio,
                        style: AppTextStyles.bodyMd.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text('Role mode',
              style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: Persona.values.map((persona) {
              final selected =
                  appState.persona == persona.label;
              return ChoiceChip(
                label: Text(persona.label),
                selected: selected,
                onSelected: (_) {
                  appState.setPersona(persona);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                  child: _statCard(
                      profile.stats['Hosted'] ?? '0',
                      'Hosted')),
              const SizedBox(width: 10),
              Expanded(
                  child: _statCard(
                      profile.stats['Joined'] ?? '0',
                      'Joined')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  child: _statCard(
                      profile.stats['Tracked'] ?? '0',
                      'Tracked')),
              const SizedBox(width: 10),
              Expanded(
                  child: _statCard(
                      profile.stats['Saved'] ?? '0',
                      'Saved')),
            ],
          ),
          const SizedBox(height: 18),
          Text('Badges',
              style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: profile.badges
                .map(
                  (badge) => Chip(
                    label: Text(badge),
                    backgroundColor:
                        AppColors.surfaceContainer,
                    side: const BorderSide(
                        color: AppColors.divider),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 18),
          Text('Saved opportunities',
              style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          ...appState.savedOpportunities.map(
            (opportunity) => Padding(
              padding:
                  const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(
                      AppTheme.radiusMd),
                  border: Border.all(
                      color: AppColors.divider),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: opportunity.color
                            .withValues(alpha: 0.16),
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                      child: const Icon(
                          Icons.bookmark_added_outlined,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(opportunity.title,
                              style:
                                  AppTextStyles.labelLg),
                          const SizedBox(height: 2),
                          Text(opportunity.organizer,
                              style:
                                  AppTextStyles.caption),
                        ],
                      ),
                    ),
                    Text(opportunity.dateLabel,
                        style: AppTextStyles.caption),
                  ],
                ),
              ),
            ),
          ),
          if (appState.savedOpportunities.isEmpty)
            _emptyState('No saved opportunities yet'),
          const SizedBox(height: 18),
          Text('Joined communities',
              style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          ...appState.joinedCommunities.map(
            (community) => Padding(
              padding:
                  const EdgeInsets.only(bottom: 12),
              child: ListTile(
                tileColor: AppColors.surfaceContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AppTheme.radiusMd),
                ),
                leading: CircleAvatar(
                  backgroundColor: community.color
                      .withValues(alpha: 0.16),
                  child: const Icon(Icons.groups,
                      color: Colors.white),
                ),
                title: Text(community.name,
                    style: AppTextStyles.labelLg),
                subtitle: Text(community.nextActivity,
                    style: AppTextStyles.caption),
              ),
            ),
          ),
          if (appState.joinedCommunities.isEmpty)
            _emptyState('No joined communities yet'),
        ],
      ),
    );
  }

  Widget _statCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius:
            BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          Text(value,
              style: AppTextStyles.headingMd),
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
        borderRadius:
            BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Text(
        message,
        style: AppTextStyles.bodyMd.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
