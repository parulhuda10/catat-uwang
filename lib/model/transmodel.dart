import 'package:drift/drift.dart';

@DataClassName("Trans")
class Transaction extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 40)();
  IntColumn get categoryid => integer()();
  DateTimeColumn get transactiondate => dateTime()();
  IntColumn get amount => integer()();

  DateTimeColumn get creating => dateTime()();
  DateTimeColumn get updating => dateTime()();
  DateTimeColumn get deleting => dateTime().nullable()();
}
