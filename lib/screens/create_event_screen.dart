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

              // Event / Opportunity Sliding Toggle Selector
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

              // Muted Upload Image Box Container Framework
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.35),
                    width: 1.2,
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.textSecondary,
                        size: 28,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Add cover image',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),

              _fieldLabel('TITLE'),
              const SizedBox(height: 6),
              _buildField(
                controller: _titleController,
                hintText: 'Give your post a catchy name',
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
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ..._categories.map((category) {
                    final selected = _category == category;
                    return ChoiceChip(
                      label: Text(
                        category,
                        style: TextStyle(
                          color: selected
                              ? Colors.white
                              : AppColors.textPrimary,
                          fontSize: 13,
                        ),
                      ),
                      selected: selected,
                      onSelected: (_) => setState(() => _category = category),
                      selectedColor: AppColors.primary,
                      backgroundColor: AppColors.surfaceContainer,
                      showCheckmark:
                          false, // Keeps design chip layout width static
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      side: BorderSide(
                        color: selected ? AppColors.primary : AppColors.divider,
                      ),
                    );
                  }),
                  // Add Button configuration token mapping to design layouts
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.surfaceContainer,
                      child: const Icon(
                        Icons.add,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Publish Call to Action Button
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
      style: const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white24),
        filled: true,
        fillColor: AppColors.surfaceContainer,
        suffixIcon: suffixIcon == null
            ? null
            : Icon(suffixIcon, color: AppColors.textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Publishing $_activeTab: ${_titleController.text}'),
        ),
      );
    }
  }
}
