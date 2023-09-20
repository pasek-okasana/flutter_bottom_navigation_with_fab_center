import 'package:flutter/material.dart';

import 'page/page1.dart';
import 'page/page2.dart';
import 'page/page3.dart';
import 'page/page4.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  Widget currentPage = const Page1();
  final List<Widget> page = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  // --------------- Function ----------------
  void _currentData(int position) {
    currentTab = position;
    currentPage = page[position];
  }

  Color _currentPageColor(int position) {
    return currentTab == position
        ? const Color(0xff38AAFD)
        : const Color(0xffffffff);
  }

  // --------------- Split Widget ----------------
  Widget _itemNav(
      {required int index, required String title, required IconData icons}) {
    return MaterialButton(
      minWidth: 50,
      onPressed: () {
        setState(() {
          _currentData(index);
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icons,
              color: _currentPageColor(index),
            ),
            Text(
              title,
              style: TextStyle(color: _currentPageColor(index)),
            )
          ],
        ),
      ),
    );
  }

  // --------------- Build Widget ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentPage),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black87,
        foregroundColor: Colors.blue,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _itemNav(
              index: 0,
              title: 'Page 1',
              icons: Icons.home,
            ),
            _itemNav(
              index: 1,
              title: 'Page 2',
              icons: Icons.home,
            ),
            // => FOR SPACE WITH FAB BUTTON
            const SizedBox(height: 30),
            const SizedBox(height: 30),
            _itemNav(
              index: 2,
              title: 'Page 3',
              icons: Icons.home,
            ),
            _itemNav(
              index: 3,
              title: 'Page 4',
              icons: Icons.home,
            ),
          ],
        ),
      ),
    );
  }
}
