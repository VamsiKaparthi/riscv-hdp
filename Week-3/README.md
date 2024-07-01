## Week-3
### Architecture of IOT application
  - The application is a **IR based Remote Controlled car**. 
  - It takes an input from IR sensor.
  - It drives a combination of 2 motors (using a motor control) as output.
  - Block Diagram:

      ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/2550d370-f4f5-4cab-8f0f-8859c8a8178f)





### I/O Mapping
  - GPIO mapping:
    
      ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/f8cf7732-f744-4f68-bf54-692686391ae2)


  - x30[2:0] are the input gpio pins where the sensor value is recieved.
  - x30[11:8] are the ouput gpio pins which will control the motor control which in turn will control the motors.




