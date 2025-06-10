import 'dart:async';
import 'package:meta/meta.dart';

import 'localization.dart';

/// Key to obtain the[ZIssueLocalizationService] from the [Zone]
const zoneKeyForLocalizationService = #zodArtLocalizationService;

/// Default language for this localization
const Language defaultLanguage = Language.en;

ZIssueLocalizationService _currentZIssueLocalizationService = ZIssueLocalizationService(defaultLanguage);

/// Getter to synchronously read the current localization service from the zone,
/// or fallback to the current stored in [_currentZIssueLocalizationService].
ZIssueLocalizationService get currentZLocalizationService {
  final zoneValue = Zone.current[zoneKeyForLocalizationService];
  return switch (zoneValue) {
    final ZIssueLocalizationService service => service,
    _ => _currentZIssueLocalizationService,
  };
}

/// A global localization context for resolving message texts.
///
/// This class provides access to the currently active [ZIssueLocalizationService],
/// which is used to convert technical issue instances into user-friendly,
/// localized messages.
///
/// This is especially useful in environments where passing the localization service
/// explicitly would be too verbose or inconvenient. By default, it uses [Language.en],
/// but the context can be updated at runtime (e.g., based on user preference or locale).
class ZLocalizationContext {
  /// Returns the currently active [ZIssueLocalizationService].
  ///
  /// Used throughout the system to resolve issues into localized strings.
  // ignore: unnecessary_getters_setters
  static ZIssueLocalizationService get current => currentZLocalizationService;

  /// Sets a new [ZIssueLocalizationService] as the active context.
  ///
  /// This can be called to change the language dynamically, such as in response
  /// to a user action or locale change.
  static set current(ZIssueLocalizationService newService) => _currentZIssueLocalizationService = newService;
}

/// Function to override a value using [Zone].
///
/// Overides a [zoneKey] with [value] and run the [body] function
/// in the context of a zone.
/// Usefull for testing, to keep it isolated and parallel-safe.
@internal
T runWithValue<T, Val>(Symbol zoneKey, Val value, T Function() body) {
  return runZoned(body, zoneValues: {zoneKey: value});
}
