import 'package:alu_connect/data/mock_data.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventDetailsScreen extends StatefulWidget {
  final EventData event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    final isRsvped = MockData.isRsvped(event.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ALU CONNECT'),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppTheme.radiusLg),
              image: DecorationImage(
                image: NetworkImage(event.imageUrl),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: AppColors.divider),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: event.tags
                .map((tag) => _Badge(tag))
                .toList(),
          ),
          const SizedBox(height: 10),
          Text(event.title, style: AppTextStyles.displaySm),
          const SizedBox(height: 4),
          Text(
            '${event.month} ${event.day} \u2022 ${event.time} \u2022 ${event.location}',
            style: AppTextStyles.caption,
          ),
          const SizedBox(height: 4),
          Text(
            'Hosted by ${event.communityName}',
            style: AppTextStyles.caption
                .copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 8),
          Text(
            event.description,
            style: AppTextStyles.bodyMd.copyWith(
                color: AppColors.textSecondary),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _StatBox(event.capacity, 'CAP'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatBox(event.duration, 'DURATION'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatBox(event.entryFee, 'ENTRY'),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius:
                  BorderRadius.circular(AppTheme.radiusMd),
              border: Border.all(color: AppColors.secondary),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ENTRY FEE',
                        style: AppTextStyles.caption),
                    Text(event.entryFee,
                        style: AppTextStyles.labelLg),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        MockData.toggleRsvp(event.id);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(isRsvped
                              ? 'RSVP cancelled'
                              : 'You RSVPed! See you there!'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isRsvped
                          ? AppColors.surfaceContainerHigh
                          : AppColors.primary,
                    ),
                    child: Text(
                        isRsvped
                            ? 'CANCEL RSVP'
                            : 'RSVP NOW',
                        style: TextStyle(
                          color: isRsvped
                              ? AppColors.textSecondary
                              : Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('REGISTRATION DETAILS',
              style: AppTextStyles.labelLg),
          const SizedBox(height: 10),
          _detailCard(
            'Available Slots',
            '${event.availableSlots} / ${event.capacity}',
            'Registration closes soon',
          ),
          const SizedBox(height: 12),
          _detailCard(
            'Friends attending',
            '${event.friendsAttending}',
            'Join with your network',
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  const _Badge(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius:
            BorderRadius.circular(AppTheme.radiusFull),
      ),
      child: Text(
        label,
        style:
            AppTextStyles.labelSm.copyWith(color: Colors.white),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String value;
  final String label;
  const _StatBox(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
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
}

Widget _detailCard(String title, String value, String note) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.surfaceContainer,
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      border: Border.all(color: AppColors.divider),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.labelLg),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.headingMd),
        const SizedBox(height: 2),
        Text(note, style: AppTextStyles.caption),
      ],
    ),
  );
}
