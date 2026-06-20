import 'package:adhd_app/shared/services/db/app_db_collections_enum.dart';
import 'package:adhd_app/shared/services/db/database_service.dart';
import 'package:adhd_app/shared/utils/exceptions/db/db_exception.dart';
import 'package:adhd_app/shared/utils/logger/logger.dart';
import 'package:adhd_app/shared/utils/result/result.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// TODO (docs)
// TODO (implement)
@Injectable(as: DatabaseService)
class FirebaseRtdbService implements DatabaseService {
  static final FirebaseDatabase _instance = FirebaseDatabase.instance;

  static DatabaseReference ref(String path) => _instance.ref(path);

  static const Logger _logger = Logger(location: "FirebaseRtdbService");

  @override
  Result<void, Exception> init() {
    try {
      _instance.setPersistenceEnabled(true);

      AppDbCollections.values.map(
        (col) async => await ref(col.path).keepSynced(true),
      );

      return Ok(null);
    } on Exception catch (ex) {
      return Error(ex);
    }
  }

  /// Examples:
  /// collection: AppDbCollections.users
  /// pathParams: ['123']
  /// Results in /users/123
  @override
  Future<Result<void, DbException>> write(
    AppDbCollections collection, {
    required Map<String, dynamic> data,
    List<String>? pathParams,
    VoidCallback? onSaveSuccess,
    Function(dynamic)? onSaveError,
  }) async {
    try {
      final path = collection.buildPathWithParams(pathParams);
      final r = ref(path);
      r
          .set(data)
          .then((_) {
            onSaveSuccess?.call();
            r.keepSynced(true);
            return Ok(null);
          })
          .catchError((err) {
            _logger.error(
              "Error caught on Firebase set()",
              additionalInfo: err,
            );
            onSaveError?.call(err);
            throw err;
          });
      return Error(ErrorWritingDbException());
    } catch (ex) {
      _logger.error(
        ErrorWritingDbException().message,
        includeStackTrace: true,
        additionalInfo: ex,
      );
      return Error(ErrorWritingDbException());
    }
  }
}
