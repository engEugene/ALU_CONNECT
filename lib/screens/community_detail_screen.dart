import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityDetailScreen extends StatelessWidget {
  const CommunityDetailScreen({super.key});

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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Dark gradient overlay
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
        // Community name + meta pinned to bottom of banner
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tech Hub Elite',
                style: AppTextStyles.headingXl.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.group_outlined, size: 14, color: Colors.white70),
                  const SizedBox(width: 4),
                  Text('1,248 Members', style: AppTextStyles.caption.copyWith(color: Colors.white70)),
                  const SizedBox(width: 12),
                  const Icon(Icons.verified_outlined, size: 14, color: Colors.white70),
                  const SizedBox(width: 4),
                  Text('Academic Society', style: AppTextStyles.caption.copyWith(color: Colors.white70)),
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
          'Tech Hub Elite is the premier destination for students pursuing excellence in software engineering, data science, and emerging technologies. We bridge the gap between academic theory and industry reality through peer-led workshops, high-stakes hackathons, and exclusive networking events with global tech leaders.',
          style: AppTextStyles.bodyMd.copyWith(color: AppColors.textPrimary),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            'Artificial Intelligence',
            'Web3',
            'System Architecture',
            'Open Source',
          ].map((tag) => Container(
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
const SizedBox(height: 500), // placeholder for next sections
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
}