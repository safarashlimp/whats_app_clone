import 'package:flutter/material.dart';
import 'package:whats_app_page/common/colors.dart';
import 'package:whats_app_page/dummydata/chat.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController textcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: IColors.black,
          title: const Row(
            children: [
              Text(
                "Whats App",
                style: TextStyle(
                  color: IColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
            ],
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    color: IColors.white,
                  ),
                  onPressed: () {
                    print('Scanner pressed');
                  },
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: IColors.white,
                  ),
                  onPressed: () {
                    print('Camera pressed');
                  },
                ),
                const SizedBox(width: 16.0),
                PopupMenuButton<String>(
                  color: IColors.black,
                  onSelected: (value) {
                    print('Menu selected: $value');
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'New group',
                        child: Text(
                          'New group',
                          style: TextStyle(color: IColors.white, fontSize: 10),
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'New broadcast',
                        child: Text('New broadcast',
                            style:
                                TextStyle(color: IColors.white, fontSize: 10)),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Linked devices',
                        child: Text('Linked devices',
                            style:
                                TextStyle(color: IColors.white, fontSize: 10)),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Starred messages',
                        child: Text('Starred messages',
                            style:
                                TextStyle(color: IColors.white, fontSize: 10)),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Payments',
                        child: Text('Payments',
                            style:
                                TextStyle(color: IColors.white, fontSize: 10)),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Settings',
                        child: Text('Settings',
                            style:
                                TextStyle(color: IColors.white, fontSize: 10)),
                      ),
                    ];
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: IColors.white,
                  ),
                )
              ],
            )
          ],
        ),
        body: Column(
          children: [
            // TextField with search icon and hint text
            TextField(
              controller: textcontroller,
              decoration: InputDecoration(
                hintText: 'Search...',hintStyle: TextStyle(color: IColors.grey),
                prefixIcon: const Icon(
                    Icons.search), // Search icon inside the TextField
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
        
            const SizedBox(
              height: 15,
            ),
        
            SingleChildScrollView(
              child: Row(
                children: [
                  _buildcategories('All', isSelected: true, isGreen: true),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildcategories('Unread',isSelected: false,isGreen: false),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildcategories('favourites'),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildcategories('Groups +32'),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildcategories('+'),
                ],
              ),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
                child: const Icon(
                  Icons.archive,
                  size: 20,
                ),
              ),
              title: const Text(
                "Archived",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const Divider(
              height: 1,color: Colors.transparent,
            ),
            Expanded(child: ListView.builder(itemCount: chat.users.length,itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.green[700],
                      child: index == 0
                          ? const Icon(Icons.group, color: Colors.white70)
                          : null,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            chat.users[index].name,
                            overflow: TextOverflow.ellipsis,
                            style:
                                const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          chat.users[index].time,
                          style: const TextStyle(
                              fontSize: 12, color: IColors.grey),
                        )
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        if (index < 2)
                          const Text(
                            " ",
                            style: TextStyle(color: IColors.grey),
                          ),
                        Expanded(
                            child: Text(
                          chat.users[index].message,
                          style: TextStyle(color: IColors.grey),
                          overflow: TextOverflow.ellipsis,
                        )),
                        if (chat.users[index].isPinned)
                          const RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              Icons.push_pin,
                              size: 16,
                              color: IColors.grey,
                            ),
                          ),
                   if(chat.users[index].unreadCount>0)
                   Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(color: Color(0xFF00A884),
                    shape: BoxShape.circle),
                    child: Text("${chat.users[index].unreadCount}",style: const TextStyle(fontSize: 12,color:IColors.white),),
                   )
                      ],
                    ),

                    
                  ),
                
                  const Divider(height: 1, indent: 80,color: Colors.transparent,),
                ],
              );
            })),
                       Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[800]!, width: 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(Icons.chat, "Chats", true, hasNotification: true),
                    _buildNavItem(Icons.circle_outlined, "Updates", false, hasUpdateDot: true),
                    _buildNavItem(Icons.people, "Communities", false),
                    _buildNavItem(Icons.call, "Calls", false),
                  ],
                ),
              ),
            ),
          ],
        ),
    ));
     
  }


   
  

  Widget _buildNavItem(IconData icon, String label, bool isActive, {bool hasNotification = false, bool hasUpdateDot = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : Colors.grey,
            ),
            if (hasNotification)
              Positioned(
                right: -5,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Color(0xFF00A884),
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: const Text(
                    "39",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            if (hasUpdateDot)
              Positioned(
                right: 0,
                top: 0,
                child: Stack(children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF00A884),
                      shape: BoxShape.circle,
                    ),
                  ),]
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.white : Colors.grey,
          ),
        ),
      ],
    );
  }



  Widget _buildcategories(String data,
      {bool isSelected = false, bool isGreen = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
          color: isSelected
              ? (isGreen
                  ? IColors.black
                  : const Color.fromARGB(255, 74, 72, 72))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        data,
        style: TextStyle(color: isSelected ? IColors.lightGreen : IColors.grey),
      ),

    );

  }
}
