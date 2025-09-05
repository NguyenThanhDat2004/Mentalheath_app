import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _selectedChipIndex = 0;
  final List<String> _chipLabels = [
    'Trending',
    'Relationship',
    'Self Care',
    'Mental Health',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          children: [
            // Phần 1: Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _buildHeader(),
            ),
            const SizedBox(height: 20),

            // Phần 2: Tiêu đề "Wellness Hub"
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Wellness Hub',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Phần 3: Các chip lọc
            _buildFilterChips(),
            const SizedBox(height: 20),

            // Phần 4: Danh sách các bài đăng
            _buildPostCard(
              avatarUrl: 'https://i.pravatar.cc/150?img=5',
              name: 'Coal Dingo',
              time: 'just now',
              content:
                  'Is there a therapy which can cure crossdressing & bdsm compulsion?',
              likes: 2,
              comments: 0,
            ),
            _buildPostCard(
              avatarUrl: 'https://i.pravatar.cc/150?img=6',
              name: 'Pigeon Car',
              time: '3 hrs ago',
              content:
                  'Is there a therapy which can cure crossdressing & bdsm compulsion?',
              likes: 12,
              comments: 2,
            ),
            _buildPostCard(
              avatarUrl: 'https://i.pravatar.cc/150?img=7',
              name: 'Pigeon Car',
              time: '1 hr ago',
              content:
                  'Is there a therapy which can cure crossdressing & bdsm compulsion?',
              likes: 12,
              comments: 2,
            ),
            _buildPostCard(
              avatarUrl: 'https://i.pravatar.cc/150?img=8',
              name: 'Pigeon Car',
              time: '2 min ago',
              content:
                  'Is there a therapy which can cure crossdressing & bdsm compulsion?',
              likes: 12,
              comments: 2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF5DB075), // Màu xanh lá
        shape: const CircleBorder(),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=32'),
        ),
        Stack(
          alignment: Alignment.topRight,
          children: [
            const Icon(Icons.notifications_none, size: 30, color: Colors.grey),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _chipLabels.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ChoiceChip(
              label: Text(_chipLabels[index]),
              selected: _selectedChipIndex == index,
              onSelected: (bool selected) {
                setState(() {
                  _selectedChipIndex = selected ? index : -1;
                });
              },
              backgroundColor: Colors.grey.shade200,
              selectedColor: const Color(0xFF5DB075), // Màu xanh lá
              labelStyle: TextStyle(
                color: _selectedChipIndex == index
                    ? Colors.white
                    : Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              showCheckmark: false,
              padding: const EdgeInsets.symmetric(horizontal: 15),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPostCard({
    required String avatarUrl,
    required String name,
    required String time,
    required String content,
    required int likes,
    required int comments,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 10),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text('  •  ', style: TextStyle(color: Colors.grey)),
              Text(time, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 15),
          Text(content, style: const TextStyle(fontSize: 16, height: 1.4)),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(
                Icons.thumb_up_alt_outlined,
                color: Colors.grey.shade600,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text('$likes', style: TextStyle(color: Colors.grey.shade600)),
              const SizedBox(width: 20),
              Icon(
                Icons.chat_bubble_outline,
                color: Colors.grey.shade600,
                size: 20,
              ),
              const SizedBox(width: 5),
              Text('$comments', style: TextStyle(color: Colors.grey.shade600)),
              const Spacer(),
              Icon(Icons.share_outlined, color: Colors.grey.shade600, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
