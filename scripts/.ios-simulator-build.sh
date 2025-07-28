# Get the target/scheme from the command line args
if [ -z "$1" ]; then
  echo "Usage: $0 <target>"
  exit 1
fi
TARGET="$1"

# Replace all BX_CONFIG_DEBUG=1 with BX_CONFIG_DEBUG=0 in all .pbxproj files in .build/iOS folder.
find .build/iOS -name "*.pbxproj" -type f -exec sed -i '' 's/BX_CONFIG_DEBUG=1/BX_CONFIG_DEBUG=0/g' {} \;

# Quiet build.
xcodebuild -project .build/iOS/BabylonNative.xcodeproj -scheme $TARGET -sdk iphonesimulator -destination 'arch=arm64,OS=18.5,name=iPhone 16 Pro Max' build -quiet

# TODO: If exit code is 0 then echo ** BUILD SUCCEEDED **
# If exit code is not 0 then echo ** BUILD FAILED **
echo ""
if [ $? -eq 0 ]; then
  echo "** BUILD SUCCEEDED **"
  echo ""
else
  echo "** BUILD FAILED **"
  echo ""
  exit 1
fi

# Use xcpretty.
XCPRETTY_INHIBIT_WARNINGS=1
# xcodebuild -project .build/iOS/BabylonNative.xcodeproj -scheme $TARGET -sdk iphonesimulator -destination 'arch=arm64,OS=18.5,name=iPhone 16 Pro Max' build | xcpretty

# Use xcpretty and generate a compile_commands.json file.
XCPRETTY_INHIBIT_WARNINGS=1
# xcodebuild -project .build/iOS/BabylonNative.xcodeproj -scheme $TARGET -sdk iphonesimulator -destination 'arch=arm64,OS=18.5,name=iPhone 16 Pro Max' build | xcpretty -r json-compilation-database --output .vscode/.build/compile_commands.json
