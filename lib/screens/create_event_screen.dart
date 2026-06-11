import 'package:alu_connect/data/mock_data.dart';
import 'package:alu_connect/models/community_data.dart';
import 'package:alu_connect/state/alu_app_state.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _communityFormKey = GlobalKey<FormState>();
  final _eventFormKey = GlobalKey<FormState>();

  final _communityNameController = TextEditingController();
  final _communityDescriptionController = TextEditingController();
  final _communityAboutController = TextEditingController();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _campusController = TextEditingController(text: 'Kigali Campus');

  String _activeTab = 'Community';
  String _category = 'Workshop';
  CommunityData? _selectedCommunity;

  final List<String> _categories = const [
    'Workshop',
    'Social',
    'Leadership',
    'Tech',
  ];

  @override
  void dispose() {
    _communityNameController.dispose();
    _communityDescriptionController.dispose();
    _communityAboutController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _campusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final myCommunities = appState.availableCommunitiesForEvent;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ALU Connect'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 4),
          const CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.surfaceContainerHigh,
            child: Icon(Icons.person, size: 16, color: AppColors.textPrimary),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add', style: AppTextStyles.headingLg),
            const SizedBox(height: 8),
            Text(
              _activeTab == 'Community'
                  ? 'Create a community first, then you can publish events for it.'
                  : 'Only community creators can publish events.',
              style: AppTextStyles.bodyMd.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                border: Border.all(color: AppColors.divider),
              ),
              child: Row(
                children: [
                  Expanded(child: _tabButton('Community')),
                  Expanded(
                    child: _tabButton(
                      'Event',
                      enabled: myCommunities.isNotEmpty,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            _imageCard(
              _activeTab == 'Community'
                  ? 'Add community banner'
                  : 'Add event cover image',
            ),
            const SizedBox(height: 18),
            if (_activeTab == 'Community')
              _buildCommunityForm()
            else
              _buildEventForm(myCommunities),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityForm() {
    return Form(
      key: _communityFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create Community', style: AppTextStyles.headingLg),
          const SizedBox(height: 14),
          _fieldLabel('COMMUNITY NAME'),
          const SizedBox(height: 6),
          _buildField(
            controller: _communityNameController,
            hintText: 'Give your community a name',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Add a community name';
              }
              return null;
            },
          ),
          const SizedBox(height: 14),
          _fieldLabel('SHORT DESCRIPTION'),
          const SizedBox(height: 6),
          _buildField(
            controller: _communityDescriptionController,
            hintText: 'What is this community about?',
            validator: (value) {
              if (value == null || value.trim().length < 8) {
                return 'Add a short description';
              }
              return null;
            },
          ),
          const SizedBox(height: 14),
          _fieldLabel('ABOUT'),
          const SizedBox(height: 6),
          _buildField(
            controller: _communityAboutController,
            hintText: 'Tell people more about your community...',
            maxLines: 4,
            validator: (value) {
              if (value == null || value.trim().length < 12) {
                return 'Add a longer about section';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitCommunity,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: const Text('Create Community'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventForm(List<CommunityData> myCommunities) {
    return Form(
      key: _eventFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create Event', style: AppTextStyles.headingLg),
          const SizedBox(height: 14),
          if (myCommunities.isEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                border: Border.all(color: Colors.orange),
              ),
              child: Column(
                children: [
                  const Icon(Icons.info_outline, color: Colors.orange, size: 28),
                  const SizedBox(height: 8),
                  Text(
                    'Create a community first before adding an event.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyMd.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            )
          else ...[
            _fieldLabel('YOUR COMMUNITY'),
            const SizedBox(height: 6),
            DropdownButtonFormField<CommunityData>(
              initialValue: _selectedCommunity,
              isExpanded: true,
              menuMaxHeight: 200,
              decoration: InputDecoration(
                hintText: 'Select your community',
                filled: true,
                fillColor: AppColors.surfaceContainer,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  borderSide: BorderSide.none,
                ),
              ),
              items: myCommunities
                  .map(
                    (community) => DropdownMenuItem(
                      value: community,
                      child: Text(community.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _selectedCommunity = value),
              validator: (value) {
                if (value == null) {
                  return 'Select a community';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            _fieldLabel('TITLE'),
            const SizedBox(height: 6),
            _buildField(
              controller: _titleController,
              hintText: 'Give your event a catchy name',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Add a title';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            _fieldLabel('DESCRIPTION'),
            const SizedBox(height: 6),
            _buildField(
              controller: _descriptionController,
              hintText: 'Tell the community more about this...',
              maxLines: 4,
              validator: (value) {
                if (value == null || value.trim().length < 12) {
                  return 'Describe the event';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            _fieldLabel('DATE & TIME'),
            const SizedBox(height: 6),
            _buildField(
              controller: _dateController,
              hintText: 'mm/dd/yyyy • --:--',
              suffixIcon: Icons.calendar_month_outlined,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Add a date and time';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            _fieldLabel('CAMPUS'),
            const SizedBox(height: 6),
            _buildField(
              controller: _campusController,
              hintText: 'Kigali Campus',
              suffixIcon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 14),
            _fieldLabel('CATEGORY'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _categories.map((category) {
                final selected = _category == category;
                return ChoiceChip(
                  label: Text(category),
                  selected: selected,
                  onSelected: (_) => setState(() => _category = category),
                  selectedColor: AppColors.primary,
                  backgroundColor: AppColors.surfaceContainer,
                  labelStyle: AppTextStyles.labelSm.copyWith(
                    color: selected ? Colors.white : AppColors.textPrimary,
                  ),
                  side: BorderSide(
                    color: selected ? AppColors.primary : AppColors.divider,
                  ),
                );
              }).toList(growable: false),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitEvent,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text('Publish Event'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _tabButton(String label, {bool enabled = true}) {
    final selected = _activeTab == label;
    return GestureDetector(
      onTap: () {
        if (!enabled) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Create a community first to unlock event creation.'),
            ),
          );
          return;
        }
        setState(() => _activeTab = label);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(AppTheme.radiusFull),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.labelLg.copyWith(
              color: enabled
                  ? selected
                      ? Colors.white
                      : AppColors.textSecondary
                  : AppColors.textSecondary.withValues(alpha: 0.45),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageCard(String label) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.35),
          width: 1.2,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_a_photo_outlined,
              color: AppColors.primary,
              size: 30,
            ),
            const SizedBox(height: 10),
            Text(label, style: AppTextStyles.labelLg),
          ],
        ),
      ),
    );
  }

  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: AppTextStyles.labelSm.copyWith(letterSpacing: 1.2),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String hintText,
    int maxLines = 1,
    IconData? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.surfaceContainer,
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void _submitCommunity() {
    final valid = _communityFormKey.currentState?.validate() ?? false;
    if (!valid) return;

    final appState = AppStateScope.of(context);
    final newCommunity = CommunityData(
      name: _communityNameController.text.trim(),
      members: '1 Member',
      category: 'Custom Community',
      bannerUrl: 'https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=800',
      about: _communityAboutController.text.trim(),
      tags: const ['New', 'Student-led'],
      leaders: [
        CommunityLeader(name: appState.profile.name, role: 'Founder'),
      ],
      joinTitle: 'Join Us',
      joinDescription: _communityDescriptionController.text.trim(),
      perks: const ['Be part of something new'],
      specializationLabel: 'YOUR ROLE',
      specializations: const ['Member', 'Organizer', 'Other'],
    );

    appState.addOwnedCommunity(newCommunity);

    _communityNameController.clear();
    _communityDescriptionController.clear();
    _communityAboutController.clear();

    setState(() {
      _selectedCommunity = newCommunity;
      _activeTab = 'Event';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${newCommunity.name} created. You can now add an event.'),
      ),
    );
  }

  void _submitEvent() {
    final valid = _eventFormKey.currentState?.validate() ?? false;
    if (!valid) return;
    if (_selectedCommunity == null) return;

    final event = EventData(
      id: MockData.nextEventId,
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      day: 'NEW',
      month: 'NOW',
      time: _dateController.text.trim(),
      location: _campusController.text.trim(),
      category: _category.toUpperCase(),
      tags: [_category.toUpperCase()],
      capacity: '50',
      duration: '2h',
      entryFee: 'Free',
      imageUrl: 'https://images.unsplash.com/photo-1511578314322-379afb476865?w=800',
      communityId: _selectedCommunity!.name.toLowerCase().replaceAll(' ', '-'),
      communityName: _selectedCommunity!.name,
      availableSlots: 50,
      friendsAttending: 0,
    );

    AppStateScope.of(context).addEvent(event);

    _titleController.clear();
    _descriptionController.clear();
    _dateController.clear();
    setState(() {
      _category = 'Workshop';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Event created! Check it on the home screen'),
      ),
    );
  }
}
