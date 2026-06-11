import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

class CommunityMembershipApplicationScreen extends StatefulWidget {
  const CommunityMembershipApplicationScreen({super.key});

  @override
  State<CommunityMembershipApplicationScreen> createState() =>
      _CommunityMembershipApplicationScreenState();
}

class _CommunityMembershipApplicationScreenState
    extends State<CommunityMembershipApplicationScreen> {

  final nameController = TextEditingController();
  final studentIdController = TextEditingController();
  final emailController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Membership Application"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: studentIdController,
              decoration: const InputDecoration(
                labelText: "Student ID",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: reasonController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Why do you want to join?",
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Application Submitted"),
                  ),
                );
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}