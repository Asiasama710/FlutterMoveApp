import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moves_app/design_system/theme.dart';

import '../assets.dart';

class ImageNetwork extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final ImageWidgetBuilder? imageBuilder;
  const ImageNetwork(this.imageUrl,
      {super.key, this.fit, this.width, this.height, this.imageBuilder});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      imageBuilder:imageBuilder,
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        color:Theme.of(context).appColors.surface,
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          color:  Theme.of(context).appColors.shadeQuad,
          child:  SvgPicture.asset(Assets.noFilm,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).appColors.primary,
                  BlendMode.srcIn))

      ),
      height: height,
      width: width,
      fit: fit,
    );
  }
}
