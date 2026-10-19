import '../database.dart';

class BoughtBooksTable extends SupabaseTable<BoughtBooksRow> {
  @override
  String get tableName => 'bought_books';

  @override
  BoughtBooksRow createRow(Map<String, dynamic> data) => BoughtBooksRow(data);
}

class BoughtBooksRow extends SupabaseDataRow {
  BoughtBooksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BoughtBooksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get bookId => getField<int>('book_id');
  set bookId(int? value) => setField<int>('book_id', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  double? get pricePaid => getField<double>('price_paid');
  set pricePaid(double? value) => setField<double>('price_paid', value);

  DateTime? get boughtAt => getField<DateTime>('bought_at');
  set boughtAt(DateTime? value) => setField<DateTime>('bought_at', value);
}
