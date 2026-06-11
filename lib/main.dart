import 'package:alu_connect/models/community_data.dart';
import 'package:alu_connect/screens/community_detail_screen.dart';
import 'package:alu_connect/screens/membership_application_screen.dart';
import 'package:alu_connect/screens/event_details_screen.dart';
import 'package:alu_connect/screens/discover_screen.dart';
import 'package:alu_connect/screens/communities_explore_screen.dart';
import 'package:alu_connect/screens/onboarding_screen.dart';
import 'package:alu_connect/screens/chats_screen.dart';
import 'package:alu_connect/screens/create_event_screen.dart';
import 'package:alu_connect/screens/profile_screen.dart';
import 'package:alu_connect/state/alu_app_state.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const AluConnect());
}

class AluConnect extends StatelessWidget {
  const AluConnect({super.key});

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/welcome',
    routes: [
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/event/:id',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const EventDetailsScreen(),
      ),
      GoRoute(
        path: '/community-detail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => CommunityDetailScreen(
          community: state.extra as CommunityData,
        ),
      ),
      GoRoute(
        path: '/membership-application',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => MembershipApplicationScreen(
          community: state.extra as CommunityData,
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const DiscoverScreen(),
          ),
          GoRoute(
            path: '/explore',
            builder: (context, state) => const CommunitiesExploreScreen(),
          ),
          GoRoute(
            path: '/add',
            builder: (context, state) => const CreateEventScreen(),
          ),
          GoRoute(
            path: '/chats',
            builder: (context, state) => const ChatsScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      state: AluAppState(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Alu Connect',
        theme: AppTheme.darkTheme,
        routerConfig: _router,
      ),
    );
  }
}

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  static const _tabs = ['/home', '/explore', '/add', '/chats', '/profile'];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final index = _tabs.indexWhere((path) => location.startsWith(path));

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index == -1 ? 0 : index,
        onDestinationSelected: (value) => context.go(_tabs[value]),
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
            label: 'Add Event',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: 'Chats',
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
}
