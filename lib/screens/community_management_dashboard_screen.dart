import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

class CommunityManagementDashboardScreen extends StatelessWidget {
  const CommunityManagementDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Management Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Members"),
                subtitle: const Text("245"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.pending_actions),
                title: const Text("Pending Applications"),
                subtitle: const Text("18"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.event),
                title: const Text("Upcoming Events"),
                subtitle: const Text("5"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}