import 'package:alu_connect/data/mock_data.dart';
import 'package:alu_connect/models/community_data.dart';
import 'package:alu_connect/state/alu_app_state.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showCreateCommunityDialog() {
    final nameCtrl = TextEditingController();
    final aboutCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surfaceContainer,
        title: const Text('Create a Community'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                    labelText: 'Community Name'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descCtrl,
                decoration: const InputDecoration(
                    labelText: 'Short Description'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: aboutCtrl,
                maxLines: 3,
                decoration: const InputDecoration(
                    labelText: 'About'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.trim().isEmpty) return;
              final appState =
                  AppStateScope.of(context);
              final newCommunity = CommunityData(
                name: nameCtrl.text.trim(),
                members: '1 Member',
                category: 'Custom',
                bannerUrl:
                    'https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=800',
                about: aboutCtrl.text.trim().isEmpty
                    ? descCtrl.text.trim()
                    : aboutCtrl.text.trim(),
                tags: ['New'],
                leaders: [
                  CommunityLeader(
                      name: appState.profile.name,
                      role: 'Founder'),
                ],
                joinTitle: 'Join Us',
                joinDescription: descCtrl.text.trim().isEmpty
                    ? 'A new community at ALU'
                    : descCtrl.text.trim(),
                perks: ['Be part of something new'],
                specializationLabel: 'YOUR ROLE',
                specializations: ['Member', 'Other'],
              );
              appState.addOwnedCommunity(newCommunity);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      '${newCommunity.name} created!'),
                ),
              );
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

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
                colors: [
                  Color(0xFF1A2033),
                  Color(0xFF0D1424)
                ],
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
                  backgroundColor: AppColors.primary
                      .withValues(alpha: 0.15),
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
          Text('My Communities',
              style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: _showCreateCommunityDialog,
              icon: const Icon(Icons.add),
              label: const Text('Create a Community'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(
                    color: AppColors.primary),
                padding:
                    const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AppTheme.radiusMd),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (appState.ownedCommunities.isEmpty)
            _emptyState(
                'You haven\'t created any communities yet')
          else
            ...appState.ownedCommunities.map(
              (c) => Padding(
                padding:
                    const EdgeInsets.only(bottom: 10),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(
                        AppTheme.radiusMd),
                    border:
                        Border.all(color: AppColors.divider),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            AppColors.primary.withValues(
                                alpha: 0.15),
                        child: const Icon(Icons.groups,
                            color: AppColors.primary),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(c.name,
                                style:
                                    AppTextStyles.labelLg),
                            Text(c.members,
                                style:
                                    AppTextStyles.caption),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
