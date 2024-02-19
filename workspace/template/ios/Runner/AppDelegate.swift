import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var kbKeypad: KMVAPI?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        }
        GeneratedPluginRegistrant.register(with: self)
        
        LiappHandler.setMethodChannel(appDelegate: self)
    
        var passwordKeypadRegistrar = self.registrar(forPlugin: "SecurityKeypadView password")
        passwordKeypadRegistrar!.register(
            SecurityKeypadViewFactory(messenger: passwordKeypadRegistrar!.messenger()),
            withId: "password")
        var residentNumberKeypadRegistrar = self.registrar(forPlugin: "SecurityKeypadView residentNumber")
        residentNumberKeypadRegistrar!.register(
            SecurityKeypadViewFactory(messenger: residentNumberKeypadRegistrar!.messenger()),
            withId: "residentNumber")

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
