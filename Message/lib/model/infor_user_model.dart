class InformationUserModel {
  final String fullName;
  final String email;
  final String birth;
  final String status;
  final String story;
  final String image;
  InformationUserModel(
      {required this.fullName,
      required this.email,
      required this.birth,
      required this.status,
      required this.story,
      required this.image});
  factory InformationUserModel.formJson(Map<String, dynamic> json) {
    return InformationUserModel(
        fullName: json['fullName'],
        email: json['email'],
        birth: json['birth'],
        status: json['status'],
        story: json['story'],
        image: json['image']);
  }
  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'birth': birth,
        'status': status,
        'story':story,
        'image': image
      };
}
