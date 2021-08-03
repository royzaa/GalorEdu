import 'package:gsheets/gsheets.dart';

import './secret_key.dart';
import '../models/article.dart';

class SheetApi {
  static const _spreedSheetId = SecretKey.spreedSheetId;
  static const _credential = SecretKey.credential;

  static final _gsheets = GSheets(_credential);
  static Worksheet? _sheetTest;

  static Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreedSheetId);
    _sheetTest = await _getWorkSheet(spreadsheet, sheetTitle: 'SheetTest');
  }

  static Future<Worksheet?> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String sheetTitle,
  }) async {
    try {
      return await spreadsheet.addWorksheet(sheetTitle);
    } catch (e) {
      return await spreadsheet.worksheetByTitle(sheetTitle);
    }
  }

  static Future<Article?> getRow(int index) async {
    if (_sheetTest == null) return null;
    final jsonData = await _sheetTest!.values.map.row(index);
    return jsonData == null ? null : Article.fromJson(jsonData);
  }

  static Future<Article?> getArticle() async {
    return await SheetApi.getRow(2);
  }
}
