import 'package:flutter/material.dart';

class CommunityLeader {
  final String name;
  final String role;
  const CommunityLeader({required this.name, required this.role});
}

class CommunityData {
  final String name;
  final String members;
  final String category;
  final String bannerUrl;
  final String about;
  final List<String> tags;
  final List<CommunityLeader> leaders;
  final String joinTitle;
  final String joinDescription;
  final List<String> perks;
  final String specializationLabel;
  final List<String> specializations;

  const CommunityData({
    required this.name,
    required this.members,
    required this.category,
    required this.bannerUrl,
    required this.about,
    required this.tags,
    required this.leaders,
    required this.joinTitle,
    required this.joinDescription,
    required this.perks,
    required this.specializationLabel,
    required this.specializations,
  });
}

class Communities {
  static const techHubElite = CommunityData(
    name: 'Tech Hub Elite',
    members: '1,248 Members',
    category: 'Academic Society',
    bannerUrl: 'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800',
    about: 'Tech Hub Elite is the premier destination for students pursuing excellence in software engineering, data science, and emerging technologies. We bridge the gap between academic theory and industry reality through peer-led workshops, high-stakes hackathons, and exclusive networking events with global tech leaders.',
    tags: ['Artificial Intelligence', 'Web3', 'System Architecture', 'Open Source'],
    leaders: [
      CommunityLeader(name: 'Dr. Julian Vance', role: 'Community Faculty Lead'),
      CommunityLeader(name: 'Sarah Chen', role: 'Student Chairperson'),
    ],
    joinTitle: 'Join the Elite',
    joinDescription: 'Membership is application-based to ensure a high-quality collaborative environment.',
    perks: [
      '24/7 Access to the Private Tech Lab',
      'Priority Invitations to Global Hackathons',
      'Cloud Infrastructure Credits (\$500/yr)',
    ],
    specializationLabel: 'YOUR SPECIALIZATION',
    specializations: ['Developer', 'Designer', 'Data Scientist', 'Other'],
  );

  static const debateSociety = CommunityData(
    name: 'Debate Society',
    members: '156 Members',
    category: 'Academic Society',
    bannerUrl: 'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=800',
    about: 'The Debate Society sharpens your rhetoric, critical thinking, and public speaking skills. We compete in regional and international tournaments while fostering a culture of respectful, evidence-based discourse on the issues that matter most.',
    tags: ['Public Speaking', 'Critical Thinking', 'Policy', 'Rhetoric'],
    leaders: [
      CommunityLeader(name: 'Prof. Amina Diallo', role: 'Faculty Advisor'),
      CommunityLeader(name: 'Marcus Osei', role: 'Club President'),
    ],
    joinTitle: 'Find Your Voice',
    joinDescription: 'Open to all students who want to sharpen their argumentation and public speaking skills.',
    perks: [
      'Access to Regional & International Tournaments',
      'Weekly Coached Practice Sessions',
      'Networking with Alumni in Law & Policy',
    ],
    specializationLabel: 'YOUR SKILL',
    specializations: ['Researcher', 'Public Speaker', 'Moderator', 'Other'],
  );

  static const artsGuild = CommunityData(
    name: 'Arts Guild',
    members: '83 Members',
    category: 'Creative Society',
    bannerUrl: 'https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=800',
    about: 'The Arts Guild is a vibrant creative space where artists, designers, and storytellers collaborate. From gallery exhibitions to cross-disciplinary projects, we celebrate creativity in all its forms across the ALU community.',
    tags: ['Visual Art', 'Design', 'Photography', 'Storytelling'],
    leaders: [
      CommunityLeader(name: 'Dr. Fatima Nkosi', role: 'Faculty Advisor'),
      CommunityLeader(name: 'Zara Mensah', role: 'Guild President'),
    ],
    joinTitle: 'Create With Us',
    joinDescription: 'Open to all students with a passion for art, design, and creative expression.',
    perks: [
      'Access to the Campus Art Studio',
      'Annual Gallery Exhibition Slot',
      'Creative Grants up to \$300/yr',
    ],
    specializationLabel: 'YOUR CRAFT',
    specializations: ['Visual Artist', 'Photographer', 'Digital Designer', 'Other'],
  );

  static const sportsCouncil = CommunityData(
    name: 'Sports Council',
    members: '320 Members',
    category: 'Sports & Wellness',
    bannerUrl: 'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=800',
    about: 'The Sports Council is the governing body for all varsity and recreational sports at ALU. We organize inter-campus tournaments, fitness programs, and wellness initiatives to keep the community active and competitive.',
    tags: ['Football', 'Basketball', 'Athletics', 'Wellness'],
    leaders: [
      CommunityLeader(name: 'Coach David Kimani', role: 'Athletic Director'),
      CommunityLeader(name: 'Aisha Traoré', role: 'Student Council Head'),
    ],
    joinTitle: 'Join the Team',
    joinDescription: 'Open to all students who want to compete, stay fit, or help organize sports events.',
    perks: [
      'Access to All Campus Sports Facilities',
      'Priority Registration for Tournaments',
      'Sports Equipment Stipend (\$200/yr)',
    ],
    specializationLabel: 'YOUR ROLE',
    specializations: ['Athlete', 'Coach', 'Event Organizer', 'Other'],
  );

  static const musicEnsemble = CommunityData(
    name: 'Music Ensemble',
    members: '45 Members',
    category: 'Arts & Culture',
    bannerUrl: 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=800',
    about: 'The Music Ensemble brings together musicians of all genres and skill levels. From classical to jazz fusion, we perform at campus events, collaborate on original compositions, and run music workshops open to the whole community.',
    tags: ['Jazz', 'Classical', 'Composition','Performance'],
    leaders: [
      CommunityLeader(name: 'Prof. Kofi Adu', role: 'Music Director'),
      CommunityLeader(name: 'Lena Okafor', role: 'Ensemble Lead'),
    ],
    joinTitle: 'Make Music With Us',
    joinDescription: 'Open to all skill levels — whether you are a seasoned musician or just starting out.',
    perks: [
      'Access to the Recording Studio',
      'Performance Slots at Campus Events',
      'Instrument Rental at No Cost',
    ],
    specializationLabel: 'YOUR INSTRUMENT',
    specializations: ['Instrumentalist', 'Vocalist', 'Composer', 'Other'],
  );

  static const financeClub = CommunityData(
    name: 'Finance Club',
    members: '103 Members',
    category: 'Academic Society',
    bannerUrl: 'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?w=800',
    about: 'The Finance Club equips students with real-world financial skills in investing, analysis, and planning. Through case competitions, guest lectures from industry leaders, and hands-on portfolio simulations, we prepare future finance professionals.',
    tags: ['Investing', 'Financial Analysis', 'Fintech', 'Entrepreneurship'],
    leaders: [
      CommunityLeader(name: 'Dr. Kwame Asante', role: 'Faculty Advisor'),
      CommunityLeader(name: 'Nadia Mwangi', role: 'Club President'),
    ],
    joinTitle: 'Invest in Yourself',
    joinDescription: 'Open to all students interested in finance, investing, and economic leadership.',
    perks: [
      'Access to Bloomberg Terminal',
      'Invitations to Finance Industry Events',
      'Portfolio Simulation with Real Market Data',
    ],
    specializationLabel: 'YOUR FOCUS',
    specializations: ['Analyst', 'Investor', 'Entrepreneur', 'Other'],
  );
}