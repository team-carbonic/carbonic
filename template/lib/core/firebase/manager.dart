import 'package:firebase_core/firebase_core.dart';
import 'package:sotwo/core/config/flavor.dart';
import 'package:sotwo/core/firebase/fcm/manager.dart';
import 'package:sotwo/core/firebase/options/dev/firebase_options.dart' as dev;
import 'package:sotwo/core/firebase/options/stage/firebase_options.dart'
    as stage;
import 'package:sotwo/core/firebase/options/prod/firebase_options.dart' as prod;

class FirebaseManager {
  const FirebaseManager._();

  static Future<void> initialize() async {
    final firebaseOptions = switch (F.flavor) {
      Flavor.dev => dev.DefaultFirebaseOptions.currentPlatform,
      Flavor.stage => stage.DefaultFirebaseOptions.currentPlatform,
      Flavor.prod => prod.DefaultFirebaseOptions.currentPlatform,
    };

    await Firebase.initializeApp(
      options: firebaseOptions,
    );

    await FcmManager.initialize();
  }
}
