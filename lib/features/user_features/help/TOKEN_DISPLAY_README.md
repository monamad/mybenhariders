# Token Display in Help Page

## Overview
The Help page now displays Google Sign-In tokens with copy functionality.

## Features

### 1. Token Display
- **Google ID Token**: The JWT token received from Google Sign-In
- **Access Token**: The access token received from the backend server after successful authentication

### 2. Copy Functionality
- Each token has a dedicated "Copy Token" button
- Clicking the button copies the token to the clipboard
- Success message is displayed when token is copied

### 3. Token Persistence
- Tokens are stored using SharedPreferences
- Tokens persist across app restarts
- Automatically loaded when the Help page is opened

### 4. Refresh Functionality
- "Refresh Tokens" button to reload tokens from storage
- Useful if tokens are updated during the current session

## Implementation Details

### Files Modified/Created:

1. **`lib/core/local_data_source/token_storage_service.dart`**
   - Service for storing and retrieving tokens using SharedPreferences
   - Methods: `storeGoogleToken()`, `getGoogleToken()`, `storeAccessToken()`, `getAccessToken()`, `clearTokens()`

2. **`lib/features/auth/google_signin/cubit/google_signin_cubit.dart`**
   - Modified to store tokens when sign-in is successful
   - Added token clearing on sign-out

3. **`lib/features/user_features/help/view/help_view.dart`**
   - Complete redesign with token display functionality
   - Copy-to-clipboard feature
   - Refresh functionality
   - Better UI with cards and buttons

4. **`pubspec.yaml`**
   - Added `shared_preferences: ^2.3.3` dependency

## Usage

1. **Sign in with Google** - Tokens are automatically stored
2. **Navigate to Help tab** - Tokens are displayed if available
3. **Copy tokens** - Tap the "Copy Token" button for each token
4. **Refresh tokens** - Use the "Refresh Tokens" button to reload

## UI Features

- **Card-based design** for better organization
- **Icon indicators** for different token types
- **Responsive layout** that works on different screen sizes
- **Loading state** while tokens are being fetched
- **Empty state** when no tokens are available
- **Success feedback** when tokens are copied

## Error Handling

- Graceful handling of missing tokens
- Clear messaging when tokens are not available
- Proper error states and user feedback
