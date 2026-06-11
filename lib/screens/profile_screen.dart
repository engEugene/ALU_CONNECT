import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

// Mock data models
class _MockOpportunity {
  final String title;
  final String organizer;
  final String dateLabel;
  final Color color;
  const _MockOpportunity({required this.title, required this.organizer, required this.dateLabel, required this.color});
}

class _MockCommunity {
  final String name;
  final String nextActivity;
  final Color color;
  const _MockCommunity({required this.name, required this.nextActivity, required this.color});
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _selectedPersona = 'Student';

  static const _personas = ['Student', 'Organizer', 'Mentor', 'Alumni'];

  static const _opportunities = [
    _MockOpportunity(title: 'Google Summer of Code', organizer: 'Google', dateLabel: 'Jun 15', color: Color(0xFF4285F4)),
    _MockOpportunity(title: 'ALU Hackathon 2026', organizer: 'ALU Tech Club', dateLabel: 'Jul 3', color: Color(0xFFffb3b3)),
    _MockOpportunity(title: 'UN Youth Fellowship', organizer: 'United Nations', dateLabel: 'Aug 1', color: Color(0xFF18D26E)),
  ];

  static const _communities = [
    _MockCommunity(name: 'ALU Tech Club', nextActivity: 'Hackathon prep — Fri 6pm', color: Color(0xFFafc8f0)),
    _MockCommunity(name: 'Entrepreneurship Hub', nextActivity: 'Pitch night — Sat 4pm', color: Color(0xFFffb3b3)),
    _MockCommunity(name: 'ALU Debate Society', nextActivity: 'Open session — Mon 5pm', color: Color(0xFF18D26E)),
  ];

  static const _badges = ['Early Adopter', 'Event Host', 'Top Contributor', 'Hackathon Winner', 'Mentor'];

  @override
  Widget build(BuildContext context) {
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
          // Profile card
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
                  child: Text('A', style: AppTextStyles.headingMd.copyWith(color: Colors.white)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amara Nwosu', style: AppTextStyles.headingLg),
                      const SizedBox(height: 4),
                      Text('Student • Kigali Campus', style: AppTextStyles.caption),
                      const SizedBox(height: 10),
                      Text(
                        'Passionate about tech, entrepreneurship, and building community across Africa.',
                        style: AppTextStyles.bodyMd.copyWith(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Role mode
          Text('Role mode', style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _personas.map((persona) {
              final selected = _selectedPersona == persona;
              return ChoiceChip(
                label: Text(persona),
                selected: selected,
                onSelected: (_) => setState(() => _selectedPersona = persona),
              );
            }).toList(),
          ),
          const SizedBox(height: 18),

          // Stats
          Row(
            children: [
              Expanded(child: _statCard('12', 'Hosted')),
              const SizedBox(width: 10),
              Expanded(child: _statCard('5', 'Joined')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _statCard('34', 'Tracked')),
              const SizedBox(width: 10),
              Expanded(child: _statCard('8', 'Saved')),
            ],
          ),
          const SizedBox(height: 18),

          // Badges
          Text('Badges', style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _badges.map((badge) => Chip(
              label: Text(badge),
              backgroundColor: AppColors.surfaceContainer,
              side: const BorderSide(color: AppColors.divider),
            )).toList(),
          ),
          const SizedBox(height: 18),

          // Saved opportunities
          Text('Saved opportunities', style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          ..._opportunities.map(
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

          // Joined communities
          Text('Joined communities', style: AppTextStyles.headingLg),
          const SizedBox(height: 10),
          ..._communities.map(
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