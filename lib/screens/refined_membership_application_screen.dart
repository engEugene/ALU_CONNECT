import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

class RefinedMembershipApplicationScreen extends StatefulWidget {
  const RefinedMembershipApplicationScreen({super.key});

  @override
  State<RefinedMembershipApplicationScreen> createState() =>
      _RefinedMembershipApplicationScreenState();
}

class _RefinedMembershipApplicationScreenState
    extends State<RefinedMembershipApplicationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController motivationController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();

  String? selectedProgram;
  String? selectedYear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refined Membership Application'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Apply for Community Membership',
                style: AppTextStyles.headingLg,
              ),

              const SizedBox(height: AppTheme.spacingLg),

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),

              const SizedBox(height: AppTheme.spacingMd),

              TextFormField(
                controller: studentIdController,
                decoration: const InputDecoration(
                  labelText: 'Student ID',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your Student ID' : null,
              ),

              const SizedBox(height: AppTheme.spacingMd),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'ALU Email',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your email' : null,
              ),

              const SizedBox(height: AppTheme.spacingMd),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Program',
                ),
                value: selectedProgram,
                items: const [
                  DropdownMenuItem(
                    value: 'Software Engineering',
                    child: Text('Software Engineering'),
                  ),
                  DropdownMenuItem(
                    value: 'Entrepreneurial Leadership',
                    child: Text('Entrepreneurial Leadership'),
                  ),
                  DropdownMenuItem(
                    value: 'International Business and Trade',
                    child: Text('International Business and Trade'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedProgram = value;
                  });
                },
              ),

              const SizedBox(height: AppTheme.spacingMd),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Year of Study',
                ),
                value: selectedYear,
                items: const [
                  DropdownMenuItem(
                    value: 'Year 1',
                    child: Text('Year 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Year 2',
                    child: Text('Year 2'),
                  ),
                  DropdownMenuItem(
                    value: 'Year 3',
                    child: Text('Year 3'),
                  ),
                  DropdownMenuItem(
                    value: 'Year 4',
                    child: Text('Year 4'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedYear = value;
                  });
                },
              ),

              const SizedBox(height: AppTheme.spacingMd),

              TextFormField(
                controller: motivationController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Why do you want to join?',
                ),
              ),

              const SizedBox(height: AppTheme.spacingMd),

              TextFormField(
                controller: skillsController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Skills & Experience',
                ),
              ),

              const SizedBox(height: AppTheme.spacingLg),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Application submitted successfully!',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit Application'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}