import 'package:alu_connect/data/mock_data.dart';
import 'package:alu_connect/theme/index.dart';
import 'package:alu_connect/widgets/mock_network_image.dart';
import 'package:flutter/material.dart';

class GroupChatScreen extends StatefulWidget {
  final String chatName;
  const GroupChatScreen({super.key, this.chatName = 'AI Workshop Group'});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      MockData.chatMessages.add(MessageData(
        sender: '',
        text: text,
        time: 'Just now',
        isMine: true,
        isRead: false,
      ));
      _controller.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = MockData.chatMessages;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFF1A2A4A),
              child: Icon(Icons.smart_toy_outlined,
                  color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatName,
                    style: AppTextStyles.labelLg),
                Text('124 Members \u2022 12 Online',
                    style: AppTextStyles.caption
                        .copyWith(fontSize: 10)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.call_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 10),
              itemCount: messages.length + 1,
              itemBuilder: (context, i) {
                if (i == 0) return _dateChip('Today, October 24');
                final msg = messages[i - 1];
                return _buildMessage(msg);
              },
            ),
          ),
          _inputBar(),
        ],
      ),
    );
  }

  Widget _buildMessage(MessageData msg) {
    if (msg.type == 'image') return _imageMessage(msg);
    if (msg.type == 'file') return _fileMessage(msg);

    if (msg.isMine) {
      return Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth:
                    MediaQuery.of(context).size.width * 0.72,
              ),
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Text(
                msg.text,
                style: AppTextStyles.bodyMd.copyWith(
                    color: Colors.white, fontSize: 14),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 10, right: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(msg.time,
                      style: AppTextStyles.caption
                          .copyWith(fontSize: 10)),
                  if (msg.isRead) ...[
                    const SizedBox(width: 4),
                    const Icon(Icons.done_all,
                        size: 13, color: AppColors.secondary),
                  ],
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (msg.sender.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.only(left: 44, bottom: 3),
              child: Text(
                msg.sender,
                style: AppTextStyles.caption.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600),
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (msg.sender.isNotEmpty)
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFF1A2A4A),
                  child: Icon(Icons.person,
                      size: 16, color: Colors.white),
                )
              else
                const SizedBox(width: 32),
              const SizedBox(width: 8),
              Container(
                constraints: BoxConstraints(
                  maxWidth:
                      MediaQuery.of(context).size.width * 0.68,
                ),
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Text(
                  msg.text,
                  style: AppTextStyles.bodyMd.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 14),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 44),
            child: Text(msg.time,
                style: AppTextStyles.caption
                    .copyWith(fontSize: 10)),
          ),
        ],
      ),
    );
  }

  Widget _fileMessage(MessageData msg) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin:
            const EdgeInsets.only(left: 40, bottom: 10),
        padding: const EdgeInsets.symmetric(
            horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          borderRadius:
              BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(color: AppColors.divider),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                  Icons.insert_drive_file_outlined,
                  color: AppColors.secondary,
                  size: 22),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(msg.fileName ?? '',
                    style: AppTextStyles.labelSm),
                const SizedBox(height: 2),
                Text(msg.fileSize ?? '',
                    style: AppTextStyles.caption
                        .copyWith(fontSize: 10)),
              ],
            ),
            const SizedBox(width: 12),
            const Icon(Icons.download_outlined,
                color: AppColors.textSecondary, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _imageMessage(MessageData msg) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 40, bottom: 10),
        width: 200,
        height: 130,
        child: MockNetworkImage(
          imageUrl:
              'https://images.unsplash.com/photo-1611532736597-de2d4265fba3?w=400',
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        ),
      ),
    );
  }

  Widget _dateChip(String label) {
    return Center(
      child: Container(
        margin:
            const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(
            horizontal: 14, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHigh,
          borderRadius:
              BorderRadius.circular(AppTheme.radiusFull),
        ),
        child: Text(
          label,
          style: AppTextStyles.caption
              .copyWith(fontSize: 11),
        ),
      ),
    );
  }

  Widget _inputBar() {
    return Container(
      padding:
          const EdgeInsets.fromLTRB(10, 8, 10, 16),
      color: AppColors.background,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_outline,
                color: AppColors.textSecondary),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              style: AppTextStyles.bodyMd
                  .copyWith(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Message group...',
                filled: true,
                fillColor: AppColors.surfaceContainer,
                contentPadding:
                    const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      AppTheme.radiusFull),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                      Icons.emoji_emotions_outlined,
                      color: AppColors.textSecondary),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _sendMessage,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send_rounded,
                  color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
