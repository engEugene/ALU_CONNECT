import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String _search = '';
  String _selectedFilter = 'All';

  final List<_CommunityCardData> _communities = const [
    _CommunityCardData(
      'ALU Cyber Nexus',
      'Security, privacy, and digital innovation',
      '18 TECH',
      '1.9k members',
      'Join',
    ),
    _CommunityCardData(
      'ALU Builders',
      'Projects, product teams, and makers',
      'BUILD',
      '1.2k members',
      'Join',
    ),
    _CommunityCardData(
      'Campus Creators',
      'Storytelling, design, and media',
      'MEDIA',
      '860 members',
      'Join',
    ),
  ];

  final List<_EventCardData> _events = const [
    _EventCardData(
      '24',
      'WORKSHOP',
      '18:00 - 8:30',
      'Venture Pitch Masterclass',
      'Keen your delivery with industry mentors and campus entrepreneurs.',
    ),
    _EventCardData(
      '26',
      'SOCIAL',
      '18:30 - 20:00',
      'Neo Nights Mixer',
      'Celebrate mid-term completion with your classmates and friends.',
    ),
    _EventCardData(
      '28',
      'ACADEMIC',
      '13:00 - 15:00',
      'Pan-African Tech Summit',
      'A keynote series featuring alumni currently shaping the African tech landscape.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredEvents = _events
        .where((event) {
          final query = _search.trim().toLowerCase();
          final matchesFilter =
              _selectedFilter == 'All' || event.category == _selectedFilter;
          final matchesSearch =
              query.isEmpty ||
              event.title.toLowerCase().contains(query) ||
              event.summary.toLowerCase().contains(query) ||
              event.category.toLowerCase().contains(query);
          return matchesFilter && matchesSearch;
        })
        .toList(growable: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ALU Connect'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0C1324), Color(0xFF08101D)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          children: [
            _sectionHeader(),
            const SizedBox(height: 14),
            TextField(
              onChanged: (value) => setState(() => _search = value),
              decoration: InputDecoration(
                hintText: 'Search communities, events, or peers..',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.surfaceContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: const ['All', 'Events', 'Hackathons', 'Info'].length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final label = const [
                    'All',
                    'Events',
                    'Hackathons',
                    'Info',
                  ][index];
                  final active = _selectedFilter == label;
                  return _FilterChip(
                    label: label,
                    active: active,
                    onTap: () => setState(() => _selectedFilter = label),
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
            _sectionTitle('Trending Communities', 'View all'),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = _communities[index];
                  return _TrendingCommunityCard(data: item);
                },
                separatorBuilder: (_, _) => const SizedBox(width: 12),
                itemCount: _communities.length,
              ),
            ),
            const SizedBox(height: 20),
            _sectionTitle('Your Upcoming Events', 'NEXT 7 DAYS'),
            const SizedBox(height: 12),
            ...filteredEvents.map(
              (event) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _UpcomingEventCard(data: event),
              ),
            ),
            const SizedBox(height: 8),
            Text('Spotlight', style: AppTextStyles.headingLg),
            const SizedBox(height: 12),
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF141B2E), Color(0xFF0A1020)],
                ),
                border: Border.all(color: AppColors.divider),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF1F2A44), Color(0xFF0A1020)],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    top: 16,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(
                          AppTheme.radiusFull,
                        ),
                      ),
                      child: Text(
                        'SPOTLIGHT',
                        style: AppTextStyles.labelSm.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 18,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scholarship Drive',
                          style: AppTextStyles.headingLg,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'New opportunities for CS majors open tomorrow.',
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
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.divider),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.surfaceContainerHigh,
                    child: Icon(
                      Icons.campaign_outlined,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Campus Wi-Fi upgrade scheduled',
                          style: AppTextStyles.labelLg,
                        ),
                        const SizedBox(height: 4),
                        Text('Midnight tonight', style: AppTextStyles.caption),
                      ],
                    ),
                  ),
                  Text('8h ago', style: AppTextStyles.caption),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.workspace_premium_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Free AWS Credits for Student Orgs',
                          style: AppTextStyles.labelLg.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'New perk',
                          style: AppTextStyles.caption.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.add, color: AppColors.primary, size: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (value) {
          final routes = ['/home', '/explore', '/add', '/profile'];
          context.go(routes[value]);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.add),
            selectedIcon: Icon(Icons.add),
            label: 'Add',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.surfaceContainerHigh,
          child: Icon(Icons.person, color: AppColors.textPrimary, size: 18),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover your next experience',
                style: AppTextStyles.headingLg,
              ),
              const SizedBox(height: 2),
              Text(
                'Connect with communities, events, and campus updates.',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.headingLg),
        Text(action, style: AppTextStyles.caption),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onTap,
      backgroundColor: active ? AppColors.primary : AppColors.surfaceContainer,
      label: Text(
        label,
        style: AppTextStyles.labelSm.copyWith(
          color: active ? Colors.white : AppColors.textPrimary,
        ),
      ),
    );
  }
}

class _TrendingCommunityCard extends StatelessWidget {
  const _TrendingCommunityCard({required this.data});

  final _CommunityCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF141C31), Color(0xFF0A1020)],
        ),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 118,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [Color(0xFF20314F), Color(0xFF0D1424)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Center(
              child: Icon(Icons.phonelink, color: AppColors.primary, size: 42),
            ),
          ),
          const SizedBox(height: 12),
          Text(data.title, style: AppTextStyles.labelLg),
          const SizedBox(height: 3),
          Text(data.subtitle, style: AppTextStyles.caption),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data.members, style: AppTextStyles.caption),
              TextButton(onPressed: () {}, child: Text(data.cta)),
            ],
          ),
        ],
      ),
    );
  }
}

class _UpcomingEventCard extends StatelessWidget {
  const _UpcomingEventCard({required this.data});

  final _EventCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.day,
                  style: AppTextStyles.labelLg.copyWith(color: Colors.white),
                ),
                Text('JAN', style: AppTextStyles.caption),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      data.category,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(data.time, style: AppTextStyles.caption),
                  ],
                ),
                const SizedBox(height: 4),
                Text(data.title, style: AppTextStyles.labelLg),
                const SizedBox(height: 3),
                Text(data.summary, style: AppTextStyles.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CommunityCardData {
  const _CommunityCardData(
    this.title,
    this.subtitle,
    this.badge,
    this.members,
    this.cta,
  );

  final String title;
  final String subtitle;
  final String badge;
  final String members;
  final String cta;
}

class _EventCardData {
  const _EventCardData(
    this.day,
    this.category,
    this.time,
    this.title,
    this.summary,
  );

  final String day;
  final String category;
  final String time;
  final String title;
  final String summary;
}
