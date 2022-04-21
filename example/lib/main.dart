import 'package:easy_dashboard/easy_dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashBoard(),
    );
  }
}

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);
  late final EasyAppController controller = EasyAppController(
    intialBody: EasyBody(child: tile1.body, title: tile1.title),
  );

  @override
  Widget build(BuildContext context) {
    return EasyDashboard(
      controller: controller,
      navigationIcon: const Icon(Icons.menu, color: Colors.white),
      appBarActions: actions,
      centerTitle: true,
      appBarColor: Colors.teal,
      sideBarColor: Colors.grey.shade100,
      tabletView: const TabletView(
        fullAppBar: true,
        border: BorderSide(width: 0.5, color: Colors.grey),
      ),
      desktopView: const DesktopView(
        fullAppBar: true,
        border: BorderSide(width: 0.5, color: Colors.grey),
      ),
      drawer: (Size size, Widget? child) {
        return EasyDrawer(
          iconColor: Colors.teal,
          hoverColor: Colors.grey.shade300,
          tileColor: Colors.grey.shade100,
          selectedColor: Colors.black.withGreen(80),
          selectedIconColor: Colors.white,
          textColor: Colors.black.withGreen(20),
          selectedTileColor: Colors.teal.shade400.withOpacity(.8),
          tiles: tiles,
          topWidget: SideBox(
            scrollable: true,
            height: 150,
            child: topOpenWidget,
          ),
          bottomWidget: SideBox(
            scrollable: false,
            height: 50,
            child: bottomOpenWidget,
          ),
          bottomSmallWidget: SideBox(
            height: 50,
            child: bottomSmallWidget,
          ),
          topSmallWidget: SideBox(
            height: 50,
            child: topSmallWidget,
          ),
          size: size,
          onTileTapped: (body) {
            controller.switchBody(body);
          },
        );
      },
    );
  }
}


 final List<Widget> actions = [
    IconButton(
      icon: const Icon(Icons.search, color: Colors.white),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(Icons.more_vert, color: Colors.white),
      onPressed: () {},
    ),
  ];

  var topOpenWidget = Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color.fromARGB(255, 23, 92, 85),
    ),
    child: const Center(
      child: Text(
        'LM',
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
        ),
      ),
    ),
  );

  var bottomOpenWidget = Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: const [
        Text('dashboard'),
        Spacer(),
        Text('© 2022'),
        Spacer(),
      ],
    ),
  );

  var bottomSmallWidget = const Center(
    child: Text('© 2022'),
  );

  var topSmallWidget = Container(
    decoration: const BoxDecoration(
      color: Colors.teal,
      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.person,
        color: Colors.white,
      ),
    ),
  );

final SideBarTile tile1 = SideBarTile(
  title: const Text(
    'Home',
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  ),
  icon: Icons.home,
  body: const Center(
    child: Icon(
      Icons.home,
      size: 280,
    ),
  ),
  name: 'Home',
);

late final List<SideTile> tiles = [
  tile1,
  SideBarTile(
    title: const Text(
      'Profile',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    icon: Icons.person,
    body: const Center(
      child: Icon(
        Icons.person,
        size: 280,
      ),
    ),
    name: 'Profile',
  ),
  SideBarTile(
    title: const Text(
      'News',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    icon: Icons.chrome_reader_mode_outlined,
    body: const Center(
      child: Icon(
        Icons.chrome_reader_mode_outlined,
        size: 280,
      ),
    ),
    name: 'News paper',
  ),
  SideBarTile(
    title: const Text(
      'Hotel Room',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    icon: Icons.hotel,
    body: const Center(
      child: Icon(
        Icons.hotel,
        size: 280,
      ),
    ),
    name: 'Hotel',
  ),
  SideBarTile(
    title: const Text(
      'Water Surface',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    icon: Icons.water,
    body: const Center(
      child: Icon(
        Icons.water,
        size: 280,
      ),
    ),
    name: 'Water',
  ),
  SideBarTile(
    title: const Text(
      'Networking',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    icon: Icons.track_changes,
    body: const Center(
      child: Icon(
        Icons.track_changes,
        size: 280,
      ),
    ),
    name: 'Network',
  ),
];
