import '../database.dart';

class BooksTable extends SupabaseTable<BooksRow> {
  @override
  String get tableName => 'books';

  @override
  BooksRow createRow(Map<String, dynamic> data) => BooksRow(data);
}

class BooksRow extends SupabaseDataRow {
  BooksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BooksTable();

  String get author => getField<String>('author')!;
  set author(String value) => setField<String>('author', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get coverUrl => getField<String>('cover_url');
  set coverUrl(String? value) => setField<String>('cover_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get isbn => getField<String>('isbn');
  set isbn(String? value) => setField<String>('isbn', value);

  int? get publishYear => getField<int>('publish_year');
  set publishYear(int? value) => setField<int>('publish_year', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);
}
