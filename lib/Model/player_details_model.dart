class PlayerDetails {
  String? id;
  String? name;
  String? profileImage;
  String? fullImage;
  String? jerseyNo;
  String? position;
  String? dateOfBirth;
  String? nationality;
  String? matchesPlayed;
  String? totalPonintsEarned;
  String? mostPointsInAMatch;
  String? notOutPercentage;
  String? noOfSuperRaids;
  String? super10S;
  String? avgRaidPoints;
  String? noOfSuperTackles;
  String? totalTaclePoints;

  PlayerDetails(
      {this.id,
      this.name,
      this.profileImage,
      this.fullImage,
      this.jerseyNo,
      this.position,
      this.dateOfBirth,
      this.nationality,
      this.matchesPlayed,
      this.totalPonintsEarned,
      this.mostPointsInAMatch,
      this.notOutPercentage,
      this.noOfSuperRaids,
      this.super10S,
      this.avgRaidPoints,
      this.noOfSuperTackles,
      this.totalTaclePoints});

  PlayerDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    profileImage = json["profile_image"];
    fullImage = json["full_image"];
    jerseyNo = json["jersey_no"];
    position = json["position"];
    dateOfBirth = json["date_of_birth"];
    nationality = json["nationality"];
    matchesPlayed = json["Matches_played"];
    totalPonintsEarned = json["total_ponints_earned"];
    mostPointsInAMatch = json["most_points_in_a_match"];
    notOutPercentage = json["not_out_percentage"];
    noOfSuperRaids = json["no_of_super_raids"];
    super10S = json["super_10s"];
    avgRaidPoints = json["avg_raid_points"];
    noOfSuperTackles = json["no_of_super_tackles"];
    totalTaclePoints = json["total_tacle_points"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["profile_image"] = profileImage;
    data["full_image"] = fullImage;
    data["jersey_no"] = jerseyNo;
    data["position"] = position;
    data["date_of_birth"] = dateOfBirth;
    data["nationality"] = nationality;
    data["Matches_played"] = matchesPlayed;
    data["total_ponints_earned"] = totalPonintsEarned;
    data["most_points_in_a_match"] = mostPointsInAMatch;
    data["not_out_percentage"] = notOutPercentage;
    data["no_of_super_raids"] = noOfSuperRaids;
    data["super_10s"] = super10S;
    data["avg_raid_points"] = avgRaidPoints;
    data["no_of_super_tackles"] = noOfSuperTackles;
    data["total_tacle_points"] = totalTaclePoints;
    return data;
  }

  static List<PlayerDetails> ofPlayersDetails(List value) {
    return value.map((e) => PlayerDetails.fromJson(e)).toList();
  }
}
