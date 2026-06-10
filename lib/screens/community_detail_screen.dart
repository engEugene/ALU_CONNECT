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
      body: const Center(child: Text('Community Detail — WIP')),
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