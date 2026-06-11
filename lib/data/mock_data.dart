import 'package:alu_connect/models/community_data.dart';
import 'package:flutter/material.dart';

class EventData {
  final String id;
  final String title;
  final String description;
  final String day;
  final String month;
  final String time;
  final String location;
  final String category;
  final List<String> tags;
  final String capacity;
  final String duration;
  final String entryFee;
  final String imageUrl;
  final String communityId;
  final String communityName;
  int availableSlots;
  int friendsAttending;

  EventData({
    required this.id,
    required this.title,
    required this.description,
    required this.day,
    required this.month,
    required this.time,
    required this.location,
    required this.category,
    required this.tags,
    required this.capacity,
    required this.duration,
    required this.entryFee,
    required this.imageUrl,
    required this.communityId,
    required this.communityName,
    this.availableSlots = 0,
    this.friendsAttending = 0,
  });
}

class ChatData {
  final String id;
  final String name;
  final String preview;
  final String time;
  final int unread;
  final bool hasOnline;
  final bool isItalic;
  final Color avatarColor;
  final IconData avatarIcon;
  final String? communityId;

  const ChatData({
    required this.id,
    required this.name,
    required this.preview,
    required this.time,
    this.unread = 0,
    this.hasOnline = false,
    this.isItalic = false,
    required this.avatarColor,
    required this.avatarIcon,
    this.communityId,
  });
}

class MessageData {
  final String sender;
  final String text;
  final String time;
  final bool isMine;
  final String type;
  final String? fileName;
  final String? fileSize;
  final bool isRead;

  const MessageData({
    required this.sender,
    required this.text,
    required this.time,
    required this.isMine,
    this.type = 'text',
    this.fileName,
    this.fileSize,
    this.isRead = false,
  });
}

class MockData {
  static List<EventData> events = [
    EventData(
      id: '1',
      title: 'Venture Pitch Masterclass',
      description:
          'Keen your delivery with industry mentors and campus entrepreneurs.',
      day: '24',
      month: 'JAN',
      time: '18:00 - 20:30',
      location: 'Innovation Hub',
      category: 'WORKSHOP',
      tags: ['WORKSHOP', 'ENTREPRENEURSHIP'],
      capacity: '60',
      duration: '2h',
      entryFee: 'Free',
      imageUrl:
          'https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=800',
      communityId: 'community-1',
      communityName: 'Tech Hub Elite',
      availableSlots: 45,
      friendsAttending: 12,
    ),
    EventData(
      id: '2',
      title: 'Neo Nights Mixer',
      description:
          'Celebrate mid-term completion with your classmates and friends.',
      day: '26',
      month: 'JAN',
      time: '18:30 - 20:00',
      location: 'Campus Lounge',
      category: 'SOCIAL',
      tags: ['SOCIAL', 'NETWORKING'],
      capacity: '120',
      duration: '3h',
      entryFee: 'Free',
      imageUrl:
          'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800',
      communityId: 'community-2',
      communityName: 'Debate Society',
      availableSlots: 98,
      friendsAttending: 8,
    ),
    EventData(
      id: '3',
      title: 'Pan-African Tech Summit',
      description:
          'A keynote series featuring alumni currently shaping the African tech landscape.',
      day: '28',
      month: 'JAN',
      time: '13:00 - 15:00',
      location: 'Main Auditorium',
      category: 'ACADEMIC',
      tags: ['ACADEMIC', 'TECH'],
      capacity: '200',
      duration: '3h',
      entryFee: 'Free',
      imageUrl:
          'https://images.unsplash.com/photo-1515187029135-18ee286d815b?w=800',
      communityId: 'community-1',
      communityName: 'Tech Hub Elite',
      availableSlots: 150,
      friendsAttending: 25,
    ),
    EventData(
      id: '4',
      title: 'AI for Social Impact',
      description:
          'Explore how AI is transforming communities across Africa.',
      day: '24',
      month: 'OCT',
      time: '14:00',
      location: 'Innovation Hub',
      category: 'WORKSHOP',
      tags: ['WORKSHOP', 'TECH FOR GOOD'],
      capacity: '60',
      duration: '3h',
      entryFee: 'Free',
      imageUrl:
          'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=800',
      communityId: 'community-1',
      communityName: 'Tech Hub Elite',
      availableSlots: 45,
      friendsAttending: 12,
    ),
  ];

  static int _nextEventId = 5;

  static String get nextEventId => '${_nextEventId++}';

  static List<CommunityData> get communities => [
        Communities.techHubElite,
        Communities.debateSociety,
        Communities.artsGuild,
        Communities.sportsCouncil,
        Communities.musicEnsemble,
        Communities.financeClub,
      ];

