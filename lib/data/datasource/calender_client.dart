import 'package:googleapis/calendar/v3.dart' as cal;
import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:todoapp/data/datasource/secret.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarClient {
  // For storing the CalendarApi object, this can be used
  // for performing all the operations
  static var calendar;

  void prompt(String url) async {
    if (await launchUrl(Uri(path: url))) {
      await launchUrl(Uri(path: url));
    } else {
      throw 'Could not launch $url';
    }
  }

  // For creating a new calendar event
  void insert({
    required String title,
    required String description,
    required DateTime date,
    required Event event,
  }) async {
    // Initialize the Google Calendar API client
    var clientID = ClientId(Secret.getId(), "");
    const scopes = [cal.CalendarApi.calendarScope];

    // Prompt the user to grant permissions
    final calendarApi = await clientViaUserConsent(clientID, scopes, prompt)
        .then((AuthClient client) async {
      CalendarClient.calendar = cal.CalendarApi(client);
    });

    // Insert the event into the calendar
    await calendarApi.events.insert(event, 'primary');
  }

  // For patching an already-created calendar event
  Future<Map<String, String>> modify({
    required String title,
    required DateTime startTime,
  }) async {
    throw UnimplementedError('modify method is not implemented');
  }

  // For deleting a calendar event
  Future<void> delete(String eventId, bool shouldNotify) async {}
}
