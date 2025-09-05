Giao diện Ứng dụng Sức khỏe Tinh thần bằng Flutter
Đây là một dự án Flutter mô phỏng lại giao diện người dùng (UI) cho một ứng dụng về sức khỏe tinh thần và ευεξία, dựa trên các thiết kế được cung cấp. Ứng dụng bao gồm nhiều màn hình được kết nối với nhau thông qua một thanh điều hướng chính.

✨ Tính năng
Điều hướng đa màn hình: Sử dụng BottomNavigationBar để chuyển đổi mượt mà giữa các màn hình chính.

Màn hình Home linh hoạt: Giao diện có thể thay đổi tùy theo trạng thái của người dùng (ví dụ: gói dịch vụ còn hạn hoặc đã hết hạn).

Màn hình Sessions: Liệt kê các buổi trị liệu sắp tới và đã hoàn thành với các hành động tương ứng.

Màn hình Community: Một không gian cộng đồng với các bài đăng, bộ lọc theo chủ đề và các tương tác xã hội.

Thiết kế đồng bộ: Toàn bộ ứng dụng sử dụng một tông màu xanh lá cây nhất quán, tạo cảm giác thư giãn và chuyên nghiệp.

📸 Ảnh chụp màn hình
<table>
<tr>
<td><img src="https://www.google.com/search?q=https://i.imgur.com/your-home-screen-image.png" alt="Màn hình Home" width="200"/></td>
<td><img src="https://www.google.com/search?q=https://i.imgur.com/your-sessions-screen-image.png" alt="Màn hình Sessions" width="200"/></td>
<td><img src="https://www.google.com/search?q=https://i.imgur.com/your-community-screen-image.png" alt="Màn hình Community" width="200"/></td>
</tr>
<tr>
<td align="center">Màn hình Home</td>
<td align="center">Màn hình Sessions</td>
<td align="center">Màn hình Community</td>
</tr>
</table>

(Lưu ý: Bạn cần thay thế các đường link ảnh chụp màn hình ở trên bằng ảnh thực tế của ứng dụng.)

🚀 Bắt đầu
Để chạy dự án này trên máy của bạn, hãy làm theo các bước sau:

Yêu cầu
Đã cài đặt Flutter SDK (phiên bản 3.0 trở lên).

Một trình soạn thảo code như VS Code hoặc Android Studio.

Một thiết bị Android/iOS hoặc máy ảo đã được cấu hình.

Cài đặt
Clone a repository này:

git clone [https://your-repository-url.git](https://github.com/NguyenThanhDat2004/Mentalheath_app.git)
cd mental-health-app

Cài đặt các gói phụ thuộc:

flutter pub get

Chạy ứng dụng:

flutter run

📂 Cấu trúc dự án
Dự án được tổ chức một cách đơn giản để dễ dàng bảo trì và mở rộng:

lib/
├── main.dart             # Điểm vào chính của ứng dụng, quản lý điều hướng
├── home_screen.dart      # Widget cho màn hình Home (tách ra từ main)
├── sessions_screen.dart  # Widget cho màn hình Sessions
└── community_screen.dart # Widget cho màn hình Community
