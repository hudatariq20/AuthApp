# AuthApp

Flutter Firebase Authentication with BLoC and Clean Architecture

Project Overview
This Flutter project demonstrates the implementation of Firebase Authentication using the BLoC pattern within a clean architecture framework. The application supports user registration, login, and logout functionalities using Firebase, and is structured to be scalable, maintainable, and testable.


Features
* Firebase Authentication: Supports email/password authentication and Google sign-in.
* BLoC for State Management: Manages authentication state and ensures a reactive user interface.
* Clean Architecture: Separates the codebase into presentation, domain, and data layers

Getting Started
Prerequisites
* Flutter SDK: Ensure you have Flutter installed on your machine. Follow the official Flutter installation guide.
* Firebase Project: Set up a Firebase project and configure Firebase Authentication. You will need to download the google-services.json (for Android) and GoogleService-Info.plist (for iOS) files and add them to your Flutter project.


Installation
1. Clone the Repository     
        git clone https://github.com/yourusername/flutter-firebase-auth-bloc.git
        cd flutter-firebase-auth-bloc
2. Install Dependencies:  flutter pub get
3. Configure Firebase:
    * Place the google-services.json file in the android/app directory.
    * Place the GoogleService-Info.plist file in the ios/Runner directory.
    * Ensure that your Firebase project is correctly configured with the necessary authentication provider.

3. Run the flutter app
 -  flutter run
4. Project Structure
    * The project follows clean architecture principles, with the codebase divided into the following layers:
    * Presentation Layer: Contains the UI components and BLoC logic.
        * lib/presentation/
        * lib/bloc/
        * lib/cubits/
    * Domain Layer: Contains the business logic, including use cases.
        * lib/domain/
    * Data Layer: Handles data retrieval and persistence, including Firebase interaction.
        * lib/data/

Directory Structure
lib/
│
├── data/                   # Data layer with repositories and Firebase interactions
 │   ├── repositories/
      ├── user/    
  │   ├── base_user_respository.dart
  │   └── user_repository.dart
      ├──auth/    
  │   ├── base_auth_respository.dart
  │   └── auth_repository.dart
│
├── domain/                 # Domain layer with entities and use cases
│   ├── user.dart/
│   
│
└── presentation/           # UI layer with screens and widgets
    ├── pages/
    └── widgets/
    └──blocs/
             ├── authbloc/                   # BLoC for managing state (auth & profile)
               │   ├── auth_bloc.dart
               │   └── auth_event.dart
               │   └── auth_state.dart
             ├── profilebloc/ 
              │   ├── profile_bloc.dart
              │   └── profile_event.dart
              │   └── profile_state.dart
 └──cubits/                                    # Cubits for managing state(login & Signup)
            ├──loginCubit/
              │   ├── login_cubit.dart
              │   └── login_event.dart
            ├──signUpCubit/
              │   ├── signUp_cubit.dart
              │   └──  signUp_event.dart
     

Usage
Authentication Flow
* Sign Up: Users can register with their email and password.
* Login: Users can log in using their registered credentials.
* Logout: Users can log out from the application.
* Profile : Maintain the authenticated/unauthenticated user state. 

BLoC and State Management
The BLoC pattern is used to manage the state of the authentication flow, ensuring that the UI responds reactively to changes in the user's authentication status.

Contributing
Contributions are welcome! Please fork this repository and submit a pull request with your changes. Ensure that your code adheres to the project's coding standards and includes relevant tests.
