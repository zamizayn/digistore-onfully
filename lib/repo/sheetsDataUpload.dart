import 'dart:developer';

import 'package:digistoreapp/modals/financeModel.dart';
import 'package:gsheets/gsheets.dart';

class SheetsFlutter {
  static String _sheetId = "1JeVDnmF3svotryHvJiosiVQxLOPRN0rHtRMWJyzr3os";
  static const _sheetCredentials = r'''
{
  "type": "service_account",
  "project_id": "onfully",
  "private_key_id": "0369b9daac4f30ec98bfead1cb63230aed04c4b5",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCtbbd7i68A3U37\n4Xk0u18xV7/kv9ZuGTCI497b4SJcRBX9dcZEXRc66dl1f2HVUUzLX3T4AT+oX5Vc\nylDuEtA3zaznjqn2o7DoNy0yFVU2by6hJ405D7cbSRmnLcYRolRs9BdP1Vnd3xxz\nr4AmaBPkg/03E/TuneYhNeTxGxgEoLcSDK3YLB/s165qBrhtUccje7Skk2l/Nia7\njcuL9KWRQwBWPGYNFqIEa6zD+xWLhxF4tCXpOsZ8lhdw0XnK/ommmR9MjaICA4X3\nJ+BfQiS5+ni2y06O1UGv4PcnJeUaW5oufg0gAZohqbOhqJiyQXVubyapAuJTG8xN\nvcUuJVkbAgMBAAECggEABawafbR2X1ldpRjdTX+5X9RGZvVtToGNaFTHo7pr1Me3\nTmhtOSwwR9GBNsoZSZBUqiwvl7L2wYuKx5OobPj5jXGxL4unfHUjIp03YbV36YVe\naY/xGwYsD3znFWQ2X7pG959OKeLJAyw6coAxeVAbInS8sfH5p1pLvhdUqxwfP3ty\nRVOuFZHt/ef8mCSRXyT5m4NdziB8RhNXmJlJ8LyoKnjydaes0kpd8dOt9i67mZdU\ndpG7ZjoRImWc3VciV2cgNk6zyjWPkZ7EY6H+qpaTydakKoRNi0PqNMUL/hYm283t\nzOnQsp7jEkL1aj0ugVovQ4QLCnjLh6WGf2bb9pLtpQKBgQDy0W3gKhxcPa4JuNAn\nTeKFqBMZWKNladAveujLf+76camfkOrjXSln+n9rm1CIuRmmFwQQATZfacEtOuNa\nlGOmMGkjrGFyuBidTmBat6OCvuH4ECH8VTkxxeg2Fo4GAmb+n55X3NTL/iFkIh/T\n1XjxjXAmSJTDA51r420qy50PPwKBgQC21/HwGxmrdZl9gOJOg8ZZuloOyXwAMd5k\nLjTKTM0/vVqQxRA+jlgW193UIo1QxPCq3wHW+J9C4+zy70l2/ZSqFUePEtgSe/qN\nmvBzfcouFVG1mYcY1JN3cD3QRrzmzVYrjQJFH9+Cs1LYGnv18cfI4s+FXHLmOsQM\nGxbvIQmbJQKBgGsL4QCeD/qqRnuKullZgK+jtSfLZ91hlKIZ8V8le1l1mm36GVM6\n0vJAAMSTqCFeWOxb4TKdFjdiDAPAnlJkcLnnRbKwYBWPC2ruDpRvuOn+9OfDVPhF\nKf3DXefacao8jONbwxbBCB8WXeojERz2U2dKD1MRVGPUyCW0EYB4WzlJAoGBAKB8\n4wtRfjKVQmh6nCk2WP+hJjMcfw7ctstQE14OE4oC9l9j2WJPJtrGFxuASHHAq04P\n+FlsWL4puW1ywxUCd17i1rCqZaWz1LQ+bxewLapNZC711zLgQ5/ukRMjQ+OCEESh\nvIBX/aOHKwwsEupJkoatLmFsSB31LudBT9wNL5VRAoGBAIdrgC5jRQbypZjcr0AF\n2VokEvU4m0Gpr3M0v6YGFmescI0nyFv+bYcnf0jECIOAZaZmj15WOGV8Xg1+EcX6\n5udp+G2vZeOR2hgRm+k9z0OwtkFfbzNYem91KWqXLOsI069IU5Hndj+s0ZHdGlat\nuducyoxSSLXhcVpL1cyDl2VK\n-----END PRIVATE KEY-----\n",
  "client_email": "onfullyflutter@onfully.iam.gserviceaccount.com",
  "client_id": "114217846294110209415",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/onfullyflutter%40onfully.iam.gserviceaccount.com"
}
''';
  static Worksheet? _userSheet;
  static final _gsheets = GSheets(_sheetCredentials);

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_sheetId);
      log("dataaaa" + spreadsheet.inputOption.toString());
      _userSheet = await _getWorkSheet(spreadsheet, title: "Users");
      final firstRow = FinanaceModel.getColumns();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print(e);
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    _userSheet!.values.map.appendRows(rowList);
  }
}
