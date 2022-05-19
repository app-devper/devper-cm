import 'package:logging/logging.dart';

final log = Logger('Common');

void logger(Object? message) {
  log.info(message);
}
