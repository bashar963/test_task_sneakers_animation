import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/di/configure_dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
)
void configureDependencies() => getIt.init();
