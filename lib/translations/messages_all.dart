// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_de_DE.dart' deferred as messages_de_de;
import 'messages_en_US.dart' deferred as messages_en_us;
import 'messages_es_ES.dart' deferred as messages_es_es;
import 'messages_fr_FR.dart' deferred as messages_fr_fr;
import 'messages_it_IT.dart' deferred as messages_it_it;
import 'messages_qu_BO.dart' deferred as messages_qu_bo;

typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
  'de_DE': messages_de_de.loadLibrary,
  'en_US': messages_en_us.loadLibrary,
  'es_ES': messages_es_es.loadLibrary,
  'fr_FR': messages_fr_fr.loadLibrary,
  'it_IT': messages_it_it.loadLibrary,
  'qu_BO': messages_qu_bo.loadLibrary,
};

MessageLookupByLibrary _findExact(String localeName) {
  switch (localeName) {
    case 'de_DE':
      return messages_de_de.messages;
    case 'en_US':
      return messages_en_us.messages;
    case 'es_ES':
      return messages_es_es.messages;
    case 'fr_FR':
      return messages_fr_fr.messages;
    case 'it_IT':
      return messages_it_it.messages;
    case 'qu_BO':
      return messages_qu_bo.messages;
    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  var availableLocale = Intl.verifiedLocale(
    localeName,
    (locale) => _deferredLibraries[locale] != null,
    onFailure: (_) => null);
  if (availableLocale == null) {
    return new Future.value(false);
  }
  var lib = _deferredLibraries[availableLocale];
  await (lib == null ? new Future.value(false) : lib());
  initializeInternalMessageLookup(() => new CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);
  return new Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary _findGeneratedMessagesFor(String locale) {
  var actualLocale = Intl.verifiedLocale(locale, _messagesExistFor,
      onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
