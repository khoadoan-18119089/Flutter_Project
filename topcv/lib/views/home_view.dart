import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appBar(),
          _search(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      expandedHeight: 120,
      flexibleSpace: FlexibleSpaceBar(
        title: _account(),
        titlePadding: const EdgeInsets.only(left: 16, bottom: 50),
        background: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Image.asset(
              'assets/images/src_features_home_images_home_header_bg.png',
              fit: BoxFit.fill,
            ),
            Positioned(
              right: 24,
              child: Image.asset(
                'assets/images/src_features_home_images_briefcase_and_cvs_junior.png',
                width: 80,
                height: 80,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _account() {
    return Container(
      height: 35,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(17.5),
        ),
        color: Colors.white,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage(
                'assets/images/src_assets_images_account_default_avatar.png',
              ),
            ),
          ),
          SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chào Khoa",
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Chúc bạn một buổi chiều tốt lành",
                style: TextStyle(fontSize: 7, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _search() {
    return SliverAppBar(
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 20,
        ),
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Colors.white,
                  boxShadow: _boxShadow(),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.green,
                      size: 28,
                    ),
                    SizedBox(width: 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bạn muốn tìm việc?",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Địa điểm - Công ty - Vị trí - Ngành nghề",
                          style: TextStyle(fontSize: 9, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                color: Colors.white,
                boxShadow: _boxShadow(),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.map_outlined,
                    color: Colors.green,
                    size: 28,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BoxShadow> _boxShadow() => [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 2),
        ),
      ];
}
