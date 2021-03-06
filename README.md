# LearningCompass2030
This repository contains the source code of the LearningCompass Mobile Application. The  LearningCompass Mobile Application is a Flutter application currently been developed for the OECD by the Software factory of the University of Helsinki.  The LearningCompass is licensed under the MIT License. 

The  LearningCompass Mobile Application is targeted at students all over the world. The main goal of the application is to promote the OECD's Education 2030 project (http://www.oecd.org/education/2030/). The  OECD hopes to support individual and societal well-being by supporting students' learning of knowledge, skills, attitudes, values, and competencies according to the Education 2030 Learning Compass framework through this application. Also, the app would allow students to interact with peers, parents, teachers and communities.

## About the repository

Structure of the Flutter App:  

### `lib`

* `common/widgets`: Contains the common widgets in the App.
* `data`: Contains the data and models used in the App.
* `screens`: This is the code for the screens in the App. 
* `store`: This is the code that contains the redux part of the App. 
* `app.dart` : This is the entry point of the App. 
* `main.dart`: This is where the individual parts of the App are put together. 
* `routes.dart`: This contains the App's screen routes.  

## Building a release
A release has to be built separately for both platforms. Currently only (an) Android release(s) exist(s) because jumping through Apple's hoops to create an iOS release would have required a lot of thought and time as well as coordination. It is recommended that building an iOS release is scheduled as early as possible in the next development cycle to be able to achieve it in a way that makes sense for further development (e.g. the app is not bound to one specific temporary developer).

Here are guides to building releases for both platforms:
* Android: https://flutter.dev/docs/deployment/android
* iOS: https://flutter.dev/docs/deployment/ios
