import 'package:drift/drift.dart';

@DataClassName("Category")
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 40)();
  IntColumn get type => integer()();
  DateTimeColumn get creating => dateTime()();
  DateTimeColumn get updating => dateTime()();
  DateTimeColumn get deleting => dateTime().nullable()();
}
