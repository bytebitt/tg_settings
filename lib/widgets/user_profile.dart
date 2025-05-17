import 'package:flutter/material.dart';

// основний віджет сторінки
class UserProfile extends StatelessWidget {
  final List<MenuRowData> firstMenuRow = [
    MenuRowData(icon: Icons.bookmark, text: 'Saved Messages'),
    MenuRowData(icon: Icons.call, text: 'Recent Calls'),
    MenuRowData(icon: Icons.computer, text: 'Devices'),
    MenuRowData(icon: Icons.folder, text: 'Chat Folders'),
  ];
  final List<MenuRowData> secondMmenuRow = [
    MenuRowData(icon: Icons.notifications, text: 'Notifications and Sounds'),
    MenuRowData(icon: Icons.privacy_tip, text: 'Privacy and Security'),
    MenuRowData(icon: Icons.memory, text: 'Data and Storage'),
    MenuRowData(icon: Icons.brush, text: 'Appearence'),
    MenuRowData(icon: Icons.language, text: 'Language'),
  ];

  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const _UserInfo(),
          const SizedBox(height: 30),
          _MenuWidget(menuRow: firstMenuRow),
          SizedBox(height: 20),
          _MenuWidget(menuRow: secondMmenuRow),
        ],
      ),
    );
  }
}

// простий класс який зберігає дві змінні
class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData({required this.icon, required this.text});
}

// частина - меню
class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;

  const _MenuWidget({super.key, required this.menuRow});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children:
            menuRow
                .map((item) => _MenuWidgetRow(icon: item.icon, text: item.text))
                .toList(),
      ),
    );
  }
}

// контекст меню
class _MenuWidgetRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MenuWidgetRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Expanded(child: Text(text, style: TextStyle(fontSize: 20))),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}

// інформація про користувача
class _UserInfo extends StatelessWidget {
  const _UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: const Column(
        children: [
          SizedBox(height: 30),
          _AvatarWidget(),
          SizedBox(height: 20),
          _UserNameWidget(),
          SizedBox(height: 10),
          _UserPhoneWidget(),
          SizedBox(height: 5),
          _UserNicknameWidget(),
        ],
      ),
    );
  }
}

class _UserNicknameWidget extends StatelessWidget {
  const _UserNicknameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "@bytebit1",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "+380 999 99 99",
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "bytebit",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade400,
        border: Border.all(color: Colors.grey.shade500, width: 3),
      ),
    );
  }
}
