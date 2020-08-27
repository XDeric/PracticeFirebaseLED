#include "Firebase_Arduino_WiFiNINA.h"
#include "Secrets.h"

#define FIREBASE_HOST "lightprj.firebaseio.com"
#define FIREBASE_AUTH "HpXdWTX13eNpM49617Q5SJLln5vpAFKqojN7yJAD"
#define WIFI_SSID SECRET_SSID
#define WIFI_PASSWORD SECRET_PASS


//Define Firebase data object
FirebaseData firebaseData;

//LED pin
#define ledPin 11

void setup()
{

  Serial.begin(115200);
  delay(100);
  Serial.println();

  Serial.print("Connecting to Wi-Fi");
  int status = WL_IDLE_STATUS;
  while (status != WL_CONNECTED)
  {
    status = WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  //Provide the autntication data
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH, WIFI_SSID, WIFI_PASSWORD);
  Firebase.reconnectWiFi(true);

  //Setting up LED
  pinMode(ledPin, OUTPUT);
}

void loop()
{
  Serial.println("Starting loop");
  int onOrOff;

    if (Firebase.getInt(firebaseData, "Status")) {
  
      //Success, then read the value
  
      //Make sure value returned from server is integer
      if (firebaseData.dataType() == "int") {
        onOrOff = firebaseData.intData();
        Serial.println(onOrOff);
        if (onOrOff == 1){
          Serial.println("LED is On");
          digitalWrite(ledPin, HIGH);
          delay(200);
          } else {
          Serial.println("LED is Off");
          digitalWrite(ledPin, LOW);
          delay(200);
          }
      }
  
    } else {
      //Failed, then print out the error detail
      Serial.println(firebaseData.errorReason() + " test");
    }
  delay(1000);
  Serial.println("end of loop");
}
