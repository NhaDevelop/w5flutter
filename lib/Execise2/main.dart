import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'package:untitled1/Execise2/statistics.dart';
import 'color_counters.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounters(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    ),
  );
}

enum CardType { red, blue }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;


  final List<Widget> _screens = [
    const Home(),
    const StatisticsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tap Counter App")),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorTap(
          type: CardType.red,
          onTap: () => context.read<ColorCounters>().incrementRed(),
        ),
        ColorTap(
          type: CardType.blue,
          onTap: () => context.read<ColorCounters>().incrementBlue(),
        ),
      ],
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.type,
    required this.onTap,
  });

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {

    return Consumer<ColorCounters>(
      builder: (context, counters, child) {
        final tapCount = type == CardType.red
            ? counters.redTapCount
            : counters.blueTapCount;

        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                'Taps: $tapCount', // Display the tap count
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
