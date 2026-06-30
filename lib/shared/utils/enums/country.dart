enum CountryEnum {
  // TODO (implement)
  us('US', 'United States'),
  br('BR', 'Brazil'),
  fr('FR', 'France'),
  unknown('UNKNOWN', 'Unknown Country');

  final String abbreviation;
  final String displayName;

  const CountryEnum(this.abbreviation, this.displayName);

  // Helper method to safely parse the string from the database
  static CountryEnum fromAbbreviation(String? abbr) {
    return CountryEnum.values.firstWhere(
      (c) => c.abbreviation == abbr?.toUpperCase(),
      orElse: () => CountryEnum.unknown,
    );
  }
}
