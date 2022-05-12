import 'package:flutter/cupertino.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_translate/flutter_translate.dart';

String? value = "es";

void showDemoActionSheet(
    {required BuildContext context, required Widget child}) {
  showCupertinoModalPopup<String>(
      context: context, builder: (BuildContext context) => child);
}

void onActionSheetPress(BuildContext context) {
  showDemoActionSheet(
    context: context,
    child: CupertinoActionSheet(
      title: Text(translate('language.selection.title')),
      message: Text(translate('language.selection.message')),
      actions: <Widget>[
        CupertinoActionSheetAction(
            child: Text(translate('language.name.en')),
            onPressed: () {
              changeLocale(context, "en");
              Navigator.of(context, rootNavigator: true).pop("en");
            }),
        CupertinoActionSheetAction(
            child: Text(translate('language.name.es')),
            onPressed: () {
              changeLocale(context, "es");
              Navigator.of(context, rootNavigator: true).pop("es");
            }),
        CupertinoActionSheetAction(
            child: Text(translate('language.name.ar')),
            onPressed: () {
              changeLocale(context, "ar");
              Navigator.of(context, rootNavigator: true).pop("ar");
            }),
        CupertinoActionSheetAction(
            child: Text(translate('language.name.ru')),
            onPressed: () {
              changeLocale(context, "ru");
              Navigator.of(context, rootNavigator: true).pop("ru");
            }),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(translate('button.cancel')),
        isDefaultAction: true,
        onPressed: () =>
            Navigator.of(context, rootNavigator: true).pop("Cancel"),
      ),
    ),
  );
}
