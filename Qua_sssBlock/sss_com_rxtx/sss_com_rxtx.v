// ���������������� ����������������
// 38400���/���
// 8���, ��� ��������
  
module sss_com_rxtx(
    input wire reset,
    input wire clk5,    //5mHz
    input wire rx,
    input wire [7:0]sbyte,
    input wire send,
    output reg [7:0]rx_byte,
    output reg rbyte_ready,
    output reg tx,
    output reg busy 
    );

//�������� ������ � �������� ������������ ���� ����������
//��� ���������� �� ���. �������� ������� 5Mhz � �������� �������� 38400
//��� 5000000/38400 = 130 
parameter RCONST = 128;

reg [7:0]cnt;

//������� ������������ ������������ ����
always @(posedge clk5 or posedge reset)
begin
    if(reset)
        cnt <= 0;
    else
    begin
        if(cnt == RCONST || num_bits==9)
            cnt <= 0;
        else
            cnt <= cnt + 1'b1;
    end
end

reg [3:0]num_bits; //������� �������� ���
reg [7:0]shift_reg; //��������� ������� ���������

//��������
always @(posedge clk5 or posedge reset)
begin
    if(reset)
    begin
        num_bits <= 0;
        shift_reg <= 0;
    end
    else
    begin
        //����� ���������� ����� RX ������ � ����
        if(num_bits==9 && rx==1'b0)
            num_bits <= 0;
        else
        if(cnt == RCONST)
            num_bits <= num_bits + 1'b1;
        
        //�������� ��������� ���� ���-�� ����������
        if(cnt == RCONST/2)
            shift_reg <= {rx,shift_reg[7:1]};
    end
end

//���������� �������� ���� �� ��������� ������
always @(posedge clk5 or posedge reset)
    if(reset)
    begin
        rx_byte <= 0;
    end
    else
    begin    
    if(num_bits==9)
        rx_byte <= shift_reg[7:0];
    end

reg [1:0]flag;
always @(posedge clk5 or posedge reset)
    if(reset)
        flag <= 2'b00;
    else
        flag <= {flag[0],(num_bits==9)};

//������ ���������� ��������� �����        
always @*
    rbyte_ready = (flag==2'b01);
      

//����������
reg [8:0]send_reg;
reg [3:0]send_num;
reg [7:0]send_cnt;

wire send_time; assign send_time = send_cnt == RCONST;

always @(posedge clk5 or posedge reset)
begin
    if(reset)
    begin
        send_reg <= 0;
        send_num <= 0;
        send_cnt <= 0;
    end
    else
    begin
        //�������� ���������� �� ������� send
        if(send)
            send_cnt <= 0;
        else
            if(send_time)
                send_cnt <= 0;
            else
                send_cnt <= send_cnt + 1'b1;
        
        if(send)
        begin
            //��������� ������������ ���� � ��������� ������� �� ������� send
            send_reg <= {sbyte,1'b0};
            send_num <= 0;
        end
        else
        if(send_time && send_num!=10)
        begin
            //��������� ������������ ����
            send_reg <= {1'b1,send_reg[8:1]};
            send_num <= send_num + 1'b1;
        end
    end
end

always @*
begin
    busy = send_num!=10;
    tx = send_reg[0];
end
    
endmodule