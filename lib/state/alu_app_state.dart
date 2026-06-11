import 'package:flutter/material.dart';

// ── Models ──────────────────────────────────────────────────────────────────

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

// ── Persona ──────────────────────────────────────────────────────────────────

enum Persona {
  student('Student'),
  organizer('Organizer'),
  mentor('Mentor');

  const Persona(this.label);
  final String label;
}

// ── State ────────────────────────────────────────────────────────────────────

class AluAppState extends ChangeNotifier {
  AluAppState();

  UserProfile profile = const UserProfile(
    name: 'Alex Mutesi',
    role: 'Student',
    campus: 'Kigali Campus',
    bio: 'Passionate about tech, leadership, and building community.',
    stats: {
      'Events': '4',
      'Communities': '3',
      'RSVPs': '12',
      'Saved': '7',
    },
    badges: ['Early Adopter', 'Event Host', 'Community Builder'],
  );

  String persona = Persona.student.label;

  List<Opportunity> savedOpportunities = const [
    Opportunity(
      title: 'Data Science Fellowship',
      organizer: 'Standard Chartered',
      dateLabel: 'Nov 5',
      color: Color(0xFF5C6BC0),
    ),
    Opportunity(
      title: 'UX Design Challenge',
      organizer: 'Adobe Student Community',
      dateLabel: 'Dec 1',
      color: Color(0xFFE91E63),
    ),
  ];

  List<Community> joinedCommunities = const [
    Community(
      name: 'Tech Hub Elite',
      nextActivity: 'Hackathon prep — Sat 10am',
      color: Color(0xFF42A5F5),
    ),
    Community(
      name: 'Debate Society',
      nextActivity: 'Practice session — Wed 3pm',
      color: Color(0xFFAB47BC),
    ),
  ];

  void setPersona(Persona p) {
    persona = p.label;
    notifyListeners();
  }
}

// ── InheritedNotifier scope ──────────────────────────────────────────────────

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
