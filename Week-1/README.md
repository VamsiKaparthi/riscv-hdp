## Week-1
### 1) Arithmetic Operations
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/8b6ae70f-287e-41ad-9929-2addf2c37197)
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/008c3115-e1d4-455d-b084-1047b713fdcb)
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/6ecb3826-9040-424d-be1f-1f49356f1783)
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/3eed32ff-7ec8-4960-a408-4e9cc3684133)
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/d5102ddc-4c0e-4edd-89ed-e5983e3a464b)

### 2) ALU using C
1. Create a c file alu.c. This will store the c code.
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/12fa9ef5-f437-4c57-b81d-0ea0374ccd16)
2. Write the c code in alu.c using text editor
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/52c24341-41d3-44a2-ac4c-461fc2376b84)
3. Use gcc compiler to run the c program.
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/db842d78-4d90-42f8-a792-0e305e7d1193)
4. The compiled c program: 
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/1a7929b9-a326-4068-b1cf-d89feb58b622)

### 3) ALU using Verilog
1. Create 2 .v files alu.v and alu_tb.v.
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/1fac64b0-d274-46a6-8c60-881c5d7c3b8c)
2. Write the 4-bit ALU code in alu.v using text editor. This will be our Design Under Test (DUT).
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/7675c1af-6d8c-4c24-8cc4-29886e61e63f)
3. Write the testbench in alu_tb.v using text editor. This will consist of all the tests to test our DUT.
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/1b78735d-d45e-4b68-94ec-424dbf34c5ee)
4. Run the following commands to
  - Run the icarus verilog compiler to compile both the design and testbench files and generate a waveform file (alu_wave).
  - vvp executes the compiled simulation file.
  - Gtkwave is used to view the simulation.
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/4033ddd8-9850-44f8-80e6-43c88d9b07c1)








