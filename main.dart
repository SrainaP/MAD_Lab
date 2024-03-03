import 'package:flutter/material.dart';

void main() {
  runApp(AlarmClockApp());
}

class AlarmClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlarmClockPage(),
    );
  }
}

class AlarmClockPage extends StatefulWidget {
  @override
  _AlarmClockPageState createState() => _AlarmClockPageState();
}

class _AlarmClockPageState extends State<AlarmClockPage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    AlarmPage(),
    StopwatchPage(),
    TimerPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarm Clock'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later),
            label: 'Timer',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Alarm Added!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AlarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Alarm Clock Page',
        style: TextStyle(color: Colors.blue, fontSize: 24),
      ),
    );
  }
}

class StopwatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Stopwatch Page',
        style: TextStyle(color: Colors.green, fontSize: 24),
      ),
    );
  }
}

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Timer Page',
        style: TextStyle(color: Colors.red, fontSize: 24),
      ),
    );
  }
}
