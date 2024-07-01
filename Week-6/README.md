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

   - Commands to generate and view waveform
     ```
        iverilog -o wave processor.v testbench.v
        vvp wave
        gtkwave waveform.vcd
     ```

   - You might notice a diffrent output when the input is intially changed. This is due to the fact that write state has to run 4 times to write to all the output gpio pins before the correct output is shown (which takes time) . Thats why by the end the correct output is displayed.

   - Input : 001

     ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/ac8eb15b-b091-49b8-95a7-9454f29d80e8)

   - Input : 010

     ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/609058cd-cbdb-4001-b96a-ccdfc0a8b31d)

   - Input : 011

     ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/524db40f-bd39-45aa-b084-fc7e6d546b4f)


   - Input : 110

     ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/ba3a101e-d228-4851-b5d5-501af9300609)




