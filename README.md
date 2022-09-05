# La Palma VolTrac
![Build](https://github.com/yashrajbharti/Volcano-Tracker-Web-Scraper-demo/actions/workflows/main.yml/badge.svg) ![](https://img.shields.io/github/license/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool) ![](https://img.shields.io/github/languages/top/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool?color=pink) ![](https://img.shields.io/github/issues/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool?color=blue) ![](https://img.shields.io/github/forks/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool?style=social) ![](https://img.shields.io/badge/Languages-10-important) ![Repo Size](https://img.shields.io/github/repo-size/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool?color=cyan&label=Repo%20Size)
  
Allows Visualization of various Tracks such as Historic, Lava Flow, Affected Areas, etc for La Palmas onto the Liquid Galaxy. One can also visualize Custom KML by providing start and end dates with the help of calender widget. The Map screen UI allows us to Control the LG and send Orbit movements and various other controls. The app shows a significant amount of information about the La Palma Volcanic activity in an elegant and user-friendly way.
    
Supports 10 Languages: Arabic, German, English, Spanish, Hindi, Japanese, Portuguese, Russian, Albanian, and Chinese (Simplified).

## Guide for Open Source Contributors to add more languages or correct translation in a particular language.

### To Edit a particular translation
* Go to JSON file of that particular language, say hi.json in `assests/i18n folder` for Hindi.
* Translate only the data in right as in left is the "key" of the key-value pairs.
* Send a pull request and you're done.

### To Add a new language
* If you want to add a new language, say Greek, first google the Language code of the language (for greek it is el).
* Go to `assets/i18n` and add a new file, name it el.json.
* Copy the contents of en.json and paste it there so you don't have to rewrite the keys.
* Start translating it and once done, verify it's a JSON of valid format, means no comma or brackets are missing and it has all the key value pairs.
* Now go to line number #6 of each of the JSON files and add code and language name in each of the languages, you can use google translate here, for single words it's mostly correct.
* After this go to main.dart and add your language code in a similar way as done for other languages in line #11.
* Finally go to `codingapp/translate.dart` and add the following **CupertinoActionSheetAction** code similar to how it is done for other languages,
```dart
   CupertinoActionSheetAction(
            child: Text(translate('language.name.en') + " 🇺🇸",
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontFamily: "GoogleSans")),
            onPressed: () {
              changeLocale(context, "en");
              Navigator.of(context, rootNavigator: true).pop("en");
            }),
```
* Make sure to change "en" (present at three places) and flag to the language code and flag of the language you're adding.
