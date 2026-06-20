import 'dart:ui';
import 'package:adhd_app/shared/services/db/app_db_collections_enum.dart';
import 'package:adhd_app/shared/utils/exceptions/db/db_exception.dart';
import 'package:adhd_app/shared/utils/result/result.dart';

// TODO (docs)
abstract class DatabaseService {
  Result<void, Exception> init();

  Future<Result<void, DbException>> write(
    AppDbCollections collection, {
    required Map<String, dynamic> data,
    List<String>? pathParams,
    VoidCallback? onSaveSuccess,
    Function(dynamic)? onSaveError,
  });

  // TODO (finish)
  // read()
  // delete()
}
