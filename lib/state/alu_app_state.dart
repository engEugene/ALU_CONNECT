import 'package:alu_connect/data/mock_data.dart';
import 'package:alu_connect/models/community_data.dart';
import 'package:flutter/material.dart';

class UserProfile {
  const UserProfile({
    required this.name,
    required this.role,
    required this.campus,
    required this.bio,
    required this.stats,
    required this.badges,
  });

  final String name;
  final String role;
  final String campus;
  final String bio;
  final Map<String, String> stats;
  final List<String> badges;
}

class Opportunity {
  const Opportunity({
    required this.title,
    required this.organizer,
    required this.dateLabel,
    required this.color,
  });

  final String title;
  final String organizer;
  final String dateLabel;
  final Color color;
}

class Community {
  const Community({
    required this.name,
    required this.nextActivity,
    required this.color,
  });

  final String name;
  final String nextActivity;
  final Color color;
}

enum Persona {
  student('Student'),
  organizer('Organizer'),
  mentor('Mentor');

  const Persona(this.label);
  final String label;
}

class AluAppState extends ChangeNotifier {
  AluAppState();

  UserProfile profile = const UserProfile(
    name: 'Amara Nwosu',
    role: 'Student',
    campus: 'Kigali Campus',
    bio: 'Passionate about tech, entrepreneurship, and building community across Africa.',
    stats: {
      'Hosted': '12',
      'Joined': '5',
      'Tracked': '34',
      'Saved': '8',
    },
    badges: [
      'Early Adopter',
      'Event Host',
      'Top Contributor',
      'Hackathon Winner',
      'Mentor',
    ],
  );

  String persona = Persona.student.label;

  List<Opportunity> savedOpportunities = const [
    Opportunity(
      title: 'Google Summer of Code',
      organizer: 'Google',
      dateLabel: 'Jun 15',
      color: Color(0xFF4285F4),
    ),
    Opportunity(
      title: 'ALU Hackathon 2026',
      organizer: 'ALU Tech Club',
      dateLabel: 'Jul 3',
      color: Color(0xFFE91E63),
    ),
    Opportunity(
      title: 'UN Youth Fellowship',
      organizer: 'United Nations',
      dateLabel: 'Aug 1',
      color: Color(0xFF18D26E),
    ),
  ];

  List<Community> joinedCommunities = const [
    Community(
      name: 'ALU Tech Club',
      nextActivity: 'Hackathon prep \u2014 Fri 6pm',
      color: Color(0xFF42A5F5),
    ),
    Community(
      name: 'Entrepreneurship Hub',
      nextActivity: 'Pitch night \u2014 Sat 4pm',
      color: Color(0xFFAB47BC),
    ),
    Community(
      name: 'ALU Debate Society',
      nextActivity: 'Open session \u2014 Mon 5pm',
      color: Color(0xFF18D26E),
    ),
  ];

  List<CommunityData> communities = MockData.communities;
  List<EventData> events = MockData.events;
  List<CommunityData> ownedCommunities = MockData.ownedCommunities;

  void addOwnedCommunity(CommunityData community) {
    communities.add(community);
    ownedCommunities.add(community);
    notifyListeners();
  }

  void addEvent(EventData event) {
    events.add(event);
    notifyListeners();
  }

  bool isEventOwner(String eventId) {
    EventData? event;
    for (final item in events) {
      if (item.id == eventId) {
        event = item;
        break;
      }
    }
    if (event == null) return false;
    final currentEvent = event;
    return ownedCommunities.any((c) => c.name == currentEvent.communityName);
  }

  List<CommunityData> get availableCommunitiesForEvent {
    return ownedCommunities;
  }

  void setPersona(Persona p) {
    persona = p.label;
    notifyListeners();
  }
}

class AppStateScope extends InheritedNotifier<AluAppState> {
  const AppStateScope({
    super.key,
    required AluAppState state,
    required super.child,
  }) : super(notifier: state);

  static AluAppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    assert(scope != null, 'No AppStateScope found in context');
    return scope!.notifier!;
  }
}
