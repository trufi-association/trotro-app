import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:latlong/latlong.dart';
import 'package:trufi_core/trufi_configuration.dart';
import 'package:trufi_core/trufi_app.dart';

import 'package:trotro_app/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final trufiCfg = TrufiConfiguration();
  final globalCfg = GlobalConfiguration();
  await globalCfg.loadFromAsset("app_config");

  // Abbreviations
  trufiCfg.abbreviations.addAll({
    "Avenida": "Av.",
    "Calle": "C.",
    "Camino": "C.º",
  });

  // Animation
  trufiCfg.animation.loading = FlareActor(
    "assets/images/loading.flr",
    animation: "Trufi Drive",
  );
  trufiCfg.animation.success = FlareActor(
    "assets/images/success.flr",
    animation: "Untitled",
  );

  // Attribution
  trufiCfg.attribution.representatives.addAll([
    "Christoph Hanser",
    "Samuel Rioja",
  ]);
  trufiCfg.attribution.team.addAll([
    "Andreas Helms",
    "Annika Bock",
    "Christian Brückner",
    "Javier Rocha",
    "Luz Choque",
    "Malte Dölker",
    "Martin Kleppe",
    "Michael Brückner",
    "Natalya Blanco",
    "Neyda Mili",
    "Raimund Wege",
  ]);
  trufiCfg.attribution.translations.addAll([
    "Gladys Aguilar",
    "Jeremy Maes",
    "Gaia Vitali Roscini",
  ]);
  trufiCfg.attribution.routes.addAll([
    "Trufi team",
    "Guia Cochala team",
  ]);
  trufiCfg.attribution.osm.addAll([
    "Marco Antonio",
    "Noémie",
    "Philipp",
    "Felix D",
    "Valor Naram", // Sören Reinecke
  ]);

  // Email
  trufiCfg.email.feedback = globalCfg.getString("emailFeedback");
  trufiCfg.email.info = globalCfg.getString("emailInfo");

  // Image
  trufiCfg.image.drawerBackground = "assets/images/drawer-bg.jpg";

  // Map
  trufiCfg.map.mapTilerKey = globalCfg.get("keyMapTiler");
  trufiCfg.map.defaultZoom = 12.0;
  trufiCfg.map.offlineMinZoom = 8.0;
  trufiCfg.map.offlineMaxZoom = 14.0;
  trufiCfg.map.offlineZoom = 13.0;
  trufiCfg.map.onlineMinZoom = 1.0;
  trufiCfg.map.onlineMaxZoom = 19.0;
  trufiCfg.map.onlineZoom = 13.0;
  trufiCfg.map.chooseLocationZoom = 16.0;
  trufiCfg.map.center = LatLng(5.574558, -0.214656);
  trufiCfg.map.southWest = LatLng(5.510057, -0.328217);
  trufiCfg.map.northEast = LatLng(5.726678, 0.071411);

  // Languages
  trufiCfg.languages.addAll([
    TrufiConfigurationLanguage(
      languageCode: "de",
      countryCode: "DE",
      displayName: "Deutsch",
    ),
    TrufiConfigurationLanguage(
      languageCode: "en",
      countryCode: "US",
      displayName: "English",
    ),
    TrufiConfigurationLanguage(
      languageCode: "es",
      countryCode: "ES",
      displayName: "Español",
      isDefault: true,
    ),
    TrufiConfigurationLanguage(
      languageCode: "fr",
      countryCode: "FR",
      displayName: "Français",
    ),
    TrufiConfigurationLanguage(
      languageCode: "it",
      countryCode: "IT",
      displayName: "Italiano",
    ),
    TrufiConfigurationLanguage(
      languageCode: "qu",
      countryCode: "BO",
      displayName: "Quechua simi",
    ),
  ]);

  // Url
  trufiCfg.url.otpEndpoint = globalCfg.getString("urlOtpEndpoint");
  trufiCfg.url.routeFeedback = globalCfg.getString("urlRouteFeedback");
  trufiCfg.url.donate = globalCfg.getString("urlDonate");
  trufiCfg.url.website = globalCfg.getString("urlWebsite");
  trufiCfg.url.facebook = globalCfg.getString("urlFacebook");
  trufiCfg.url.twitter = globalCfg.getString("urlTwitter");

  // Run app
  runApp(
    TrufiApp(
      theme: ThemeData(
        primaryColor: const Color(0xff263238),
        accentColor: const Color(0xffc01100),
        backgroundColor: Colors.white,
        primaryColorLight: const Color(0xffeceff1),
      ),
      localization: Localization(),
    ),
  );
}
