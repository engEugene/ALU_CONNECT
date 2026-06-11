import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';


class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _campusController = TextEditingController(text: 'Kigali Campus');

  String _activeTab = 'Event';
  String _category = 'Workshop';

  final List<String> _categories = const [
    'Workshop',
    'Social',
    'Leadership',
    'Tech',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _campusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Event', style: AppTextStyles.headingLg),
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
                    Expanded(child: _tabButton('Event')),
                    Expanded(child: _tabButton('Opportunity')),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
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
                      Text('Add cover image', style: AppTextStyles.labelLg),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              _fieldLabel('TITLE'),
              const SizedBox(height: 6),
              _buildField(
                controller: _titleController,
                hintText: 'Your post a catchy name',
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
                    return 'Describe the event or opportunity';
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
                children: _categories
                    .map((category) {
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
                    })
                    .toList(growable: false),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text('Publish'),
                ),
              ),
            ],
          ),
         ),
       ),
     );
   }

  Widget _tabButton(String label) {
    final selected = _activeTab == label;
    return GestureDetector(
      onTap: () => setState(() => _activeTab = label),
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
              color: selected ? Colors.white : AppColors.textSecondary,
            ),
          ),
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

  void _submit() {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Event prepared for publishing')),
    );
  }
}