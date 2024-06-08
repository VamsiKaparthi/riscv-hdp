## Week-3
### Architecture of IOT application
  - The application is a **IR based Remote Controlled car**. 
  - It takes an input from IR sensor.
  - It drives a combination of 4 motors (using a motor control) and a buzzer as output.
  - Block Diagram:

      ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/b14e6a10-8823-4c69-a4cc-cd68ce3a026e)


### I/O Mapping
  - GPIO mapping:
    
      ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/e553220d-5a54-4cc0-bdf4-57d0c0b5e0a1)

  - x30[0] is the input pin where the sensor value is recieved.
  - x30[1] is the output pin which will drive the buzzer.
  - x30[8:11] are the ouput pins which will control the motor control which in turn will control the motors.