  static List<ChatData> chats = [
    const ChatData(
      id: 'chat-1',
      name: 'ALU Tech Society',
      preview: "David: Don't forget the hackathon starts in 2 hours!",
      time: '10:24 AM',
      unread: 12,
      avatarColor: Color(0xFF1A2A4A),
      avatarIcon: Icons.computer,
      communityId: 'community-1',
    ),
    const ChatData(
      id: 'chat-2',
      name: 'Gala Night Committee',
      preview: 'Sarah sent a photo',
      time: 'Yesterday',
      hasOnline: true,
      isItalic: true,
      avatarColor: Color(0xFF3A1A10),
      avatarIcon: Icons.local_fire_department,
      communityId: 'community-2',
    ),
    const ChatData(
      id: 'chat-3',
      name: 'Sarah Chen',
      preview: 'Did you finish the research proposal for Dr. Ndlovu?',
      time: '2:15 PM',
      avatarColor: Color(0xFF4A1A2A),
      avatarIcon: Icons.person,
    ),
    const ChatData(
      id: 'chat-4',
      name: 'Marcus Tetteh',
      preview:
          'Check out this new internship opportunity I found on LinkedIn!',
      time: 'Monday',
      avatarColor: Color(0xFF1A1A3A),
      avatarIcon: Icons.person,
    ),
    const ChatData(
      id: 'chat-5',
      name: 'Nia Zuri',
      preview: 'Thanks for the help with the CS lab! You saved my grade.',
      time: 'Sunday',
      avatarColor: Color(0xFF2A1A3A),
      avatarIcon: Icons.person,
    ),
  ];

  static List<MessageData> chatMessages = [
    const MessageData(
      sender: 'Marcus Chen',
      text:
          "Has anyone started the prompt engineering module for the midterm? I'm curious about the token limits we should target.",
      time: '10:42 AM',
      isMine: false,
    ),
    const MessageData(
      sender: '',
      text: 'midterm_guidelines.pdf',
      time: '10:47 AM',
      isMine: false,
      type: 'file',
      fileName: 'midterm_guidelines.pdf',
      fileSize: '2.4 MB \u2022 PDF Document',
    ),
    const MessageData(
      sender: '',
      text:
          'I just finished reading the documentation. The guidelines say to aim for under 500 tokens for the initial prompt phase.',
      time: '10:47 AM',
      isMine: true,
      isRead: true,
    ),
    const MessageData(
      sender: 'Sarah Jenkins',
      text:
          'Thanks for the heads up! Are we still meeting at the Lab at 5 PM for the study session?',
      time: '10:48 AM',
      isMine: false,
    ),
    const MessageData(
      sender: '',
      text: 'Sure, see you there!',
      time: '10:50 AM',
      isMine: true,
      isRead: true,
    ),
    const MessageData(
      sender: '',
      text: "Yes, just secured Room 302. It's empty now!",
      time: '10:52 AM',
      isMine: true,
      isRead: true,
    ),
  ];

  static List<String> rsvpedEventIds = ['1'];

  static EventData? getEventById(String eventId) {
    for (final event in events) {
      if (event.id == eventId) {
        return event;
      }
    }
    return null;
  }

  static void toggleRsvp(String eventId) {
    final event = getEventById(eventId);
    if (event == null) return;

    if (rsvpedEventIds.contains(eventId)) {
      rsvpedEventIds.remove(eventId);
      event.availableSlots++;
      if (event.friendsAttending > 0) {
        event.friendsAttending--;
      }
    } else {
      rsvpedEventIds.add(eventId);
      if (event.availableSlots > 0) {
        event.availableSlots--;
      }
      event.friendsAttending++;
    }
  }

  static bool isRsvped(String eventId) {
    return rsvpedEventIds.contains(eventId);
  }

  static const Map<String, String> userProfile = {
    'name': 'Amara Nwosu',
    'role': 'Student',
    'campus': 'Kigali Campus',
    'bio': 'Passionate about tech, entrepreneurship, and building community across Africa.',
    'initials': 'A',
  };

  static const List<Map<String, String>> userStats = [
    {'value': '12', 'label': 'Hosted'},
    {'value': '5', 'label': 'Joined'},
    {'value': '34', 'label': 'Tracked'},
    {'value': '8', 'label': 'Saved'},
  ];

  static const List<String> userBadges = [
    'Early Adopter',
    'Event Host',
    'Top Contributor',
    'Hackathon Winner',
    'Mentor',
  ];

  static List<CommunityData> ownedCommunities = [
    Communities.techHubElite,
  ];
}
