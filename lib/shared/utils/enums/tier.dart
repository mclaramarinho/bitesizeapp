enum UserTierEnum {
  free(dbValue: "FREE"),
  pro(dbValue: "PRO"),
  unknown(dbValue: "UNKNOWN");

  final String dbValue;

  const UserTierEnum({required this.dbValue});

  factory UserTierEnum.fromDatabase(String? value) {
    return UserTierEnum.values.firstWhere(
      (val) => val.dbValue == value,
      orElse: () => UserTierEnum.unknown,
    );
  }
}
