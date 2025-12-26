/*
模块名称：key_filter
模块功能：消除按键按下以及抬起时所带来的抖动。
作者：郝旭帅
邮箱：746833924@qq.com
*/
module key_filter (clk, rst_n, key_n, click_n);

  input clk;
  input rst_n;
  input key_n;

  output reg click_n;

parameter MASK_TIME = 500_000;//驱动时钟为50M，10ms
//为500_000个周期

  reg [22:0] cnt;
  reg state;

  localparam s0 = 1'b0,
          s1 = 1'b1;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n)
        begin
          click_n <= 1'b1;
          cnt <= 19'd0;
          state <= s0;
        end
      else
        begin
          case (state)
            s0 : begin
                if (key_n == 1'b0)
                  begin
                    if (cnt < MASK_TIME - 1)
                      begin
                        cnt <= cnt + 1'b1;
                      end
                    else
                      begin
                        state <= s1;
                        cnt <= 23'd0;
                        click_n <= 1'b0;
                      end
                  end
                else
                  begin
                    click_n <= 1'b1;
                    cnt <= 23'd0;
                    state <= s0;
                  end
              end

            s1 : begin
                if (key_n == 1'b1)
                  begin
                    if (cnt < MASK_TIME - 1)
                      begin
                        cnt <= cnt + 1'b1;
                      end
                    else
                      begin
                        click_n <= 1'b1;
                        state <= s0;
                        cnt <= 23'd0;
                      end
                  end
                else
                  begin
                    click_n <= 1'b0;
                    cnt <= 23'd0;
                    state <= s1;
                  end
              end

            default : state <= s0;

          endcase
        end
    end

endmodule