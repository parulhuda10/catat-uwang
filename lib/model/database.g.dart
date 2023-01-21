// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 40),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _creatingMeta =
      const VerificationMeta('creating');
  @override
  late final GeneratedColumn<DateTime> creating = GeneratedColumn<DateTime>(
      'creating', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatingMeta =
      const VerificationMeta('updating');
  @override
  late final GeneratedColumn<DateTime> updating = GeneratedColumn<DateTime>(
      'updating', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletingMeta =
      const VerificationMeta('deleting');
  @override
  late final GeneratedColumn<DateTime> deleting = GeneratedColumn<DateTime>(
      'deleting', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, creating, updating, deleting];
  @override
  String get aliasedName => _alias ?? 'categories';
  @override
  String get actualTableName => 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('creating')) {
      context.handle(_creatingMeta,
          creating.isAcceptableOrUnknown(data['creating']!, _creatingMeta));
    } else if (isInserting) {
      context.missing(_creatingMeta);
    }
    if (data.containsKey('updating')) {
      context.handle(_updatingMeta,
          updating.isAcceptableOrUnknown(data['updating']!, _updatingMeta));
    } else if (isInserting) {
      context.missing(_updatingMeta);
    }
    if (data.containsKey('deleting')) {
      context.handle(_deletingMeta,
          deleting.isAcceptableOrUnknown(data['deleting']!, _deletingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      creating: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}creating'])!,
      updating: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updating'])!,
      deleting: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleting']),
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final int type;
  final DateTime creating;
  final DateTime updating;
  final DateTime? deleting;
  const Category(
      {required this.id,
      required this.name,
      required this.type,
      required this.creating,
      required this.updating,
      this.deleting});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<int>(type);
    map['creating'] = Variable<DateTime>(creating);
    map['updating'] = Variable<DateTime>(updating);
    if (!nullToAbsent || deleting != null) {
      map['deleting'] = Variable<DateTime>(deleting);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      creating: Value(creating),
      updating: Value(updating),
      deleting: deleting == null && nullToAbsent
          ? const Value.absent()
          : Value(deleting),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<int>(json['type']),
      creating: serializer.fromJson<DateTime>(json['creating']),
      updating: serializer.fromJson<DateTime>(json['updating']),
      deleting: serializer.fromJson<DateTime?>(json['deleting']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<int>(type),
      'creating': serializer.toJson<DateTime>(creating),
      'updating': serializer.toJson<DateTime>(updating),
      'deleting': serializer.toJson<DateTime?>(deleting),
    };
  }

  Category copyWith(
          {int? id,
          String? name,
          int? type,
          DateTime? creating,
          DateTime? updating,
          Value<DateTime?> deleting = const Value.absent()}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        creating: creating ?? this.creating,
        updating: updating ?? this.updating,
        deleting: deleting.present ? deleting.value : this.deleting,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('creating: $creating, ')
          ..write('updating: $updating, ')
          ..write('deleting: $deleting')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, creating, updating, deleting);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.creating == this.creating &&
          other.updating == this.updating &&
          other.deleting == this.deleting);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> type;
  final Value<DateTime> creating;
  final Value<DateTime> updating;
  final Value<DateTime?> deleting;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.creating = const Value.absent(),
    this.updating = const Value.absent(),
    this.deleting = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int type,
    required DateTime creating,
    required DateTime updating,
    this.deleting = const Value.absent(),
  })  : name = Value(name),
        type = Value(type),
        creating = Value(creating),
        updating = Value(updating);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? type,
    Expression<DateTime>? creating,
    Expression<DateTime>? updating,
    Expression<DateTime>? deleting,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (creating != null) 'creating': creating,
      if (updating != null) 'updating': updating,
      if (deleting != null) 'deleting': deleting,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? type,
      Value<DateTime>? creating,
      Value<DateTime>? updating,
      Value<DateTime?>? deleting}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      creating: creating ?? this.creating,
      updating: updating ?? this.updating,
      deleting: deleting ?? this.deleting,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (creating.present) {
      map['creating'] = Variable<DateTime>(creating.value);
    }
    if (updating.present) {
      map['updating'] = Variable<DateTime>(updating.value);
    }
    if (deleting.present) {
      map['deleting'] = Variable<DateTime>(deleting.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('creating: $creating, ')
          ..write('updating: $updating, ')
          ..write('deleting: $deleting')
          ..write(')'))
        .toString();
  }
}

