import 'package:flutter/material.dart';
import 'package:start_flutter_weather/main.dart';
import 'package:start_flutter_weather/src/model/weather.dart';
import 'package:start_flutter_weather/src/widgets/value_tile.dart';
import 'package:intl/intl.dart';

class ForecastHorizontal extends StatelessWidget {
  const ForecastHorizontal({
    Key key,
    @required this.weathers,
  }) : super(key: key);

  final List<Weather> weathers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: this.weathers.length,
        separatorBuilder: (context, index) => Divider(
              height: 100,
              color: Colors.white,
            ),
        padding: EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          final item = this.weathers[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
                child: ValueTile(
              DateFormat('E, ha').format(
                  DateTime.fromMillisecondsSinceEpoch(item.time * 1000)),
              '${item.temperature.as(AppStateContainer.of(context).temperatureUnit).round()}°',
              iconData: item.getIconData(),
            )),
          );
        },
      ),
    );
  }
}
