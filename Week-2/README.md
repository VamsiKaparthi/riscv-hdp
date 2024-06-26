## Week-2
### 1) Verify C code using RISC-V compiler and Spike output.
1. Create mat.c and counter.c files for matrix multiplication and counter codes.
   
   ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/f76f8351-c5bd-4577-b657-71b85f700af0)

2. Copy paste the codes (from week-0) into their respective files.
   
   - **Matrix multiplication**
     
      ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/69b85de1-449e-47db-9740-068de03a63de)
   
   - **Counter**
     
      ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/267eea30-d7fd-495b-bcd2-536a6aba6f0f)

   - **ALU**
   
      ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/2f80b872-780f-483e-aa3f-e764d7df104c)


      
   
4. Generate spike output (Run the c program using RISC-V compiler). Observe and verify the output.
   
   - **Matrix Multiplication**
     
      ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/36815f9e-1bfd-4f43-b75d-2b528b5ec86b)
   
   - **Counter**
     
      ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/b33eca51-5763-4c2e-b581-3324d9e0b5e1)


   - **ALU**

      ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/0554134a-2baa-4b24-916b-dd249e659fab)

   
5. Comment out 'printf' and '#include<stdio.h>'.
   
   - **mat.c**
     
       ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/995e80c0-ded8-466a-99b0-d34874e584dc)
   
   - **counter.c**
     
       ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/90f3289f-c56e-419c-a10d-42c7dc4b5721)

   - **alu.c**

      ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/d3a9917e-e022-42e7-9b64-4f32c9ed49a6)
     

5.Run the following commands to generate the assembly files.
   
   ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/0ecc4f92-2019-411d-bae9-d10d1f6c0dd4)

6. The generated assembly files for:
   
   - **mat.c**
     
       ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/7dcccad5-6a63-4656-a02b-2f44d5237214)
   
   - **counter.c**
     
       ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/3733d2b9-1df7-4e38-9e04-a3a368d0fb24)

   - **alu.c**
  
       ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/b620ca16-baef-4724-b6aa-ed73668db788)



### 2) Calculate CPU performance of the above programs.
      auipc - 4 cycles
      addi - 7 cycles
      beqz - 2 cycles
      j - 5 cycles
      ret - 3 cycles
      lw - 8 cycles
      add - 6 cycles
      li - 1 cycle
      jal - 9 cycles
      mv - 3 cycles
      sw - 7 cycles
      sub - 4 cycles
      sb - 5 cycles
      jr - 2 cycles
      nop - 8 cycles
      andi - 6 cycles
      bnez - 9 cycles
      bltu - 1 cycle
      bne - 2 cycles
      srai - 3 cycles
      slli - 7 cycles
      jalr - 4 cycles
      or - 5 cycles
      sll - 6 cycles
      sltu - 5 cycles
      beq - 1 cycle
      blt - 1 cycle
      bge - 1 cycle
Use these assummed values for calculating total number of clock cycles.
Assume clock frequency to be 2.3GHz. Clock cycle time = 1/(Clock frequency) = 0.43ns.

1. **Matrix Multiplication**
    - Total Clock Cycles: 1318 cycles
    - Total CPU time: 1318 x 0.43ns = 566.74ns
2. **Counter**
    - Total Clock Cycles: 1637 cycles
    - Total CPU time: 1637 x 0.43ns = 703.91ns
