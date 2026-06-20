// TODO (docs)
extension ExtString on String? {
  bool isNullOrEmpty() {
    return this == null || this!.trim().isEmpty;
  }
}
