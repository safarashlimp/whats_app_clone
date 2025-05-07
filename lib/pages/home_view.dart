import 'package:flutter/material.dart';
import 'package:whats_app_page/common/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController textcontroller = TextEditingController();
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // TextField with search icon and hint text
              TextField(
                controller: textcontroller,
                decoration: InputDecoration(
                  hintText: 'Search...',
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
                    _buildcategories('Unread'),
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
                ),),
            
    
      
              
            ],
          ),
        ),
      ),
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
