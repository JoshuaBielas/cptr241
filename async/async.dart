import 'dart:async';

Future<List<double>> fetchTemperatures () async {
    await Future.delayed(Duration(seconds: 2));
    // return [25.0, -3.5, 100,0, 0.0, 37.2, -273.15, -300.0, 1000.0, 58.7, -999.9];
    return [25.0, 3.5, -45.0, 59.3, 0.1, -49.2, 50.3, 2.3];
}

Future<List<double>> validateTemperatures(List<double> readings) async {
  await Future.delayed(Duration(seconds: 1));
  var invalid = 0;
  List<double> validReadings = [];
  readings.forEach((reading) {
    if (reading < -80 || reading > 60) {
      invalid += 1;
    }
    else {
      validReadings.add(reading);
    }
  });
  if (invalid > 2) {
    throw Exception('2 invalid readings found');
  }
  else {
    return validReadings;
  }
}

// I got help from ChatGPT for this function
Stream<double> temperatureStream(List<double> readings) {
  final streamController = StreamController<double>();
  
  () async {
  for (final reading in readings) {
    await Future.delayed(Duration(milliseconds: 500));
    streamController.add(reading);
  }
  await streamController.close();
}();

  return streamController.stream;
}

void main () async{
  print("Fetching data...");
  List<double> temperatures = await fetchTemperatures();
  print("Data Received.");
  print(temperatures);

  try {
    print("Validating...");
    await validateTemperatures(temperatures);
  } catch (e) {
    print(e);
  } finally {
    print("Validation step complete.");
  }

  // I used ChatGPT to figure out how to print from a stream.
  var totalTemperature = 0.0;
  var number = 0.0;
  temperatureStream(temperatures).listen((temperature) {
    totalTemperature += temperature;
    number += 1.0;
    print(" 📡 Reading: $temperature°C  |  Avg: ${(totalTemperature/number).toStringAsFixed(2)}°C");
  });
}