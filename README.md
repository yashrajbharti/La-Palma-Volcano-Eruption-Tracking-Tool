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

<h2 align="center">Scan the QR code to Install VolTrac<h2>
<p align="center">
  <img alt="" src="https://raw.githubusercontent.com/yashrajbharti/kml-images/main/qr-code.png" height="350px">
</p>
  
## Table of Contents

- **[About VolTrac](#about-voltrac)**
- **[App Features](#app-features)**
- **[Running Play Store app](#running-play-store-app)**
- **[Building from source](#building-from-source)**
- **[Setting up the rig](#setting-up-the-rig)**
- **[Guide for Open Source Contributors](#guide-for-open-source-contributors)**
- **[Contributing](#contributing)**
- **[License](#license)**
- **[Privacy Policy](#privacy-policy)**

    
## About VolTrac

* The La Palma Volcano Eruption Tracking Tool is being started as a **Google Summer of Code 2022 project with the Liquid Galaxy Organization**. Details can be viewed [here](https://summerofcode.withgoogle.com/programs/2022/projects/YsfWtGqw).
* La Palma VolTrac is an app built on the Flutter framework that allows the Visualization of various Tracks, such as Historic, Lava Flow, Affected Areas, Pre-historic, Landscape, Sulphur Dioxide Emissions, Situation, and Located Events map, for La Palmas onto the Liquid Galaxy. 
The project presents multiple layers of information on the events that occurred in the eruption of the Cumbre Vieja volcano in La Palma during the fall of 2021. 
* Data such as the evolution of lava flows and many more are presented in a graphical and interactive way on the Liquid Galaxy platform, a visualization cluster based on Google Earth.
* Further customizations are possible with the help of the Custom Builder, which has an interactive UX where the user can check the data he wants and visualize the Custom KML by providing start and end dates with the help of a calendar widget. 
* The Map screen UI is a perfect interaction tool for the panoramic display of Google Earth with the help of Google maps, and it allows us to control the LG and send Orbit movements and various other controls. 
The app shows essential information about the La Palma Volcanic activity in an elegant and user-friendly way.
* It supports 10 Languages: Arabic, German, English, Spanish, Hindi, Japanese, Portuguese, Russian, Albanian, and Chinese (Simplified). 
The app comes in both day and night modes, and one can "tour" the app to get familiar with all the features.
Lastly, the app has an info tab that lists helpful information along with the sources so that one can use this app for research and education purposes.

  
## App Features
  
* Allows Visualization (visual documentation) of various Tracks such as Historic, Lava Flow, Affected Areas, etc for La Palmas onto the Liquid Galaxy. One can also visualize Custom KML by providing start and end dates with the help of calender widget. The Map screen UI allows us to Control the LG and send Orbit movements and various other controls. The app shows a significant amount of information about the La Palma Volcanic activity in an elegant and user-friendly way.     
* Supports 10 Languages: 🇦🇪 Arabic, 🇩🇪 German, 🇺🇸 English, 🇪🇸 Spanish, 🇮🇳 Hindi, 🇯🇵 Japanese, 🇵🇹 Portuguese, 🇷🇺 Russian, 🇦🇱 Albanian, and 🇨🇳 Chinese (Simplified).  
* Comes with Day and Night theme switch.  
* One can seemlessly control the Google Earth of the Liquid Galaxy by performing touch interactions on the Google maps of the VolTrac app.
  
## Running Play Store app
  
#### Prerequisites:
  
* 10-inch Android Tablet

#### Steps:
* Download and install the app using this [Play Store link](https://play.google.com/store/apps/details?id=lapalma.voltrac). Alternatively, you can scan the QR code showcased at top to download and install the app.
* To connect to the Liquid Galaxy, tap on menu icon and go to Connection Manager; then fill the details similar to below:
<p align="center">
  <img alt="" src="https://raw.githubusercontent.com/yashrajbharti/kml-images/main/connect.jpeg" width="700px">
  </p>
    
* Now simply explore the wide variety of KML visualizations possible through the Track tab and the Custom Builder.
  
## Building from source

#### Prerequisites:

* Android Studio, Visual Studio Code or another IDE that supports Flutter development
* Flutter SDK
* Android SDK
* Android tablet device or emulator
* Git
  
Documentation on how to set up Flutter SDK and its environment can be found [here](https://flutter.dev/docs/get-started/install). Make sure to have [Git](https://git-scm.com/) and [Flutter](https://flutter.dev) installed in your machine before proceeding.
    
#### Steps:
  
* Clone the repository via the following terminal command:
  
```bash
$ git clone https://github.com/yashrajbharti/La-Palma-Volcano-Eruption-Tracking-Tool.git
$ cd La-Palma-Volcano-Eruption-Tracking-Tool
```
  
* After you have successfully cloned the project, set up Google maps API Key as La Palma VolTrac uses [Google maps Android API](https://developers.google.com/maps/documentation/android-sdk/overview?hl=pt-br) as the map service. To use Google maps you required an **API KEY**. To get this key you need to:

1. Have a Google Account
2. Create a Google Cloud Project
3. Open Google Cloud Console
4. Enable Maps Android SDK
5. Generate an API KEY

With the key in hands, the next step is placing the key inside the app. Go to *android/app/main* and edit the **AndroidManifest.xml**.

Replace the **PLACE_HERE_YOUR_API_KEY** with the key you just created.

```XML
<application
        android:label="lapalmavoltrac"
        android:icon="@mipmap/ic_launcher">
        <meta-data android:name="com.google.android.geo.API_KEY"
            android:value="PLACE_HERE_YOUR_API_KEY"/>
        
```  
    
* To run the code, ppen a terminal and navigate to the project root directory. First you need to install the packages by running:
  
```bash
$ flutter pub get
```
  
* Now we check if our devices are connected and if all the environment is correct by the following terminal command:
  
```bash
$ flutter doctor
```
 
  
*  After this, we run our app by using the following command:

> ❗ Remember that you must have a tablet device connected or an android tablet emulator running in order to run the app.

```bash
$ flutter run
```
   
* To build the APK, use the following terminal command:
  
```bash
$ flutter build apk
```
   
> ⓘ  Once done, the APK file may be found into the `/build/app/outputs/flutter-apk/` directory, named `app-release.apk`.
    
* Finally setup the connection with the Liquid Galaxy in the same way as we did previously.  
   
## Setting up the rig

An important step to take is configure the slave screens for refreshing when setting solo KMLs.

To set it up, head to the LG Tasks screen by pressing the menu icon.

In the many buttons present on the LG Tasks screen, you shall see the buttons `SET SLAVES REFRESH` and `RESET SLAVES REFRESH`. The first one will setup your slave screens to refresh its solo KML every 2 seconds. The second one will make your slaves stop refreshing.
  
> ❗ _Both actions will **reboot** your Liquid Galaxy, so the changes may be applied._
      
## Guide for Open Source Contributors

#### To Edit a particular translation
* Go to JSON file of that particular language, say hi.json in `assests/i18n folder` for Hindi.
* Translate only the data in right as in left is the "key" of the key-value pairs.
* Send a pull request and you're done.

#### To Add a new language
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
  
## Contributing 

Fill up issues, bugs or feature requests in our issue tracker. Please be very descriptive and clear so it is easier to help you. If you want to contribute to this project you can open a pull request at time you like. 
    
### License

The La Palma Volcano Eruption Tracking Tool is licensed under the [MIT license](https://opensource.org/licenses/MIT).
          
### Privacy Policy
  
Check out our [Privacy Policy](https://github.com/Alexevers/Alejandro-Android-Application-Refurbishment/blob/GSOC-2022-Apps/La%20Palma%20Volcano%20Tracking%20Tool/PrivacyPolicy.md) to get more information about the application.
      
<p align="center">
  Copyright © 2024 <a href="https://yashrajbharti.github.io/portfolio/" target="_blank">Yash Raj Bharti</a>
</p>
