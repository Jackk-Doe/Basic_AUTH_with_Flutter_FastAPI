# Basic_AUTH_with_Flutter_FastAPI
Basic SignIn / SignUp Auth with Flutter & FastAPI. </br>
Using JWT that generated from FastAPI, to be stored in-device in Flutter app, and to get user account datas.

## Tech-stack using :
* Flutter : for client app
  * Provider : for state management system
  * Shared-Preferences : for device local data storing
* FastAPI : for server app
  * SQLite : simple database using
  * OAuth2 : security protocol
  
  
## To Run App
### 1. Run backend FastAPI app
Go to server folder :
```
cd server
```
Install all necessary pip package :
```
pip install -r requirements.txt
```
Run the server with :
```
python main.py
```

NOTE : Since the backend server is written in FastAPI, it comes with built-in OpenAPI documentation page, generate by Swagger,
which contains all informations about all available routes. <br/>
After running backend app, from browser go to : `localhost:8000/docs`


### 2. Run client Flutter app
Go to client folder :
```
cd client_app
```
Run the app with this below command, or from editor
```
flutter run
```


## Sample running app screenshots :
1. Sign-Up page screen

<img width="350" alt="Screen Shot 2022-10-23 at 10 02 35 PM" src="https://user-images.githubusercontent.com/74220155/197383786-61f87bf4-af77-4b5d-b6ba-c587c0358321.png">

2. Sign-In page screen

<img width="350" alt="Screen Shot 2022-10-23 at 10 02 44 PM" src="https://user-images.githubusercontent.com/74220155/197383811-e9aca514-9b74-4203-b982-0f77dba92035.png">

3. Home page screen (after auth)

<img width="350" alt="Screen Shot 2022-10-23 at 10 02 29 PM" src="https://user-images.githubusercontent.com/74220155/197384089-1f17f155-57bd-431d-a40f-7ddddbe4f426.png">

