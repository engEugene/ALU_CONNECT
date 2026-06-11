import 'package:alu_connect/theme/index.dart';
import 'package:flutter/material.dart';

enum _MsgType { text, file, image }

class _Message {
  const _Message({
    required this.sender,
    required this.text,
    required this.time,
    required this.isMine,
    this.type = _MsgType.text,
    this.fileName,
    this.fileSize,
    this.isRead = false,
  });

  final String sender;
  final String text;
  final String time;
  final bool isMine;
  final _MsgType type;
  final String? fileName;
  final String? fileSize;
  final bool isRead;
}

const _messages = [
  _Message(
    sender: 'Marcus Chen',
    text: "Has anyone started the prompt engineering module for the midterm? I'm curious about the token limits we should target.",
    time: '10:42 AM',
    isMine: false,
  ),
  _Message(
    sender: '',
    text: 'midterm_guidelines.pdf',
    time: '10:47 AM',
    isMine: false,
    type: _MsgType.file,
    fileName: 'midterm_guidelines.pdf',
    fileSize: '2.4 MB • PDF Document',
  ),
  _Message(
    sender: '',
    text: 'I just finished reading the documentation. The guidelines say to aim for under 500 tokens for the initial prompt phase.',
    time: '10:47 AM',
    isMine: true,
    isRead: true,
  ),
  _Message(
    sender: 'Sarah Jenkins',
    text: 'Thanks for the heads up! Are we still meeting at the Lab at 5 PM for the study session?',
    time: '10:48 AM',
    isMine: false,
  ),
  _Message(
    sender: '',
    text: '',
    time: '10:50 AM',
    isMine: false,
    type: _MsgType.image,
  ),
  _Message(
    sender: '',
    text: "Yes, just secured Room 302. It's empty now!",
    time: '10:52 AM',
    isMine: true,
    isRead: true,
  ),
];

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
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
              child: Icon(Icons.smart_toy_outlined, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AI Workshop Group', style: AppTextStyles.labelLg),
                Text('124 Members • 12 Online',
                    style: AppTextStyles.caption.copyWith(fontSize: 10)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              itemCount: _messages.length + 1, // +1 for date header
              itemBuilder: (context, i) {
                if (i == 0) return _dateChip('Today, October 24');
                final msg = _messages[i - 1];
                return _buildMessage(msg);
              },
            ),
          ),
          _inputBar(),
        ],
      ),
    );
  }

  Widget _buildMessage(_Message msg) {
    if (msg.type == _MsgType.image) return _imageMessage(msg);
    if (msg.type == _MsgType.file) return _fileMessage(msg);

    if (msg.isMine) {
      return Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Text(msg.text,
                  style: AppTextStyles.bodyMd.copyWith(color: Colors.white, fontSize: 14)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(msg.time, style: AppTextStyles.caption.copyWith(fontSize: 10)),
                  if (msg.isRead) ...[
                    const SizedBox(width: 4),
                    const Icon(Icons.done_all, size: 13, color: AppColors.secondary),
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
              padding: const EdgeInsets.only(left: 44, bottom: 3),
              child: Text(msg.sender,
                  style: AppTextStyles.caption.copyWith(
                      color: AppColors.secondary, fontWeight: FontWeight.w600)),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (msg.sender.isNotEmpty)
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFF1A2A4A),
                  child: Icon(Icons.person, size: 16, color: Colors.white),
                )
              else
                const SizedBox(width: 32),
              const SizedBox(width: 8),
              Container(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.68),
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Text(msg.text,
                    style: AppTextStyles.bodyMd.copyWith(
                        color: AppColors.textPrimary, fontSize: 14)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 44),
            child: Text(msg.time, style: AppTextStyles.caption.copyWith(fontSize: 10)),
          ),
        ],
      ),
    );
  }

  Widget _fileMessage(_Message msg) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 40, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
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
              child: const Icon(Icons.insert_drive_file_outlined,
                  color: AppColors.secondary, size: 22),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(msg.fileName ?? '', style: AppTextStyles.labelSm),
                const SizedBox(height: 2),
                Text(msg.fileSize ?? '',
                    style: AppTextStyles.caption.copyWith(fontSize: 10)),
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

  Widget _imageMessage(_Message msg) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 40, bottom: 10),
        width: 200,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          gradient: const LinearGradient(
            colors: [Color(0xFF0D1B2A), Color(0xFF1A2A4A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Icon(Icons.memory, size: 48, color: AppColors.secondary),
        ),
      ),
    );
  }

  Widget _dateChip(String label) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(AppTheme.radiusFull),
        ),
        child: Text(label,
            style: AppTextStyles.caption.copyWith(fontSize: 11)),
      ),
    );
  }

  Widget _inputBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 16),
      color: AppColors.background,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_outline, color: AppColors.textSecondary),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              style: AppTextStyles.bodyMd.copyWith(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Message group...',
                filled: true,
                fillColor: AppColors.surfaceContainer,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.emoji_emotions_outlined,
                      color: AppColors.textSecondary),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
