## Week-6

### Modify processor.v and testbench.v files

  - Modify processor.v according to the gpio architecture. In our case, we have used 3 input gpio pins and 4 output gpio pins.

    ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/8e6cd5e0-19e5-4462-a5c9-3c33dbc73331)

    ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/bbb90e53-565a-495a-8431-80802b7f3e0a)

  - Modify testbench.v according to the gpio architecture.

    ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/a672c72c-0d82-4994-a4f5-87a133b9e2fb)

  - Comment out all the @(posedge slow_clk);write_instruction(x); to bypass the UART. 
    
  - Provide the testcases in testbench.v

    ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/730dbbaf-8502-4d83-bce6-01bab1b055eb)


### Verify in gtkwave


