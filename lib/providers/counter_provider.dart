
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/counter_model.dart';

final  selectedCounterProvider = StateProvider<Counter?>((ref) => null);

final clientCountersProvider = StateProvider<List<Counter>>((ref) => []);
