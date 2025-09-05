import 'package:flutter/material.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            // Phần 1: Header
            _buildHeader(),
            const SizedBox(height: 30),

            // Phần 2: Thẻ "Upcoming Session"
            _buildUpcomingSessionCard(),
            const SizedBox(height: 30),

            // Phần 3: Tiêu đề "All Sessions"
            _buildAllSessionsHeader(),
            const SizedBox(height: 20),

            // Phần 4: Danh sách các session
            _buildSessionCard(
              imageUrl: 'https://i.pravatar.cc/150?img=1',
              name: 'Sahana V',
              specialty: 'Msc in Clinical Psychology',
              date: '31st March ‘22',
              time: '7:30 PM - 8:30 PM',
              isCompleted: false,
            ),
            const SizedBox(height: 15),
            _buildSessionCard(
              imageUrl: 'https://i.pravatar.cc/150?img=2',
              name: 'Sahana V',
              specialty: 'Msc in Clinical Psychology',
              date: '31st March ‘22',
              time: '7:30 PM - 8:30 PM',
              isCompleted: true,
            ),
            const SizedBox(height: 15),
            // Thẻ bị che một phần
            Opacity(
              opacity: 0.5,
              child: _buildSessionCard(
                imageUrl: 'https://i.pravatar.cc/150?img=3',
                name: 'Sahana V',
                specialty: 'Msc in Clinical Psychology',
                date: '31st March ‘22',
                time: '7:30 PM - 8:30 PM',
                isCompleted: true,
              ),
            ),
          ],
        ),
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

  Widget _buildUpcomingSessionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9), // Đổi sang màu xanh lá nhạt
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withAlpha(26), // Đã sửa lỗi bằng withAlpha
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Session',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Sahana V. Msc in Clinical Psychology',
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
          SizedBox(height: 5),
          Text(
            '7:30 PM - 8:30 PM',
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Join Now',
                style: TextStyle(
                  color: Color(0xFF5DB075), // Đổi sang màu xanh lá
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.play_circle_fill,
                color: Color(0xFF5DB075), // Đổi sang màu xanh lá
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAllSessionsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Text(
              'All Sessions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        Icon(Icons.swap_vert, color: Colors.grey.shade600),
      ],
    );
  }

  Widget _buildSessionCard({
    required String imageUrl,
    required String name,
    required String specialty,
    required String date,
    required String time,
    required bool isCompleted,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isCompleted
            ? Colors.white
            : const Color(0xFFE8F5E9), // Đổi sang màu xanh lá nhạt
        borderRadius: BorderRadius.circular(20),
        border: isCompleted ? Border.all(color: Colors.grey.shade200) : null,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(radius: 25, backgroundImage: NetworkImage(imageUrl)),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    specialty,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(date, style: const TextStyle(color: Colors.black54)),
              const SizedBox(width: 20),
              const Icon(Icons.access_time, size: 16, color: Colors.grey),
              const SizedBox(width: 8),
              Text(time, style: const TextStyle(color: Colors.black54)),
            ],
          ),
          const SizedBox(height: 20),
          isCompleted ? _buildCompletedButtons() : _buildUpcomingButtons(),
        ],
      ),
    );
  }

  Widget _buildUpcomingButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5DB075), // Đổi sang màu xanh lá
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              'Reschedule',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Color(0xFF5DB075),
              ), // Đổi sang màu xanh lá
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              'Join Now',
              style: TextStyle(color: Color(0xFF5DB075), fontSize: 16),
            ), // Đổi sang màu xanh lá
          ),
        ),
      ],
    );
  }

  Widget _buildCompletedButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5DB075), // Đổi sang màu xanh lá
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              'Re-book',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Color(0xFF5DB075),
              ), // Đổi sang màu xanh lá
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              'View Profile',
              style: TextStyle(color: Color(0xFF5DB075), fontSize: 16),
            ), // Đổi sang màu xanh lá
          ),
        ),
      ],
    );
  }
}
