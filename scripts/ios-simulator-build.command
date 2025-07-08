xcodebuild -project .build/iOS/BabylonNative.xcodeproj -scheme Playground -sdk iphonesimulator -destination 'arch=arm64,OS=18.5,name=iPhone 16 Pro Max' build | xcpretty
