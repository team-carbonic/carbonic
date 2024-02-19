//
//  SecurityKeypadViewFactory.swift
//  Runner
//
//  Created by SAB-150 on 1/31/24.
//

import Flutter

class SecurityKeypadViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
	private let flutterApi: SecurityKeypadFlutterApi

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
		self.flutterApi = SecurityKeypadFlutterApi(binaryMessenger: messenger)
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
		var maxInputLength = 0
		if let creationParams = args as? [String : Any?] {
			// TODO : Flutter로부터 전달받도록 수정
			maxInputLength = switch creationParams["viewType"] as? String {
			case "password": 4
			case "residentNumber": 13
			default: 0
			}
		}
        return SecurityKeypadView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger,
			maxInputLength: maxInputLength,
			flutterApi: flutterApi
        )
    }

    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
}
