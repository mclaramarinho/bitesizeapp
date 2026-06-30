import 'package:adhd_app/shared/domain/user/domain/entities/user_entity.dart';
import 'package:adhd_app/shared/utils/enums/country.dart';
import 'package:adhd_app/shared/utils/enums/tier.dart';

class UserModel {
  /// Iso8601 Timestamp
  final String? birthdate;

  /// Iso8601 Timestamp
  /// User creation datetime
  final String? createdAt;

  /// Iso8601 Timestamp
  /// Last time the user data was updated
  final String? updatedAt;

  final bool? termsAccepted;

  final bool? privacyPolicyAccepted;

  final String? country;

  final String? userTier;

  /// Stores the count of subtasks completed
  ///
  /// Makes it easier to recalculate the score
  /// in case the scoring system changes
  final int? amountOfSubtasksCompleted;

  /// Iso8601 Timestamp
  /// Last time the user used the app
  /// and did something regarding a project (existing or new)
  final String? lastActivity;

  /// If allowed, overdue projects will be rescheduled or have their subtasks rearranged without
  /// any need for user action
  final bool? allowsInvisibleRescheduling;

  const UserModel({
    this.birthdate,
    this.createdAt,
    this.updatedAt,
    this.termsAccepted,
    this.privacyPolicyAccepted,
    this.country,
    this.userTier,
    this.amountOfSubtasksCompleted,
    this.lastActivity,
    this.allowsInvisibleRescheduling,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    birthdate: json["birthdate"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    termsAccepted: json["termsAccepted"],
    privacyPolicyAccepted: json["privacyPolicyAccepted"],
    country: json["country"],
    userTier: json["userTier"],
    amountOfSubtasksCompleted: json["amountOfSubtasksCompleted"],
    lastActivity: json["lastActivity"],
    allowsInvisibleRescheduling: json["allowsInvisibleRescheduling"],
  );

  Map<String, dynamic> toJson() {
    return {
      "birthdate": birthdate,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "termsAccepted": termsAccepted,
      "privacyPolicyAccepted": privacyPolicyAccepted,
      "country": country,
      "userTier": userTier,
      "amountOfSubtasksCompleted": amountOfSubtasksCompleted,
      "lastActivity": lastActivity,
      "allowsInvisibleRescheduling": allowsInvisibleRescheduling,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      birthdate: DateTime.tryParse(birthdate ?? ""),
      createdAt: DateTime.tryParse(createdAt ?? ""),
      updatedAt: DateTime.tryParse(updatedAt ?? ""),
      termsAccepted: termsAccepted,
      privacyPolicyAccepted: privacyPolicyAccepted,
      country: CountryEnum.fromAbbreviation(country),
      userTier: UserTierEnum.fromDatabase(userTier),
      amountOfSubtasksCompleted: amountOfSubtasksCompleted,
      lastActivity: DateTime.tryParse(lastActivity ?? ""),
      allowsInvisibleRescheduling: allowsInvisibleRescheduling,
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      birthdate: entity.birthdate?.toIso8601String(),
      createdAt: entity.createdAt?.toIso8601String(),
      updatedAt: entity.updatedAt?.toIso8601String(),
      termsAccepted: entity.termsAccepted,
      privacyPolicyAccepted: entity.privacyPolicyAccepted,
      country: entity.country?.abbreviation,
      userTier: entity.userTier?.dbValue,
      amountOfSubtasksCompleted: entity.amountOfSubtasksCompleted,
      lastActivity: entity.lastActivity?.toIso8601String(),
      allowsInvisibleRescheduling: entity.allowsInvisibleRescheduling,
    );
  }
}
