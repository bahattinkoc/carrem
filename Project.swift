import ProjectDescription
import Foundation

let project = Project(
    name: "carrem",
    packages: [],
    targets: [
        .target(
            name: "carrem",
            destinations: .iOS,
            product: .app,
            bundleId: "com.bkoc.carrem",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "CFBundleDisplayName": "carrem",
                    "LSApplicationCategoryType": "public.app-category.productivity",
                    "UILaunchStoryboardName": "LaunchScreen",
                    "NSCameraUsageDescription": "We need a camera to take a picture of the car park.",
                    "NSLocationWhenInUseUsageDescription": "We need your location information to know the car park location.",
                    "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"],
                    "UISupportedInterfaceOrientations~ipad": ["UIInterfaceOrientationPortrait"]
                ]
            ),
            sources: ["carrem/Sources/**"],
            resources: ["carrem/Resources/**"],
            entitlements: "carrem/carrem.entitlements",
            dependencies: [
                .target(name: "CarParkReminderExtension"),
            ],
            settings: .settings(base: [
                "MARKETING_VERSION": "1.1.0",
                "CURRENT_PROJECT_VERSION": "1"
            ])
        ),
        .target(
            name: "CarParkReminderExtension",
            destinations: .iOS,
            product: .appExtension,
            bundleId: "com.bkoc.carrem.CarParkReminder",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: [
                "CFBundleDisplayName": "$(PRODUCT_NAME)",
                "NSExtension": [
                    "NSExtensionPointIdentifier": "com.apple.widgetkit-extension",
                ],
            ]),
            sources: [
                "CarParkReminderExtension/Sources/**",
                "carrem/Sources/Localization/**",
                "carrem/Sources/Extension/String+Extension.swift"
            ],
            resources: [
                "CarParkReminderExtension/Resources/**",
                "carrem/Resources/Localization/**"
            ],
            entitlements: "CarParkReminderExtension/CarParkReminderExtension.entitlements",
            dependencies: [
                .sdk(name: "SwiftUI", type: .framework),
                .sdk(name: "WidgetKit", type: .framework)
            ]
        ),
    ]
)
