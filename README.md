### Pre-Requisites
* Python
* Android sdk
* Robot Framework
* Appium 

### Installation
- Python

Follow the tutorial on how to install Python [here](https://realpython.com/installing-python/)


- Appium
```
$ npm install -g appium
```
- Robotframework, Appium Library, and Pabot
```
$ pip install robotframework
$ pip install robotframework-appiumlibrary
$ pip install robotframework-pabot
```
### Run Appium server
```
$ appium -p 4723 
$ appium -p 4724
```
### Devices Set
Store device info such as UDID, Name, Appium Port, and System Port as .dat file

### Run terminal
$ pabot --testlevelsplit --pabotlib --resourcefile DevicesSet.dat --processes 2 --verbose './src/TestSuite.robot'

You can change processess 3,4,... but you must add more test case in TestSuite
E.g: if you run 2 devices , TestSuite will have 2 test case 