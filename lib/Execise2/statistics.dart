import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color_counters.dart';
class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<ColorCounters>(
      builder: (context, counters, child) {
        final redTaps = counters.redTapCount;
        final blueTaps = counters.blueTapCount;

        return SizedBox(
          width: double.infinity,
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Red Taps: $redTaps', style: const TextStyle(fontSize: 24)),
              Text('Blue Taps: $blueTaps', style: const TextStyle(fontSize: 24)),
            ],
          ),
        );
      },
    );
  }
}
