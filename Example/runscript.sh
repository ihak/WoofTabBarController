# Delete Build directory
rm -rf ./build/Build

# pod install
pod install

# Build project
xcrun xcodebuild -scheme Example -workspace Example.xcworkspace -configuration Debug -destination 'platform=iOS Simulator,name=iPhone 11 Pro Max,OS=13.1' -derivedDataPath build

# Install App 
xcrun simctl install "iPhone 11 Pro Max" ./build/Build/Products/Debug-iphonesimulator/Example.app/

# Launch in Simulator
xcrun simctl launch "iPhone 11 Pro Max" com.ihak.arpatech.Example
