import 'package:flutter/material.dart';
import 'package:trufi_core/blocs/configuration/configuration.dart';
import 'package:trufi_core/blocs/configuration/models/animation_configuration.dart';
import 'package:trufi_core/blocs/configuration/models/attribution.dart';
import 'package:trufi_core/blocs/configuration/models/language_configuration.dart';
import 'package:trufi_core/blocs/configuration/models/map_configuration.dart';
import 'package:trufi_core/blocs/configuration/models/url_collection.dart';

import 'package:latlong2/latlong.dart';
import 'package:trufi_core/models/definition_feedback.dart';

Configuration setupConfiguration() {
  // Attribution
  final attribution = Attribution(
    representatives: [
      "Christoph Hanser",
      "Samuel Rioja",
    ],
    team: [
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
    ],
    translators: [
      "Gladys Aguilar",
      "Jeremy Maes",
      "Gaia Vitali Roscini",
    ],
    routes: [
      "Trufi team",
      "Guia Cochala team",
    ],
    openStreetMap: [
      "Marco Antonio",
      "Noémie",
      "Philipp",
      "Felix D",
      "Valor Naram",
    ],
  );

  // Urls
  final urls = UrlCollection(
    openTripPlannerUrl: "",
    routeFeedbackUrl: "https://trufifeedback.z15.web.core.windows.net/route.html",
  );

  // Map
  final map = MapConfiguration(
    defaultZoom: 12.0,
    offlineMinZoom: 8.0,
    offlineMaxZoom: 14.0,
    offlineZoom: 13.0,
    onlineMinZoom: 1.0,
    onlineMaxZoom: 19.0,
    onlineZoom: 13.0,
    chooseLocationZoom: 16.0,
    center: LatLng(5.574558, -0.214656),
    southWest: LatLng(5.510057, -0.328217),
    northEast: LatLng(5.726678, 0.071411),
  );

  // Languages
  final languages = [
    LanguageConfiguration("de", "DE", "Deutsch"),
    LanguageConfiguration("en", "US", "English", isDefault: true),
    LanguageConfiguration("es", "ES", "Español"),
    LanguageConfiguration("fr", "FR", "Français"),
    LanguageConfiguration("it", "IT", "Italiano"),
    LanguageConfiguration("qu", "BO", "Quechua simi"),
  ];

  final customTranslations = TrufiCustomLocalizations()
    ..title = {
      const Locale("de"): "Trotro App",
      const Locale("en"): "Trotro App",
      const Locale("es"): "Trotro App",
      const Locale("fr"): "Trotro App",
      const Locale("it"): "Trotro App",
      const Locale("qu"): "Trotro App",
    };

  return Configuration(
    appCity: "Accra",
    customTranslations: customTranslations,
    supportedLanguages: languages,
    teamInformationEmail: "info@trufi.app",
    attribution: attribution,
    animations: AnimationConfiguration(),
    feedbackDefinition: FeedbackDefinition(
      FeedBackType.email,
      "feedback@trufi.app",
    ),
    map: map,
    urls: urls,
    showWeather: false,
  );
}
