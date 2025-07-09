# Get the target/scheme from the command line args
if [ -z "$1" ]; then
  echo "Usage: $0 <target>"
  exit 1
fi
TARGET="$1"

xcodebuild -project .build/iOS/BabylonNative.xcodeproj -scheme $TARGET -sdk iphonesimulator -destination 'arch=arm64,OS=18.5,name=iPhone 16 Pro Max' build -quiet
