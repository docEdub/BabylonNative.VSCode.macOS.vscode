# Get the target/scheme from the command line args
if [ -z "$1" ]; then
  echo "Usage: $0 <target>"
  exit 1
fi
TARGET="$1"

xcodebuild -project .build/macOS/BabylonNative.xcodeproj -scheme $TARGET -destination 'arch=arm64,name=My Mac' build -quiet
