class User {
  final String name;
  final String message;
  final String time;
  final bool isPinned;
  final int unreadCount;
  User(
      {required this.name,
      required this.message,
      required this.time,
      required this.isPinned,
     this.unreadCount = 0});
}

class chat {
  static List<User> users= [
    User(
      name: "Project Team Updates",
      message: "You : Meeting scheduled for tomorrow",
      time: "5/2/31",
      isPinned: true,
      unreadCount: 3,
    ),
    User(
      name: "Safa Rashli (CEO)",
      message:
          "my dears, we are celebrating our 6th year success party in 12/ 11/ 2031 at paris ...",
      time: "6/2/31",
      isPinned: true,
      unreadCount: 0,

    ),
    User(
      name: "Mufiiiiiiiiii",
      message: "hlooooo",
      time: "2 min ago",
      isPinned: false,
      unreadCount: 2,

    ),
    User(
      name: "FAMILY GROUP",
      message: "Dad : Good evening",
      time: "4.30 PM",
      isPinned: false,
      unreadCount: 34,
    ),
  ];
}
