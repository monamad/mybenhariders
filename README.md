# Benha Riders 🚴‍♂️📍 Ai generated 

This repository contains a demo mobile application can be start point for real app
 and for me learn ans structure clean architecture app with level of depth developed as part of my training application.  
**Benha Riders** is a motorcycle ride-hailing app inspired by Uber, designed with Flutter and Google Cloud services.


---

## ✅ What I have implemented
- **Home Page** – clean and simple design.  
- **User Registration & Login** – via mobile number.  
- **Pickup & Destination Selection**  
  - User can type the location in a search bar.  
  - Autocomplete suggestions appear (powered by Google Places API).  
  - Option to pick locations directly from the map.  
- **Map Integration** – displaying the map and routes using Google Maps SDK.  

---
## 🔗 Backend Integration

Although the backend part of the project was developed by my teammate,  
I implemented a **large portion of the connection between the app and the backend**, including:

- **Models** – created Dart models to represent the data returned from the backend APIs.  
- **Repositories** – handled data fetching and communication with the services layer.  
- **Services** – wrote the logic to call the APIs (using HTTP requests) and process responses.  
- **Integration** – connected the repositories and services with the UI (Cubit/Provider) so that the app displays real backend data.  

This allowed me to practice **clean architecture** and separation of concerns, while making the app flexible and easier to maintain.
---

## 🌍 APIs Usedand
- **Google Maps SDK** – to display and interact with the map.  
- **Google Places API** – for location search and autocomplete suggestions.  
- **Geocoding API** – to retrieve place names and addresses from coordinates.  
[](Screenshot_2025-09-01-15-43-59-009_com.miui.gallery.jpg)
---

## 📱 Screenshots
| Home Page | Registration | Select Pickup & Destination |
| Home Page | Signup | Map | Start Trip |
|-----------|--------|-----|------------|
| ![Home](Screenshot_2025-09-01-15-24-30-967_com.example.mybenhariders.jpg) | ![Signup](Screenshot_2025-09-01-15-24-22-541_com.example.mybenhariders.jpg) | ![Map](Screenshot_2025-09-01-15-24-23-032_com.example.mybenhariders.jpg) | ![Start Trip](Screenshot_2025-09-01-15-24-45-299_com.example.mybenhariders.jpg) |

| Searching | Suggestions | Ride Confirm |
|-----------|-------------|--------------|
| ![Search](Screenshot_2025-09-01-15-24-49-161_com.example.mybenhariders.jpg) | ![Suggestions](Screenshot_2025-09-01-15-39-38-459_com.example.mybenhariders.jpg) | ![Confirm](Screenshot_2025-09-01-15-39-59-009_com.miui.gallery.jpg) |
---

## ⚙️ Tools & Technologies
- **Language/Framework:** Flutter (Dart)  
- **Cloud Services:** Google Cloud APIs (Maps, Places, Geocoding)  
- **IDE:** Android Studio  

-
## 🎯 Purpose
This project was developed as part of my application for training.  
The goal was to demonstrate the ability to:  
- Build a mobile app UI/UX with Flutter.  
- Integrate external APIs (Google Cloud) for maps and location features.  
- Implement real-world features like location search, suggestions, and map selection.
