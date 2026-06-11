import 'package:alu_connect/data/mock_data.dart';
import 'package:alu_connect/screens/group_chat_screen.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _filterIndex = 0;
  final _filters = const ['All Chats', 'Clubs', 'Events', 'Direct'];

  @override
  Widget build(BuildContext context) {
    final chats = MockData.chats;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ALU Connect'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Messages', style: AppTextStyles.headingLg),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined,
                      color: AppColors.primary),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search chats, groups, or clubs...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.surfaceContainer,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppTheme.radiusFull),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final selected = _filterIndex == i;
                return GestureDetector(
                  onTap: () => setState(() => _filterIndex = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primary
                          : AppColors.surfaceContainer,
                      borderRadius:
                          BorderRadius.circular(AppTheme.radiusFull),
                    ),
                    child: Text(
                      _filters[i],
                      style: AppTextStyles.labelSm.copyWith(
                        color: selected
                            ? Colors.white
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, i) =>
                  _ChatTile(chat: chats[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatTile extends StatelessWidget {
  final ChatData chat;
  const _ChatTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => GroupChatScreen(chatName: chat.name),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: chat.avatarColor,
                  child: Icon(chat.avatarIcon,
                      color: Colors.white, size: 22),
                ),
                if (chat.hasOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.background, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(chat.name,
                          style: AppTextStyles.labelLg),
                      Text(chat.time,
                          style: AppTextStyles.caption),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    chat.preview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.caption.copyWith(
                      fontStyle: chat.isItalic
                          ? FontStyle.italic
                          : FontStyle.normal,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (chat.unread > 0) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                      BorderRadius.circular(AppTheme.radiusFull),
                ),
                child: Text(
                  '${chat.unread}',
                  style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ] else if (chat.hasOnline) ...[
              const SizedBox(width: 8),
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
