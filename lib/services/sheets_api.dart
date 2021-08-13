import 'package:gsheets/gsheets.dart';

import './secret_key.dart';
import '../models/article.dart';

class SheetApi {
  static const _spreedSheetId = SecretKey.spreedSheetId;
  static const _credential = SecretKey.credential;

  static final _gsheets = GSheets(_credential);
  static Worksheet? _response;

  static Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreedSheetId);
    _response = await _getWorkSheet(spreadsheet, sheetTitle: 'responses');
  }

  static Future<Worksheet?> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String sheetTitle,
  }) async {
    try {
      return await spreadsheet.addWorksheet(sheetTitle);
    } catch (e) {
      return spreadsheet.worksheetByTitle(sheetTitle);
    }
  }

  static Future<List<Article>> getAllRow() async {
    List<Article> list = [];
    if (_response == null) return [];
    final jsonData = await _response!.values.map.allRows();
    for (var i in jsonData!) {
      list.add(Article.fromJson(i));
    }
    return list;
  }
}
