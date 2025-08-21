# Android Configuration Setup

## Google Maps sdk API Key Configuration

For security reasons, the Google Maps API key is not stored in the repository. Follow these steps to configure it:

### 1. Setup local.properties
1. Copy `android/local.properties.template` to `android/local.properties`
2. Replace `YOUR_GOOGLE_MAPS_API_KEY_HERE` with your actual Google Maps API key
3. Update the SDK paths to match your local development environment

### 2. File Structure
```
android/
├── local.properties          # Your actual config (ignored by git)
├── local.properties.template # Template for other developers (tracked by git)
└── app/
    ├── build.gradle.kts     # Reads from local.properties
    └── src/main/
        └── AndroidManifest.xml  # Uses ${googleMapsApiKey} placeholder   
```
### 3.setup API key form Google Maps services
1. create `lib\core\networking\api_key.dart`
2. const String googleApiKey = "YOUR_GOOGLE_MAPS_API_KEY_HERE";
3. add import in api_constants.dart