class $TransactionTable extends Transaction
    with TableInfo<$TransactionTable, Trans> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 40),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryidMeta =
      const VerificationMeta('categoryid');
  @override
  late final GeneratedColumn<int> categoryid = GeneratedColumn<int>(
      'categoryid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _transactiondateMeta =
      const VerificationMeta('transactiondate');
  @override
  late final GeneratedColumn<DateTime> transactiondate =
      GeneratedColumn<DateTime>('transactiondate', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _creatingMeta =
      const VerificationMeta('creating');
  @override
  late final GeneratedColumn<DateTime> creating = GeneratedColumn<DateTime>(
      'creating', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatingMeta =
      const VerificationMeta('updating');
  @override
  late final GeneratedColumn<DateTime> updating = GeneratedColumn<DateTime>(
      'updating', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletingMeta =
      const VerificationMeta('deleting');
  @override
  late final GeneratedColumn<DateTime> deleting = GeneratedColumn<DateTime>(
      'deleting', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        categoryid,
        transactiondate,
        amount,
        creating,
        updating,
        deleting
      ];
  @override
  String get aliasedName => _alias ?? 'transaction';
  @override
  String get actualTableName => 'transaction';
  @override
  VerificationContext validateIntegrity(Insertable<Trans> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('categoryid')) {
      context.handle(
          _categoryidMeta,
          categoryid.isAcceptableOrUnknown(
              data['categoryid']!, _categoryidMeta));
    } else if (isInserting) {
      context.missing(_categoryidMeta);
    }
    if (data.containsKey('transactiondate')) {
      context.handle(
          _transactiondateMeta,
          transactiondate.isAcceptableOrUnknown(
              data['transactiondate']!, _transactiondateMeta));
    } else if (isInserting) {
      context.missing(_transactiondateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('creating')) {
      context.handle(_creatingMeta,
          creating.isAcceptableOrUnknown(data['creating']!, _creatingMeta));
    } else if (isInserting) {
      context.missing(_creatingMeta);
    }
    if (data.containsKey('updating')) {
      context.handle(_updatingMeta,
          updating.isAcceptableOrUnknown(data['updating']!, _updatingMeta));
    } else if (isInserting) {
      context.missing(_updatingMeta);
    }
    if (data.containsKey('deleting')) {
      context.handle(_deletingMeta,
          deleting.isAcceptableOrUnknown(data['deleting']!, _deletingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Trans map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trans(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      categoryid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}categoryid'])!,
      transactiondate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}transactiondate'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      creating: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}creating'])!,
      updating: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updating'])!,
      deleting: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleting']),
    );
  }

  @override
  $TransactionTable createAlias(String alias) {
    return $TransactionTable(attachedDatabase, alias);
  }
}

class Trans extends DataClass implements Insertable<Trans> {
  final int id;
  final String name;
  final int categoryid;
  final DateTime transactiondate;
  final int amount;
  final DateTime creating;
  final DateTime updating;
  final DateTime? deleting;
  const Trans(
      {required this.id,
      required this.name,
      required this.categoryid,
      required this.transactiondate,
      required this.amount,
      required this.creating,
      required this.updating,
      this.deleting});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['categoryid'] = Variable<int>(categoryid);
    map['transactiondate'] = Variable<DateTime>(transactiondate);
    map['amount'] = Variable<int>(amount);
    map['creating'] = Variable<DateTime>(creating);
    map['updating'] = Variable<DateTime>(updating);
    if (!nullToAbsent || deleting != null) {
      map['deleting'] = Variable<DateTime>(deleting);
    }
    return map;
  }

  TransactionCompanion toCompanion(bool nullToAbsent) {
    return TransactionCompanion(
      id: Value(id),
      name: Value(name),
      categoryid: Value(categoryid),
      transactiondate: Value(transactiondate),
      amount: Value(amount),
      creating: Value(creating),
      updating: Value(updating),
      deleting: deleting == null && nullToAbsent
          ? const Value.absent()
          : Value(deleting),
    );
  }

  factory Trans.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trans(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      categoryid: serializer.fromJson<int>(json['categoryid']),
      transactiondate: serializer.fromJson<DateTime>(json['transactiondate']),
      amount: serializer.fromJson<int>(json['amount']),
      creating: serializer.fromJson<DateTime>(json['creating']),
      updating: serializer.fromJson<DateTime>(json['updating']),
      deleting: serializer.fromJson<DateTime?>(json['deleting']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'categoryid': serializer.toJson<int>(categoryid),
      'transactiondate': serializer.toJson<DateTime>(transactiondate),
      'amount': serializer.toJson<int>(amount),
      'creating': serializer.toJson<DateTime>(creating),
      'updating': serializer.toJson<DateTime>(updating),
      'deleting': serializer.toJson<DateTime?>(deleting),
    };
  }

  Trans copyWith(
          {int? id,
          String? name,
          int? categoryid,
          DateTime? transactiondate,
          int? amount,
          DateTime? creating,
          DateTime? updating,
          Value<DateTime?> deleting = const Value.absent()}) =>
      Trans(
        id: id ?? this.id,
        name: name ?? this.name,
        categoryid: categoryid ?? this.categoryid,
        transactiondate: transactiondate ?? this.transactiondate,
        amount: amount ?? this.amount,
        creating: creating ?? this.creating,
        updating: updating ?? this.updating,
        deleting: deleting.present ? deleting.value : this.deleting,
      );
  @override
  String toString() {
    return (StringBuffer('Trans(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryid: $categoryid, ')
          ..write('transactiondate: $transactiondate, ')
          ..write('amount: $amount, ')
          ..write('creating: $creating, ')
          ..write('updating: $updating, ')
          ..write('deleting: $deleting')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, categoryid, transactiondate, amount,
      creating, updating, deleting);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trans &&
          other.id == this.id &&
          other.name == this.name &&
          other.categoryid == this.categoryid &&
          other.transactiondate == this.transactiondate &&
          other.amount == this.amount &&
          other.creating == this.creating &&
          other.updating == this.updating &&
          other.deleting == this.deleting);
}

class TransactionCompanion extends UpdateCompanion<Trans> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> categoryid;
  final Value<DateTime> transactiondate;
  final Value<int> amount;
  final Value<DateTime> creating;
  final Value<DateTime> updating;
  final Value<DateTime?> deleting;
  const TransactionCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.categoryid = const Value.absent(),
    this.transactiondate = const Value.absent(),
    this.amount = const Value.absent(),
    this.creating = const Value.absent(),
    this.updating = const Value.absent(),
    this.deleting = const Value.absent(),
  });
  TransactionCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int categoryid,
    required DateTime transactiondate,
    required int amount,
    required DateTime creating,
    required DateTime updating,
    this.deleting = const Value.absent(),
  })  : name = Value(name),
        categoryid = Value(categoryid),
        transactiondate = Value(transactiondate),
        amount = Value(amount),
        creating = Value(creating),
        updating = Value(updating);
  static Insertable<Trans> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? categoryid,
    Expression<DateTime>? transactiondate,
    Expression<int>? amount,
    Expression<DateTime>? creating,
    Expression<DateTime>? updating,
    Expression<DateTime>? deleting,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (categoryid != null) 'categoryid': categoryid,
      if (transactiondate != null) 'transactiondate': transactiondate,
      if (amount != null) 'amount': amount,
      if (creating != null) 'creating': creating,
      if (updating != null) 'updating': updating,
      if (deleting != null) 'deleting': deleting,
    });
  }

  TransactionCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? categoryid,
      Value<DateTime>? transactiondate,
      Value<int>? amount,
      Value<DateTime>? creating,
      Value<DateTime>? updating,
      Value<DateTime?>? deleting}) {
    return TransactionCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryid: categoryid ?? this.categoryid,
      transactiondate: transactiondate ?? this.transactiondate,
      amount: amount ?? this.amount,
      creating: creating ?? this.creating,
      updating: updating ?? this.updating,
      deleting: deleting ?? this.deleting,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (categoryid.present) {
      map['categoryid'] = Variable<int>(categoryid.value);
    }
    if (transactiondate.present) {
      map['transactiondate'] = Variable<DateTime>(transactiondate.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (creating.present) {
      map['creating'] = Variable<DateTime>(creating.value);
    }
    if (updating.present) {
      map['updating'] = Variable<DateTime>(updating.value);
    }
    if (deleting.present) {
      map['deleting'] = Variable<DateTime>(deleting.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('categoryid: $categoryid, ')
          ..write('transactiondate: $transactiondate, ')
          ..write('amount: $amount, ')
          ..write('creating: $creating, ')
          ..write('updating: $updating, ')
          ..write('deleting: $deleting')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $TransactionTable transactions = $TransactionTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [categories, transactions];
}
