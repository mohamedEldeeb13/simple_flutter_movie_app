class Character {
  final int? charId;
  final String? name;
  final String? statusOfDeadOrAlive;
  final String? species;
  final String? type;
  final String? gender;
  final Map<String, dynamic>? origin;
  final Map<String, dynamic>? location;
  final String? image;
  final List<dynamic>? episode;
  final String? characterUrl;
  final String? createdAt;

  Character(
      {this.charId,
      this.name,
      this.statusOfDeadOrAlive,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.characterUrl,
      this.createdAt});

  factory Character.fromJson(json) {
    return Character(
        charId: json["id"],
        name: json["name"],
        statusOfDeadOrAlive: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: json["origin"],
        location: json["location"],
        image: json["image"],
        episode: json["episode"],
        characterUrl: json["url"],
        createdAt: json["created"]);
  }
}
