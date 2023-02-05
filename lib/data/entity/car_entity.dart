class CarEntity {
  final String image;
  final String name;
  final String coupmany;
  final String girbox;
  final String userAccount;
  final String door;
  final String sun;
  final String instantConfirmation;
  final String money;

  CarEntity.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        name = json['name'],
        coupmany = json['coupmany'],
        girbox = json['girbox'],
        userAccount = json['userAccount'],
        door = json['door'],
        sun = json['sun'],
        instantConfirmation = json['Instant_confirmation'],
        money = json['Money'];
}
