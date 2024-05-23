## Week-2
### 1) Verify C code using RISC-V compiler and Spike output.
1. Create mat.c and counter.c files for matrix multiplication and counter codes.
![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/f76f8351-c5bd-4577-b657-71b85f700af0)
3. Copy paste the codes (from week-0) into their respective files.
  - Matrix multiplication
   ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/69b85de1-449e-47db-9740-068de03a63de)
  - Counter
   ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/267eea30-d7fd-495b-bcd2-536a6aba6f0f)
3. Generate spike output (Run the c program using RISC-V compiler). Observe and verify the output.
  - Matrix Multiplication
   ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/36815f9e-1bfd-4f43-b75d-2b528b5ec86b)
  - Counter
   ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/60001512-088a-435c-bc78-19ffd8040117)
4. To convert the c files into assembly format:
  a) Comment out 'printf' and '#include<stdio.h>'.
  - mat.c
    ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/995e80c0-ded8-466a-99b0-d34874e584dc)
  - counter.c
    ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/90f3289f-c56e-419c-a10d-42c7dc4b5721)

