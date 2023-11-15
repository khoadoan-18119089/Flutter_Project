enum Views {
  unKnow(
    id: -2,
  ),
  splash(
    id: -1,
  ),
  home(
    id: 0,
  ),
  trangChu(
    id: 1,
  ),
  short(
    id: 2,
  ),
  subscriptions(
    id: 3,
  ),
  library(
    id: 4,
  ),
  user(
    id: 5,
  ),
  setting(
    id: 6,
  ),
  general(
    id: 7,
  ),
  detailVideo(
    id: 8,
  ),
  fullVideo(
    id: 9,
  ),
  ;

  const Views({required this.id});

  final int id;

  String get path => '/$name';

  factory Views.fromId(int id) => Views.values.firstWhere(
        (view) => view.id == id,
        orElse: () => Views.unKnow,
      );

  factory Views.fromPath(String? path) => Views.values.firstWhere(
        (view) => view.path.toUpperCase() == path?.toUpperCase(),
        orElse: () => Views.unKnow,
      );
}
