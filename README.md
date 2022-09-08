<p align="center">
  <img alt="VolTrac" src="https://raw.githubusercontent.com/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool/main/assets/volcano.png" height="250px">
</p>  
  
<h1 align="center"> La Palma VolTrac</h1>
  
<p align="center">
  <img alt="" src="https://github.com/yashrajbharti/Volcano-Tracker-Web-Scraper-demo/actions/workflows/main.yml/badge.svg">
  <img alt="" src="https://img.shields.io/github/license/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool">
  <img alt="" src="https://img.shields.io/github/languages/top/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool?color=pink">
  <img alt="" src="https://img.shields.io/github/issues/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool?color=blue">
  <img alt="" src="https://img.shields.io/github/forks/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool?style=social">
  <img alt="" src="https://img.shields.io/badge/Languages-10-important">
  <img alt="" src="https://img.shields.io/github/repo-size/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool?color=cyan&label=Repo%20Size">
</p>


## Summary

- **[About VolTrac](#about-voltrac)**
- **[Features](#features)**
- **[Building the app](#building-the-app)**
- **[Connecting to the Liquid Galaxy](#connecting-to-the-liquid-galaxy)**
- **[Setting up the rig](#setting-up-the-rig)**
- **[License](#license)**
- **[Privacy Policy and Terms & Conditions](#privacy-policy-and-terms--conditions)**

    
## About VolTrac

* La Palma Volcano Eruption Tracking Tool is an app built on the Flutter framework that allows the Visualization of various Tracks, such as Historic, Lava Flow, Affected Areas, Pre-historic, Landscape, Sulphur Dioxide Emissions, Situation, and Located Events map, for La Palmas onto the Liquid Galaxy. 
The project presents multiple layers of information on the events that occurred in the eruption of the Cumbre Vieja volcano in La Palma during the fall of 2021. 
* Data such as the evolution of lava flows and many more are presented in a graphical and interactive way on the Liquid Galaxy platform, a visualization cluster based on Google Earth.
* Further customizations are possible with the help of the Custom Builder, which has an interactive UX where the user can check the data he wants and visualize the Custom KML by providing start and end dates with the help of a calendar widget. 
* The Map screen UI is a perfect interaction tool for the panoramic display of Google Earth with the help of Google Maps, and it allows us to control the LG and send Orbit movements and various other controls. 
The app shows essential information about the La Palma Volcanic activity in an elegant and user-friendly way.
* It supports 10 Languages: Arabic, German, English, Spanish, Hindi, Japanese, Portuguese, Russian, Albanian, and Chinese (Simplified). 
The app comes in both day and night modes, and one can "tour" the app to get familiar with all the features.
Lastly, the app has an info tab that lists helpful information along with the sources so that one can use this app for research and education purposes.

  
## Features
  
Allows Visualization of various Tracks such as Historic, Lava Flow, Affected Areas, etc for La Palmas onto the Liquid Galaxy. One can also visualize Custom KML by providing start and end dates with the help of calender widget. The Map screen UI allows us to Control the LG and send Orbit movements and various other controls. The app shows a significant amount of information about the La Palma Volcanic activity in an elegant and user-friendly way.
    
Supports 10 Languages: 🇦🇪 Arabic, 🇩🇪 German, 🇺🇸 English, 🇪🇸 Spanish, 🇮🇳 Hindi, 🇯🇵 Japanese, 🇵🇹 Portuguese, 🇷🇺 Russian, 🇦🇱 Albanian, and 🇨🇳 Chinese (Simplified).

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
