import 'package:flutter/material.dart';
import 'package:trotro_app/configuration_service.dart';
import 'package:trotro_app/theme/theme.dart';
import 'package:trufi_core/trufi_app.dart';

void main() async {

  // // Abbreviations
  // trufiCfg.abbreviations.addAll({
  //   "Avenida": "Av.",
  //   "Calle": "C.",
  //   "Camino": "C.º",
  // });

  // // Email
  // trufiCfg.email.feedback = globalCfg.getString("emailFeedback");
  // trufiCfg.email.info = globalCfg.getString("emailInfo");

  // // Url
  // trufiCfg.url.otpEndpoint = globalCfg.getString("urlOtpEndpoint");
  // trufiCfg.url.routeFeedback = globalCfg.getString("urlRouteFeedback");
  // trufiCfg.url.donate = globalCfg.getString("urlDonate");
  // trufiCfg.url.website = globalCfg.getString("urlWebsite");
  // trufiCfg.url.facebook = globalCfg.getString("urlFacebook");
  // trufiCfg.url.twitter = globalCfg.getString("urlTwitter");

  // Run app
  runApp(
    TrufiApp(
      configuration: setupConfiguration(),
      theme: trotroTheme,
      bottomBarTheme: bottomBarTheme,
      
      // mapTileProviders: [
      //   MapLayer(MapLayerIds.streets),
      // ],
    ),
  );
}
