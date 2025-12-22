import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// Tables
class Orders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get serverId => integer().nullable()();
  TextColumn get tempId => text().nullable()();
  IntColumn get tableId => integer().nullable()();
  IntColumn get orderTypeId => integer()();
  IntColumn get waiterId => integer().nullable()();
  TextColumn get orderNumber => text()();
  TextColumn get status => text()();
  RealColumn get total => real()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}

class OrderItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get orderId => integer()();
  IntColumn get menuItemId => integer()();
  IntColumn get quantity => integer()();
  RealColumn get price => real()();
  RealColumn get amount => real()();
  TextColumn get note => text().nullable()();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}

class Kots extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get serverId => integer().nullable()();
  TextColumn get tempId => text().nullable()();
  IntColumn get orderId => integer()();
  IntColumn get kotNumber => integer()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}

class Payments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get serverId => integer().nullable()();
  TextColumn get tempId => text().nullable()();
  IntColumn get orderId => integer()();
  TextColumn get paymentMethod => text()();
  RealColumn get amount => real()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}

class MenuItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get serverId => integer()();
  TextColumn get name => text()();
  RealColumn get price => real()();
  IntColumn get categoryId => integer().nullable()();
  BoolColumn get isAvailable => boolean()();
  DateTimeColumn get lastSynced => dateTime()();
}

class RestaurantTables extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get serverId => integer()();
  TextColumn get tableCode => text()();
  IntColumn get areaId => integer().nullable()();
  IntColumn get capacity => integer()();
  DateTimeColumn get lastSynced => dateTime()();
}

@DriftDatabase(tables: [Orders, OrderItems, Kots, Payments, MenuItems, RestaurantTables])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle migrations
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'restaurant.db'));
    return NativeDatabase(file);
  });
}
