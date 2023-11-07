import 'package:flutter/material.dart';
import 'package:mozart_flutter_app/config/app_assets.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_empty.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomEmptyWashlist extends StatelessWidget {
  const CustomEmptyWashlist ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomEmpty(image: AppAssets.cart,
      text: AppLocalizations.of(context)!.youhavenotaddedanyproductyet,
    textButton: AppLocalizations.of(context)!.startbrowsing,);
  }
}
