import 'package:adhd_app/shared/utils/enums/country.dart';
import 'package:adhd_app/shared/utils/enums/tier.dart';

class UserEntity {
  final DateTime? birthdate;

  /// User creation datetime
  final DateTime? createdAt;

  /// Last time the user data was updated
  final DateTime? updatedAt;

  final bool? termsAccepted;

  final bool? privacyPolicyAccepted;

  final CountryEnum? country;

  final UserTierEnum? userTier;

  /// Stores the count of subtasks completed
  ///
  /// Makes it easier to recalculate the score
  /// in case the scoring system changes
  final int? amountOfSubtasksCompleted;

  /// Last time the user used the app
  /// and did something regarding a project (existing or new)
  final DateTime? lastActivity;

  /// If allowed, overdue projects will be rescheduled or have their subtasks rearranged without
  /// any need for user action
  final bool? allowsInvisibleRescheduling;

  const UserEntity({
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
}
