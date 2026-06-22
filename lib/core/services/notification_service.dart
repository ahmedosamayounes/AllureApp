import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import '../routing/routes.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  // Main instance for Firebase Cloud Messaging (FCM)
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  // Main instance to show local notification banners
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // Primary function to setup and start notification services
  Future<void> initNotifications() async {
    // Request permission from the user to show notifications
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Check if the user allowed notification permission
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted notification permission');
      }

      // Initialize local notifications, get device token, and set up listeners
      await _initLocalNotifications();
      await getDeviceToken();

      // Listen for notifications when the app is completely closed
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );

      // Listen for notifications when the app is open on the screen
      _initForegroundNotificationHandler();

      // Handle navigation when app is opened from a terminated state via notification
      _handleInitialMessage();

      // Handle navigation when app is in background and opened via notification
      _handleOnMessageOpenedApp();
    } else {
      if (kDebugMode) {
        print('User declined or has not accepted permission');
      }
    }
  }

  // Setup settings and icons for local notifications
  Future<void> _initLocalNotifications() async {
    // Use the default app icon for notification banners
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    // Initialize the plugin with settings and click action behavior
    await _localNotifications.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle what happens when user clicks the notification later
        final String? payload = response.payload;
        if (payload != null) {
          _navigateToScreen(payload);
        }
      },
    );
  }

  // Get the unique FCM token for this specific device
  Future<String?> getDeviceToken() async {
    String? token = await _fcm.getToken();
    if (kDebugMode) {
      print('FCM Token: $token');
    }
    return token;
  }

  // Listen for incoming notifications while the app is active in foreground
  void _initForegroundNotificationHandler() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If notification has data, trigger the local banner
      if (notification != null && android != null) {
        // Extract the target screen name from the notification data map
        _showLocalNotification(notification, message.data['screen']);
      }
    });
  }

  // Draw and display the notification banner on top of the screen
  void _showLocalNotification(
    RemoteNotification notification,
    String? payload,
  ) {
    // Set high importance and sound for Android channel
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'app_main_channel',
          'Main Notifications',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
    );

    // Show the banner with unique ID, title, body, and UI settings
    _localNotifications.show(
      id: notification.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: platformDetails,
      payload: payload, // Pass the screen route to the banner payload
    );
  }

  // Handle navigation when the app was completely closed (Terminated)
  Future<void> _handleInitialMessage() async {
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      final String? targetScreen = initialMessage.data['screen'];
      if (targetScreen != null) {
        await Future.delayed(const Duration(milliseconds: 1500));
        _navigateToScreen(targetScreen);
      }
    }
  }

  // Handle navigation when the app was minimized in the background
  void _handleOnMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final String? targetScreen = message.data['screen'];
      if (targetScreen != null) {
        _navigateToScreen(targetScreen);
      }
    });
  }

  // Custom core routing logic function
  void _navigateToScreen(String screenName) {
    if (kDebugMode) {
      print('Navigating directly to screen: $screenName');
    }
    if (screenName == 'home') {
      navigatorKey.currentState?.pushNamed(Routes.homeScreen);
    } else if (screenName == 'login') {
      navigatorKey.currentState?.pushNamed(Routes.loginScreen);
    } else if (screenName == 'signup') {
      navigatorKey.currentState?.pushNamed(Routes.signUpScreen);
    }
  }
}

// Top-level function to handle background notifications when app is closed
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}
