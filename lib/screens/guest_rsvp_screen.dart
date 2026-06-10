import 'package:flutter/material.dart';
import 'package:alu_connect/theme/app_colors.dart';

class GuestRsvpScreen extends StatelessWidget {
  const GuestRsvpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF070A10,
      ), // Tinted dark backdrop background overlay
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Custom Back Header
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Cancel',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Tags Header Bar
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Guest RSVP',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: const [
                        Icon(
                          Icons.public,
                          size: 12,
                          color: AppColors.textSecondary,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'External Community',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Main Header Information
                const Text(
                  'Future Tech Symposium 2024',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Organized by The Innovators Guild. Join as a guest to network with alumni and industry leaders.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),

                // Banner Details Card placeholder (Empty graphic slate layout style)
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.layers,
                    color: Colors.white10,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 16),

                // Specific Date & Time Metrics rows
                Row(
                  children: const [
                    Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.redAccent,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Oct 24, 2024 • 10:00 AM',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: Colors.redAccent,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Great Hall, New Campus',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Context Form Text Field block
                const Text(
                  'Why are you interested in this event?',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText:
                        "Tell the community owner why you'd like to join this session...",
                    hintStyle: const TextStyle(
                      color: Colors.white24,
                      fontSize: 13,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF0D1625),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 1,
                      ), // Crimson Alert Ring
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Warning / Validation Note Alert Box Container
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.info_outline,
                        size: 16,
                        color: Colors.redAccent,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Since you are not a member of Innovators Guild, your RSVP requires approval from the community lead.',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.redAccent,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // RSVP Action Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Submit RSVP ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(Icons.send_rounded, size: 14, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Footer Protocol Info label
                const Center(
                  child: Text(
                    'Powered by AluConnect Community Protocol v1.4',
                    style: TextStyle(color: Colors.white10, fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
