void setup() {
  // put your setup code here, to run once:
 // pinMode(14,INPUT);
  pinMode(10,OUTPUT);//motor2
  pinMode(9,OUTPUT);//motor2
  pinMode(8,OUTPUT);//motor1
  pinMode(13,OUTPUT);//ledg
  pinMode(12,OUTPUT);//ledr
  pinMode(11,OUTPUT);//ledy
  pinMode(7,OUTPUT);//motor1
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
while(Serial.available())
{
 char input=Serial.read();
 
 if(input=='L')
 {digitalWrite(7,HIGH);
 digitalWrite(8,LOW);
 digitalWrite(9,LOW);
 digitalWrite(10,HIGH);
 }
 else if (input=='R')
 {digitalWrite(8,HIGH);
 digitalWrite(7,LOW);
 digitalWrite(10,LOW);
 digitalWrite(9,HIGH);}
 else if(input=='F')
  {digitalWrite(7,HIGH);
 digitalWrite(8,LOW);
 digitalWrite(10,LOW);
 digitalWrite(9,HIGH);}
  else if(input=='B')
  {digitalWrite(8,HIGH);
 digitalWrite(7,LOW);
 digitalWrite(9,LOW);
 digitalWrite(10,HIGH);}
else if(input=='N')
 {digitalWrite(7,LOW);
 digitalWrite(8,LOW);
 digitalWrite(10,LOW);
 digitalWrite(9,LOW);
 digitalWrite(13,HIGH);
 delay(5000);
 digitalWrite(13,LOW);}
else if(input=='S')
 {digitalWrite(7,LOW);
 digitalWrite(8,LOW);
 digitalWrite(10,LOW);
 digitalWrite(9,LOW);
 digitalWrite(12,HIGH);
 delay(5000);
 digitalWrite(12,LOW);} 
 else if(input=='Y')
// {digitalWrite(7,LOW);
// digitalWrite(8,LOW);
// digitalWrite(10,LOW);
// digitalWrite(9,LOW);
 digitalWrite(1,HIGH);
 delay(20000);
 digitalWrite(1,LOW);}
 
}

