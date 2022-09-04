import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:gymna/features/employee/presentation/manager/bloc/employee_bloc.dart';
import 'package:gymna/features/home/presentation/pages/home.dart';
import 'package:gymna/features/manage_memberships/presentation/manager/bloc/membership_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/app_theme.dart';
import 'features/employee/data/local/table/employee_table.dart';
import 'features/manage_memberships/data/local/tables/memberships_table.dart';
import 'injection_container.dart' as di;
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MembershipsTableAdapter());
  Hive.registerAdapter(EmployeeTebleAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<MembershipBloc>()..add(GetMembershipsEvent())),
        BlocProvider(
            create: (_) => di.sl<EmployeeBloc>()..add(GetAllEmployeesEvent()))
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: appTheme,
        home: const Home(),
      ),
    );
  }
}
