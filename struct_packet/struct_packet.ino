typedef uint8_t SENSORTYPE;
typedef unsigned int TIME;
struct messagePacket {
    SENSORTYPE speed;
    TIME speedTime;
    SENSORTYPE batteryConsumption;
    TIME bcTime;
    SENSORTYPE temperature;
    TIME temperatureTime;
    SENSORTYPE motorDriver;
    TIME mdTime;
};

#define START_SYMBOL '@'
#define END_SYMBOL '%'

unsigned long startMillis;
struct messagePacket myPacket;


void setup() {

  Serial.begin(9600);
  startMillis = millis();
 
}


void loop() {
  set_packet(mock_speed_sensor(), get_current_milli_time(),
             mock_battery_sensor(), get_current_milli_time(),
             mock_temperature_sensor(),get_current_milli_time(),
             mock_driver_sensor(), get_current_milli_time());
  send_packet();
  delay(50); 
  
}


void set_packet(SENSORTYPE speed ,TIME speedTime,
                SENSORTYPE batteryConsumption, TIME bcTime, 
                SENSORTYPE temperature, TIME temperatureTime,
                SENSORTYPE motorDriver, TIME mdTime){
 
  myPacket.speed = speed;
  myPacket.speedTime =  speedTime;
  myPacket.batteryConsumption = batteryConsumption;
  myPacket.bcTime = bcTime;
  myPacket.temperature = temperature;
  myPacket.temperatureTime = temperatureTime;
  myPacket.motorDriver = motorDriver;
  myPacket.mdTime = mdTime;

  }


 void send_packet(){
  
  Serial.println(myPacket.speed);
  Serial.println(myPacket.speedTime);
  Serial.println(myPacket.batteryConsumption);
  Serial.println(myPacket.bcTime);
  Serial.println(myPacket.temperature);
  Serial.println(myPacket.temperatureTime);
  Serial.println(myPacket.motorDriver);
  Serial.println(myPacket.mdTime);

  }


SENSORTYPE mock_speed_sensor(){
  return random(1,20);
  }

SENSORTYPE mock_battery_sensor(){
  return random(22,53);
  }
  
SENSORTYPE mock_temperature_sensor(){
  return random(54,100);
  }

SENSORTYPE mock_driver_sensor(){
  return random(102,200);
  }

TIME get_current_milli_time(){
  return millis() - startMillis;
  }
