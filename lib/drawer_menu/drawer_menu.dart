import 'package:flutter/material.dart';
import 'package:trufi_core/models/menu/social_media/facebook_social_media.dart';
import 'package:trufi_core/models/menu/social_media/social_media_item.dart';
import 'package:trufi_core/models/menu/social_media/twitter_social_media.dart';
import 'package:trufi_core/models/menu/social_media/website_social_media.dart';
import 'package:trufi_core/utils/util_icons/custom_icons.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:trufi_core/models/menu/default_item_menu.dart';
import 'package:trufi_core/models/menu/default_pages_menu.dart';
import 'package:trufi_core/models/menu/menu_item.dart';

final List<List<MenuItem>> menuItems = [
  DefaultPagesMenu.values.map((menuPage) => menuPage.toMenuPage()).toList(),
  [
    ...DefaultItemsMenu.values
        .map((menuPage) => menuPage.toMenuItem())
        .toList(),
    SimpleMenuItem(
      buildIcon: (context) => const Icon(
        Icons.monetization_on,
        color: Colors.grey,
      ),
      name: (context) => MenuItem.buildName(
        context,
        Localizations.localeOf(context).languageCode == "en"
            ? "Donate"
            : "Spenden",
      ),
      onClick: () => launch("https://donorbox.org/trufi-association"),
    ),
    AppShareButtonMenu(""),
    SimpleMenuItem(
        buildIcon: (context) => const Icon(CustomIcons.trufi),
        name: (context) {
          final theme = Theme.of(context);
          return DropdownButton<SocialMediaItem>(
            icon: Row(
              children: [
                Text(Localizations.localeOf(context).languageCode == "en"
                    ? "Social media"
                    : "Soziale Medien"),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
            selectedItemBuilder: (_) => [],
            underline: Container(),
            style: theme.textTheme.bodyText1,
            onChanged: (SocialMediaItem value) {
              value.onClick(context, true);
            },
            items: <SocialMediaItem>[
              FacebookSocialMedia("https://m.facebook.com/trotroapp1"),
              TwitterSocialMedia("https://mobile.twitter.com/trotroapp"),
              WebSiteSocialMedia("https://www.trotro.app/"),
            ].map((SocialMediaItem value) {
              return DropdownMenuItem<SocialMediaItem>(
                value: value,
                child: Row(
                  children: [
                    value.notSelectedIcon(context),
                    value.name(context),
                  ],
                ),
              );
            }).toList(),
          );
        }),
  ],
];
