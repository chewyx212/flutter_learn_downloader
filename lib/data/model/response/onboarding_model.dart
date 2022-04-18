// To parse this JSON data, do
//
//     final OnboardingModal = OnboardingModalFromJson(jsonString);

class OnboardingModal {
  OnboardingModal(
      {required this.id,
      required this.image,
      required this.timestamp,
      this.title});

  String id;
  String image;
  String? title;
  String timestamp;

  factory OnboardingModal.fromJson(Map<String, dynamic> json) =>
      OnboardingModal(
        id: json["camera_id"],
        image: json["image"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "timestamp": timestamp,
      };
}
