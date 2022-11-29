import 'package:flutter/material.dart';

import 'package:trotro_app/custom_async_executor.dart';
import 'package:trotro_app/rest_request_plan.dart';

import 'package:trufi_core/base/blocs/map_tile_provider/map_tile_provider.dart';
import 'package:trufi_core/base/blocs/map_configuration/map_configuration_cubit.dart';
import 'package:trufi_core/base/models/trufi_latlng.dart';
import 'package:trufi_core/base/utils/certificates_letsencrypt_android.dart';
import 'package:trufi_core/base/utils/graphql_client/hive_init.dart';
import 'package:trufi_core/base/widgets/drawer/menu/social_media_item.dart';
import 'package:trufi_core/base/widgets/screen/lifecycle_reactor_notification.dart';
import 'package:trufi_core/default_values.dart';
import 'package:trufi_core/trufi_core.dart';
import 'package:trufi_core/trufi_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CertificatedLetsencryptAndroid.workAroundCertificated();
  await initHiveForFlutter();
  runApp(
    TrufiApp(
      appNameTitle: 'TrotroApp',
      trufiLocalization: DefaultValues.trufiLocalization(
        currentLocale: const Locale("en"),
      ),
      blocProviders: [
        ...DefaultValues.blocProviders(
          otpEndpoint: "https://gh-accra.af.api.trufi-association.org/otp",
          otpGraphqlEndpoint: "https://gh-accra.af.api.trufi-association.org/otp/index/graphql",
          mapConfiguration: MapConfiguration(
            center: const TrufiLatLng(5.574558, -0.214656),
          ),
          searchAssetPath: "assets/data/search.json",
          customRequestPlanService: RestTrotroRequestPlanService(
            otpEndpoint: "https://gh-accra.af.api.trufi-association.org/otp",
          ),
          photonUrl: "https://gh-accra.af.api.trufi-association.org/photon",
          mapTileProviders: [
            OSMMapLayer(
              mapTilesUrl:
                  "https://gh-accra.af.api.trufi-association.org/static-maps/basic/{z}/{x}/{y}@2x.jpg",
            ),
          ],
        ),
      ],
      trufiRouter: TrufiRouter(
        routerDelegate: DefaultValues.routerDelegate(
          appName: 'Trotro App',
          cityName: 'Accra',
          countryName: 'Ghana',
          backgroundImageBuilder: (_) {
            return Image.asset(
              'assets/images/drawer-bg.jpg',
              fit: BoxFit.cover,
            );
          },
          urlFeedback:
              'https://trufifeedback.z15.web.core.windows.net/route.html',
          emailContact: 'feedback@trufi.app',
          urlShareApp: 'https://www.trotro.app/',
          urlSocialMedia: const UrlSocialMedia(
            urlFacebook: 'https://m.facebook.com/trotroapp1',
            urlTwitter: 'https://mobile.twitter.com/trotroapp',
            urlWebSite: 'https://www.trotro.app/',
          ),
          asyncExecutor: customAsyncExecutor,
          shareBaseUri: Uri(
            scheme: "https",
            host: "gh-accra.af.api.trufi-association.org",
          ),
          lifecycleReactorHandler: LifecycleReactorNotifications(
            url:
                'https://gh-accra.af.api.trufi-association.org/static_files/notification.json',
          ),
        ),
      ),
    ),
  );
}
