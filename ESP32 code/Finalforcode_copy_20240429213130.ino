#define TRIG_PIN_1      33   // Trig pin for first ultrasonic sensor
#define ECHO_PIN_1      32 // Echo pin for first ultrasonic sensor
#define TRIG_PIN_2      12   // Trig pin for second ultrasonic sensor
#define ECHO_PIN_2      14   // Echo pin for second ultrasonic sensor
#define MOISTURE_PIN    25   // Moisture pin
#define BUZZER_PIN      13  // Buzzer pin
#define MOTOR_PIN       27  //vibration motor pin
#define Button_PIN      26  //push button
#define MAX_DELAY 500    // Maximum delay between buzzer sounds
#define MIN_DELAY 5     // Minimum delay between buzzer sounds

void setup() {
  Serial.begin(9600);
  pinMode(TRIG_PIN_1, OUTPUT);
  pinMode(ECHO_PIN_1, INPUT);
  pinMode(TRIG_PIN_2, OUTPUT);
  pinMode(ECHO_PIN_2, INPUT);
  pinMode(BUZZER_PIN, OUTPUT);
  pinMode(MOTOR_PIN, OUTPUT);

}

// void triggerPattern1() {
//   digitalWrite(motorPin, HIGH); // Turn on vibration motor
//   delay(pattern1Duration);      // Wait for pattern duration
//   digitalWrite(motorPin, LOW);  // Turn off vibration motor
// }

// // Function to trigger vibration pattern 2
// void triggerPattern2() {
//   digitalWrite(motorPin, HIGH); // Turn on vibration motor
//   delay(pattern2Duration);      // Wait for pattern duration
//   digitalWrite(motorPin, LOW);  // Turn off vibration motor
// }

void loop() {
  long duration1, distance1, duration2, distance2;
  int moistureLevel;

  moistureLevel = analogRead(MOISTURE_PIN);

  // First ultrasonic sensor
  digitalWrite(TRIG_PIN_1, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN_1, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN_1, LOW);
  duration1 = pulseIn(ECHO_PIN_1, HIGH);
  distance1 = duration1 * 0.034 / 2;

  // Second ultrasonic sensor
  digitalWrite(TRIG_PIN_2, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN_2, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN_2, LOW);
  duration2 = pulseIn(ECHO_PIN_2, HIGH);
  distance2 = duration2 * 0.034 / 2;

  Serial.print("Distance 1: ");
  Serial.print(distance1);
  Serial.print("cm, Distance 2: ");
  Serial.print(distance2);
  Serial.println("cm");

   Serial.print("Moisture Level: ");
  Serial.println(moistureLevel);

  // if either sensor detects an object 
  if (distance1 < 100) {
    while(distance1 < 100){

      // Calculate buzzer volume based on distance
      int volume = map(distance1, 0, 100, 255, 50); // Map distance to volume 

      // Calculate the delay between buzzer sounds based on distance
      int delayBetweenSounds = map(constrain(distance1, 0, 100), 150, 0, MAX_DELAY, MIN_DELAY);

      analogWrite(BUZZER_PIN, volume);
      delay(500); // Buzz for 1 second
      analogWrite(BUZZER_PIN, LOW);
      delay(delayBetweenSounds);
      digitalWrite(BUZZER_PIN, HIGH);
      delay(delayBetweenSounds);
      digitalWrite(BUZZER_PIN, LOW);
      delay(delayBetweenSounds);

      // Update distance measurement for Ultrasonic sensor 1
      digitalWrite(TRIG_PIN_1, LOW);
      delayMicroseconds(2);
      digitalWrite(TRIG_PIN_1, HIGH);
      delayMicroseconds(10);
      digitalWrite(TRIG_PIN_1, LOW);
  

      duration1 = pulseIn(ECHO_PIN_1, HIGH);
      distance1 = duration1 * 0.034 / 2;

      Serial.println("Distance 1: ");
      Serial.print(distance1);
  }
  }
  else if (distance2 < 120){
    // analogWrite(BUZZER_PIN, HIGH);  // Turn on buzzer
    tone(BUZZER_PIN, 500);
  }
  else if (moistureLevel<2000){
    tone(BUZZER_PIN, 1000);
    delay(500); // Buzz for 1 second
    noTone(BUZZER_PIN); 
  }
  else {
    noTone(BUZZER_PIN);      // Turn off buzzer
  }

  delay(500);  // Add a delay to make the output readable
}
