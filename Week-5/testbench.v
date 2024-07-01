

// 
// Module: tb
// 
// Notes:
// - Top level simulation testbench.
//

//`timescale 1ns/1ns
//`define WAVES_FILE "./work/waves-rx.vcd"

module tb();
    
reg        clk          ; // Top level system clock input.
reg rst;
reg neg_clk; 
reg neg_rst ; 
reg        resetn       ;
reg        uart_rxd     ; // UART Recieve pin.

reg        uart_rx_en   ; // Recieve enable
//wire [8:0] res;
wire       uart_rx_break; // Did we get a BREAK message?
wire       uart_rx_valid; // Valid data recieved and available.
wire [7:0] uart_rx_data ; // The recieved data.
wire [31:0] inst ; 
wire [31:0] inst_mem ; 

reg rst_pin ; 
wire write_done ; 


// Bit rate of the UART line we are testing.
localparam BIT_RATE = 9600;
localparam BIT_P    = (1000000000/BIT_RATE);


// Period and frequency of the system clock.
localparam CLK_HZ   = 50000000;
localparam CLK_P    = 1000000000/ CLK_HZ;

reg slow_clk = 0;


// Make the clock tick.
always begin #(CLK_P/2) clk  = ~clk; end   
always begin #(CLK_P/2) neg_clk  = ~neg_clk; end     
always begin #(CLK_P*2) slow_clk <= !slow_clk;end



task write_instruction;
    input [31:0] instruction;
    begin
            @(posedge clk);
            send_byte(instruction[7:0]);
            check_byte(instruction[7:0]);
            @(posedge clk);
            send_byte(instruction[15:8]);
            check_byte(instruction[15:8]);
            
            @(posedge clk);
            send_byte(instruction[23:16]);
            check_byte(instruction[23:16]);
            
            @(posedge clk);
            send_byte(instruction[31:24]);
            check_byte(instruction[31:24]);
    end
    endtask

task send_byte;
    input [7:0] to_send;
    integer i;
    begin


        #BIT_P;  uart_rxd = 1'b0;
        for(i=0; i < 8; i = i+1) begin
            #BIT_P;  uart_rxd = to_send[i];
        end
        #BIT_P;  uart_rxd = 1'b1;
        #1000;
    end
endtask


// Checks that the output of the UART is the value we expect.
integer passes = 0;
integer fails  = 0;
task check_byte;
    input [7:0] expected_value;
    begin
        if(uart_rx_data == expected_value) begin
            passes = passes + 1;
            $display("%d/%d/%d [PASS] Expected %b and got %b", 
                     passes,fails,passes+fails,
                     expected_value, uart_rx_data);
        end else begin
            fails  = fails  + 1;
            $display("%d/%d/%d [FAIL] Expected %b and got %b", 
                     passes,fails,passes+fails,
                     expected_value, uart_rx_data);
        end
    end
endtask


initial 
begin 
    $dumpfile("waveform.vcd");
    $dumpvars(0,tb);
end 

reg [3:0] input_wires; 
wire [3:0] output_wires ; 
wire [2:0] pc ; 


