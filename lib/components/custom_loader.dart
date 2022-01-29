import 'package:flutter/material.dart';

import 'package:skeletons/skeletons.dart';

class Custom_loader extends StatelessWidget {
  const Custom_loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
      style:
          SkeletonAvatarStyle(width: double.infinity, height: double.infinity),
    );
  }
}
