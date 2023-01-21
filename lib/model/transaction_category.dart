import 'package:flutter_uwang/model/database.dart';
import 'package:flutter_uwang/model/transmodel.dart';

class TransactionWithCategory {
  final Transaction transaction;
  final Category category;
  TransactionWithCategory(this.transaction, this.category);
}