reg [7:0] to_send;
initial begin
    rst=1;
    rst_pin=1; 
    neg_rst = 1; 
    resetn  = 1'b0;
    clk     = 1'b0;
    neg_clk = 1; 
    neg_rst = ~clk ;
    uart_rxd = 1'b1;
    neg_clk = 1'b1; 
    input_wires = 4'b0111;
    #4000
    resetn = 1'b1;
    rst=0;
    neg_rst = 0; 
    rst_pin = 0 ; 
  

    uart_rx_en = 1'b1;
    @(posedge slow_clk);write_instruction(32'h00000000); 
    @(posedge slow_clk);write_instruction(32'h00000000); 
    @(posedge slow_clk);write_instruction(32'hff010113); 
    @(posedge slow_clk);write_instruction(32'h00112623); 
    @(posedge slow_clk);write_instruction(32'h00812423); 
    @(posedge slow_clk);write_instruction(32'h01010413); 
    @(posedge slow_clk);write_instruction(32'h00200513); 
    @(posedge slow_clk);write_instruction(32'h224000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h06079663); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h214000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h04079e63); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h204000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h04078663); 
    @(posedge slow_clk);write_instruction(32'h00800613); 
    @(posedge slow_clk);write_instruction(32'heff00593); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h220000ef); 
    @(posedge slow_clk);write_instruction(32'h00900613); 
    @(posedge slow_clk);write_instruction(32'hdff00593); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h210000ef); 
    @(posedge slow_clk);write_instruction(32'h00a00613); 
    @(posedge slow_clk);write_instruction(32'hbff00593); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h200000ef); 
    @(posedge slow_clk);write_instruction(32'h00b00613); 
    @(posedge slow_clk);write_instruction(32'hfffff7b7); 
    @(posedge slow_clk);write_instruction(32'h7ff78593); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h1ec000ef); 
    @(posedge slow_clk);write_instruction(32'h1b00006f); 
    @(posedge slow_clk);write_instruction(32'h00200513); 
    @(posedge slow_clk);write_instruction(32'h1ac000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h06079663); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h19c000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h04078e63); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h18c000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h04079663); 
    @(posedge slow_clk);write_instruction(32'h00800613); 
    @(posedge slow_clk);write_instruction(32'heff00593); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h1a8000ef); 
    @(posedge slow_clk);write_instruction(32'h00900613); 
    @(posedge slow_clk);write_instruction(32'hdff00593); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h198000ef); 
    @(posedge slow_clk);write_instruction(32'h00a00613); 
    @(posedge slow_clk);write_instruction(32'hbff00593); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h188000ef); 
    @(posedge slow_clk);write_instruction(32'h00b00613); 
    @(posedge slow_clk);write_instruction(32'hfffff7b7); 
    @(posedge slow_clk);write_instruction(32'h7ff78593); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h174000ef); 
    @(posedge slow_clk);write_instruction(32'h1380006f); 
    @(posedge slow_clk);write_instruction(32'h00200513); 
    @(posedge slow_clk);write_instruction(32'h134000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h06079663); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h124000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h04078e63); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h114000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h04078663); 
    @(posedge slow_clk);write_instruction(32'h00800613); 
    @(posedge slow_clk);write_instruction(32'heff00593); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h130000ef); 
    @(posedge slow_clk);write_instruction(32'h00900613); 
    @(posedge slow_clk);write_instruction(32'hdff00593); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h120000ef); 
    @(posedge slow_clk);write_instruction(32'h00a00613); 
    @(posedge slow_clk);write_instruction(32'hbff00593); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h110000ef); 
    @(posedge slow_clk);write_instruction(32'h00b00613); 
    @(posedge slow_clk);write_instruction(32'hfffff7b7); 
    @(posedge slow_clk);write_instruction(32'h7ff78593); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h0fc000ef); 
    @(posedge slow_clk);write_instruction(32'h0c00006f); 
    @(posedge slow_clk);write_instruction(32'h00200513); 
    @(posedge slow_clk);write_instruction(32'h0bc000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h06078663); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h0ac000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h04078e63); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h09c000ef); 
    @(posedge slow_clk);write_instruction(32'h00050793); 
    @(posedge slow_clk);write_instruction(32'h04079663); 
    @(posedge slow_clk);write_instruction(32'h00800613); 
    @(posedge slow_clk);write_instruction(32'heff00593); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h0b8000ef); 
    @(posedge slow_clk);write_instruction(32'h00900613); 
    @(posedge slow_clk);write_instruction(32'hdff00593); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h0a8000ef); 
    @(posedge slow_clk);write_instruction(32'h00a00613); 
    @(posedge slow_clk);write_instruction(32'hbff00593); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h098000ef); 
    @(posedge slow_clk);write_instruction(32'h00b00613); 
    @(posedge slow_clk);write_instruction(32'hfffff7b7); 
    @(posedge slow_clk);write_instruction(32'h7ff78593); 
    @(posedge slow_clk);write_instruction(32'h00100513); 
    @(posedge slow_clk);write_instruction(32'h084000ef); 
    @(posedge slow_clk);write_instruction(32'h0480006f); 
    @(posedge slow_clk);write_instruction(32'h00800613); 
    @(posedge slow_clk);write_instruction(32'heff00593); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h070000ef); 
    @(posedge slow_clk);write_instruction(32'h00900613); 
    @(posedge slow_clk);write_instruction(32'hdff00593); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h060000ef); 
    @(posedge slow_clk);write_instruction(32'h00a00613); 
    @(posedge slow_clk);write_instruction(32'hbff00593); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h050000ef); 
    @(posedge slow_clk);write_instruction(32'h00b00613); 
    @(posedge slow_clk);write_instruction(32'hfffff7b7); 
    @(posedge slow_clk);write_instruction(32'h7ff78593); 
    @(posedge slow_clk);write_instruction(32'h00000513); 
    @(posedge slow_clk);write_instruction(32'h03c000ef); 
    @(posedge slow_clk);write_instruction(32'hdddff06f); 
    @(posedge slow_clk);write_instruction(32'hfd010113); 
    @(posedge slow_clk);write_instruction(32'h02812623); 
    @(posedge slow_clk);write_instruction(32'h03010413); 
    @(posedge slow_clk);write_instruction(32'hfca42e23); 
    @(posedge slow_clk);write_instruction(32'hfdc42783); 
    @(posedge slow_clk);write_instruction(32'h00ff5533); 
    @(posedge slow_clk);write_instruction(32'h00157793); 
    @(posedge slow_clk);write_instruction(32'hfef42623); 
    @(posedge slow_clk);write_instruction(32'hfec42783); 
    @(posedge slow_clk);write_instruction(32'h00078513); 
    @(posedge slow_clk);write_instruction(32'h02c12403); 
    @(posedge slow_clk);write_instruction(32'h03010113); 
    @(posedge slow_clk);write_instruction(32'h00008067); 
    @(posedge slow_clk);write_instruction(32'hfd010113); 
    @(posedge slow_clk);write_instruction(32'h02812623); 
    @(posedge slow_clk);write_instruction(32'h03010413); 
    @(posedge slow_clk);write_instruction(32'hfca42e23); 
    @(posedge slow_clk);write_instruction(32'hfcb42c23); 
    @(posedge slow_clk);write_instruction(32'hfcc42a23); 
    @(posedge slow_clk);write_instruction(32'hfd442783); 
    @(posedge slow_clk);write_instruction(32'hfdc42703); 
    @(posedge slow_clk);write_instruction(32'h00f717b3); 
    @(posedge slow_clk);write_instruction(32'hfef42623); 
    @(posedge slow_clk);write_instruction(32'hfec42783); 
    @(posedge slow_clk);write_instruction(32'hfd842703); 
    @(posedge slow_clk);write_instruction(32'h00ef7f33); 
    @(posedge slow_clk);write_instruction(32'h00ff6f33); 
    @(posedge slow_clk);write_instruction(32'h00000013); 
    @(posedge slow_clk);write_instruction(32'h02c12403); 
    @(posedge slow_clk);write_instruction(32'h03010113); 
    @(posedge slow_clk);write_instruction(32'h00008067); 
    @(posedge slow_clk);write_instruction(32'hffffffff); 
    @(posedge slow_clk);write_instruction(32'hffffffff); 

     $display("Test Results:");
     $display("    PASSES: %d", passes);
     $display("    FAILS : %d", fails);
    #100000
    $display("Finish simulation at time %d", $time);
    $finish;
end

 wrapper dut (
.clk        (clk          ), // Top level system clock input.
.resetn       (resetn       ), // Asynchronous active low reset.
.uart_rxd     (uart_rxd     ), // UART Recieve pin.
.uart_rx_en   (uart_rx_en   ), // Recieve enable
.uart_rx_break(uart_rx_break), // Did we get a BREAK message?
.uart_rx_valid(uart_rx_valid), // Valid data recieved and available.
.uart_rx_data (uart_rx_data ), 
.input_gpio_pins(input_wires), 
.output_gpio_pins(output_wires), 
.write_done(write_done)
); 



endmodule