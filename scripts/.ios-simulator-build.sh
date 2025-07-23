# Get the target/scheme from the command line args
if [ -z "$1" ]; then
  echo "Usage: $0 <target>"
  exit 1
fi
TARGET="$1"

# Quiet build.
xcodebuild -project .build/iOS/BabylonNative.xcodeproj -scheme $TARGET -sdk iphonesimulator -destination 'arch=arm64,OS=18.5,name=iPhone 16 Pro Max' build -quiet

# TODO: If exit code is 0 then echo ** BUILD SUCCEEDED **
# If exit code is not 0 then echo ** BUILD FAILED **
if [ $? -eq 0 ]; then
  echo "** BUILD SUCCEEDED **"
else
  echo "** BUILD FAILED **"
  exit 1
fi

# Use xcpretty.
XCPRETTY_INHIBIT_WARNINGS=1
# xcodebuild -project .build/iOS/BabylonNative.xcodeproj -scheme $TARGET -sdk iphonesimulator -destination 'arch=arm64,OS=18.5,name=iPhone 16 Pro Max' build | xcpretty

# Use xcpretty and generate a compile_commands.json file.
XCPRETTY_INHIBIT_WARNINGS=1
# xcodebuild -project .build/iOS/BabylonNative.xcodeproj -scheme $TARGET -sdk iphonesimulator -destination 'arch=arm64,OS=18.5,name=iPhone 16 Pro Max' build | xcpretty -r json-compilation-database --output .vscode/.build/compile_commands.json
