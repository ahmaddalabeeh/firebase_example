import 'package:flutter_application_1/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../providers/theme_provider.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider.value(value: ThemeProvider()),
  ChangeNotifierProvider.value(value: AuthProvider()),
];
