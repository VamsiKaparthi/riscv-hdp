## Week-5

  - Generate an assembly file (ir_assembly.txt) from ir_real.c.
    ```
        riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 -ffreestanding -nostdlib -o ./ir ir_real.c
        riscv64-unknown-elf-objdump -d -r ir>ir_assembly.txt
    ```
  - Note the unique instructions present in the assembly file.
    
    ```
    1. addi
    2. sw
    3. li
    4. jal
    5. mv
    6. bnez
    7. beqz
    8. lui
    9. j
    10. ret
    11. srl
    12. andi
    13. sll
    14. and
    15. or
    16. nop
    ```
  - Modify the processor.json file accordingly.
  - Upload processor.json and ir_assembly.txt to [chipcron tool](http://16.16.202.21) to generate processor.v and testbench.v files.
