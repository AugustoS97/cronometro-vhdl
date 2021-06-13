# File saved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:9.0 non-TLS-threadsafe
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 12
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new cronometro_top work:cronometro_top:NOFILE -nosplit
load symbol OBUF hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol alarm work:alarm:NOFILE HIERBOX pin CLK input.left pin EOC input.left pin EOS input.left pin OT input.left pin cuenta_reg[0]_0 input.left pin leds_signal_reg[14]_0 input.left pin lopt output.right pin lopt_1 output.right pin lopt_2 output.right pin lopt_3 output.right pin modo_IBUF input.left pinBus ALM input.left [7:0] pinBus CHANNEL input.left [4:0] pinBus E input.left [0:0] pinBus Q output.right [1:0] pinBus leds_OBUF output.right [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol IBUF hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol BUFG hdi_primitives BUF pin O output pin I input fillcolor 1
load symbol crono work:crono:NOFILE HIERBOX pin CLK input.left pin ce_IBUF input.left pin dp_OBUF output.right pin modo_IBUF input.left pin q_reg[3] output.right pin q_reg[3]_0 output.right pin q_reg[3]_1 output.right pin q_reg[3]_2 output.right pin q_reg[3]_3 output.right pin q_reg[3]_4 output.right pin q_reg[3]_5 output.right pin reset_IBUF input.left pin sw_alarm_on_IBUF input.left pin sw_alarm_reset output.right pin sw_alarm_reset_0 output.right pin sw_alarm_reset_IBUF input.left pinBus E output.right [0:0] pinBus an_OBUF output.right [7:0] pinBus sel_dig input.left [1:0] pinBus time_out_IBUF input.left [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol top_level work:top_level:NOFILE HIERBOX pin CLK input.left pin EOC output.right pin EOS output.right pin LED[0] input.left pin LED[1] input.left pin LED[2] input.left pin LED[3] input.left pin LED[4] input.left pin LED[5] input.left pin LED[6] input.left pin OT output.right pin clk_IBUF input.left pin modo_IBUF input.left pin reset_IBUF input.left pinBus ALM output.right [7:0] pinBus CHANNEL output.right [4:0] pinBus LED_OBUF output.right [6:0] pinBus sel_IBUF input.left [2:0] pinBus sel_dig output.right [1:0] boxcolor 1 fillcolor 2 minwidth 13%
load port ce input -pg 1 -lvl 0 -x 0 -y 1380
load port clk input -pg 1 -lvl 0 -x 0 -y 1310
load port dp output -pg 1 -lvl 7 -x 2100 -y 1720
load port modo input -pg 1 -lvl 0 -x 0 -y 1450
load port reset input -pg 1 -lvl 0 -x 0 -y 1520
load port sw_alarm_on input -pg 1 -lvl 0 -x 0 -y 1590
load port sw_alarm_reset input -pg 1 -lvl 0 -x 0 -y 1660
load portBus LED output [6:0] -attr @name LED[6:0] -pg 1 -lvl 7 -x 2100 -y 40
load portBus an output [7:0] -attr @name an[7:0] -pg 1 -lvl 7 -x 2100 -y 530
load portBus led1_rgb output [1:0] -attr @name led1_rgb[1:0] -pg 1 -lvl 7 -x 2100 -y 1790
load portBus led2_rgb output [1:0] -attr @name led2_rgb[1:0] -pg 1 -lvl 7 -x 2100 -y 1580
load portBus leds output [15:0] -attr @name leds[15:0] -pg 1 -lvl 7 -x 2100 -y 1810
load portBus sel input [2:0] -attr @name sel[2:0] -pg 1 -lvl 0 -x 0 -y 1720
load portBus time_out input [7:0] -attr @name time_out[7:0] -pg 1 -lvl 0 -x 0 -y 1760
load inst LED_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 40
load inst LED_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 110
load inst LED_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 180
load inst LED_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 250
load inst LED_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 320
load inst LED_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 390
load inst LED_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 460
load inst alarm_inst alarm work:alarm:NOFILE -autohide -attr @cell(#000000) alarm -pinAttr lopt_1 @attr n/c -pinAttr lopt_3 @attr n/c -pinBusAttr ALM @name ALM[7:0] -pinBusAttr CHANNEL @name CHANNEL[4:0] -pinBusAttr E @name E -pinBusAttr Q @name Q[1:0] -pinBusAttr leds_OBUF @name leds_OBUF[15:0] -pg 1 -lvl 5 -x 1580 -y 1490
load inst an_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 530
load inst an_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 600
load inst an_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 670
load inst an_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 740
load inst an_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 810
load inst an_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 880
load inst an_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 950
load inst an_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1020
load inst ce_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 1380
load inst clk_IBUF_BUFG_inst BUFG hdi_primitives -attr @cell(#000000) BUFG -pg 1 -lvl 2 -x 210 -y 1310
load inst clk_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 1 -x 40 -y 1310
load inst crono_inst crono work:crono:NOFILE -autohide -attr @cell(#000000) crono -pinBusAttr E @name E -pinBusAttr an_OBUF @name an_OBUF[7:0] -pinBusAttr sel_dig @name sel_dig[1:0] -pinBusAttr time_out_IBUF @name time_out_IBUF[7:0] -pg 1 -lvl 3 -x 700 -y 1430
load inst dp_OBUF_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1720
load inst led1_rgb_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1790
load inst led1_rgb_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1860
load inst led2_rgb_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1580
load inst led2_rgb_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1650
load inst leds_OBUF[0]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1090
load inst leds_OBUF[10]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 2140
load inst leds_OBUF[11]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 2210
load inst leds_OBUF[12]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 2280
load inst leds_OBUF[13]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 2350
load inst leds_OBUF[14]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 2420
load inst leds_OBUF[15]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 2490
load inst leds_OBUF[1]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1160
load inst leds_OBUF[2]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1230
load inst leds_OBUF[3]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1300
load inst leds_OBUF[4]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1370
load inst leds_OBUF[5]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1440
load inst leds_OBUF[6]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1510
load inst leds_OBUF[7]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 1930
load inst leds_OBUF[8]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 2000
load inst leds_OBUF[9]_inst OBUF hdi_primitives -attr @cell(#000000) OBUF -pg 1 -lvl 6 -x 1870 -y 2070
load inst modo_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 1450
load inst reset_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 1520
load inst sel_IBUF[0]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 3 -x 700 -y 1800
load inst sel_IBUF[1]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 3 -x 700 -y 1870
load inst sel_IBUF[2]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 3 -x 700 -y 1940
load inst sw_alarm_on_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 1590
load inst sw_alarm_reset_IBUF_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 1660
load inst time_out_IBUF[0]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 1760
load inst time_out_IBUF[1]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 1830
load inst time_out_IBUF[2]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 1900
load inst time_out_IBUF[3]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 1970
load inst time_out_IBUF[4]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 2040
load inst time_out_IBUF[5]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 2110
load inst time_out_IBUF[6]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 2180
load inst time_out_IBUF[7]_inst IBUF hdi_primitives -attr @cell(#000000) IBUF -pg 1 -lvl 2 -x 210 -y 2250
load inst xadc_inst top_level work:top_level:NOFILE -autohide -attr @cell(#000000) top_level -pinBusAttr ALM @name ALM[7:0] -pinBusAttr CHANNEL @name CHANNEL[4:0] -pinBusAttr LED_OBUF @name LED_OBUF[6:0] -pinBusAttr sel_IBUF @name sel_IBUF[2:0] -pinBusAttr sel_dig @name sel_dig[1:0] -pg 1 -lvl 4 -x 1110 -y 1470
load net CHANNEL[0] -attr @rip CHANNEL[0] -pin alarm_inst CHANNEL[0] -pin xadc_inst CHANNEL[0]
load net CHANNEL[1] -attr @rip CHANNEL[1] -pin alarm_inst CHANNEL[1] -pin xadc_inst CHANNEL[1]
load net CHANNEL[2] -attr @rip CHANNEL[2] -pin alarm_inst CHANNEL[2] -pin xadc_inst CHANNEL[2]
load net CHANNEL[3] -attr @rip CHANNEL[3] -pin alarm_inst CHANNEL[3] -pin xadc_inst CHANNEL[3]
load net CHANNEL[4] -attr @rip CHANNEL[4] -pin alarm_inst CHANNEL[4] -pin xadc_inst CHANNEL[4]
load net EOC -pin alarm_inst EOC -pin xadc_inst EOC
netloc EOC 1 4 1 1350 1560n
load net EOS -pin alarm_inst EOS -pin xadc_inst EOS
netloc EOS 1 4 1 1330 1580n
load net LED[0] -attr @rip 0 -port LED[0] -pin LED_OBUF[0]_inst O
load net LED[1] -attr @rip 1 -port LED[1] -pin LED_OBUF[1]_inst O
load net LED[2] -attr @rip 2 -port LED[2] -pin LED_OBUF[2]_inst O
load net LED[3] -attr @rip 3 -port LED[3] -pin LED_OBUF[3]_inst O
load net LED[4] -attr @rip 4 -port LED[4] -pin LED_OBUF[4]_inst O
load net LED[5] -attr @rip 5 -port LED[5] -pin LED_OBUF[5]_inst O
load net LED[6] -attr @rip 6 -port LED[6] -pin LED_OBUF[6]_inst O
load net LED_OBUF[0] -attr @rip LED_OBUF[0] -pin LED_OBUF[0]_inst I -pin xadc_inst LED_OBUF[0]
load net LED_OBUF[1] -attr @rip LED_OBUF[1] -pin LED_OBUF[1]_inst I -pin xadc_inst LED_OBUF[1]
load net LED_OBUF[2] -attr @rip LED_OBUF[2] -pin LED_OBUF[2]_inst I -pin xadc_inst LED_OBUF[2]
load net LED_OBUF[3] -attr @rip LED_OBUF[3] -pin LED_OBUF[3]_inst I -pin xadc_inst LED_OBUF[3]
load net LED_OBUF[4] -attr @rip LED_OBUF[4] -pin LED_OBUF[4]_inst I -pin xadc_inst LED_OBUF[4]
load net LED_OBUF[5] -attr @rip LED_OBUF[5] -pin LED_OBUF[5]_inst I -pin xadc_inst LED_OBUF[5]
load net LED_OBUF[6] -attr @rip LED_OBUF[6] -pin LED_OBUF[6]_inst I -pin xadc_inst LED_OBUF[6]
load net OT -pin alarm_inst OT -pin xadc_inst OT
netloc OT 1 4 1 N 1620
load net alarm[0] -attr @rip ALM[0] -pin alarm_inst ALM[0] -pin xadc_inst ALM[0]
load net alarm[1] -attr @rip ALM[1] -pin alarm_inst ALM[1] -pin xadc_inst ALM[1]
load net alarm[2] -attr @rip ALM[2] -pin alarm_inst ALM[2] -pin xadc_inst ALM[2]
load net alarm[3] -attr @rip ALM[3] -pin alarm_inst ALM[3] -pin xadc_inst ALM[3]
load net alarm[4] -attr @rip ALM[4] -pin alarm_inst ALM[4] -pin xadc_inst ALM[4]
load net alarm[5] -attr @rip ALM[5] -pin alarm_inst ALM[5] -pin xadc_inst ALM[5]
load net alarm[6] -attr @rip ALM[6] -pin alarm_inst ALM[6] -pin xadc_inst ALM[6]
load net alarm[7] -attr @rip ALM[7] -pin alarm_inst ALM[7] -pin xadc_inst ALM[7]
load net alarma_signal -attr @rip E[0] -pin alarm_inst E[0] -pin crono_inst E[0]
netloc alarma_signal 1 3 2 1000J 1380 1430
load net an[0] -attr @rip 0 -port an[0] -pin an_OBUF[0]_inst O
load net an[1] -attr @rip 1 -port an[1] -pin an_OBUF[1]_inst O
load net an[2] -attr @rip 2 -port an[2] -pin an_OBUF[2]_inst O
load net an[3] -attr @rip 3 -port an[3] -pin an_OBUF[3]_inst O
load net an[4] -attr @rip 4 -port an[4] -pin an_OBUF[4]_inst O
load net an[5] -attr @rip 5 -port an[5] -pin an_OBUF[5]_inst O
load net an[6] -attr @rip 6 -port an[6] -pin an_OBUF[6]_inst O
load net an[7] -attr @rip 7 -port an[7] -pin an_OBUF[7]_inst O
load net an_OBUF[0] -attr @rip an_OBUF[0] -pin an_OBUF[0]_inst I -pin crono_inst an_OBUF[0]
load net an_OBUF[1] -attr @rip an_OBUF[1] -pin an_OBUF[1]_inst I -pin crono_inst an_OBUF[1]
load net an_OBUF[2] -attr @rip an_OBUF[2] -pin an_OBUF[2]_inst I -pin crono_inst an_OBUF[2]
load net an_OBUF[3] -attr @rip an_OBUF[3] -pin an_OBUF[3]_inst I -pin crono_inst an_OBUF[3]
load net an_OBUF[4] -attr @rip an_OBUF[4] -pin an_OBUF[4]_inst I -pin crono_inst an_OBUF[4]
load net an_OBUF[5] -attr @rip an_OBUF[5] -pin an_OBUF[5]_inst I -pin crono_inst an_OBUF[5]
load net an_OBUF[6] -attr @rip an_OBUF[6] -pin an_OBUF[6]_inst I -pin crono_inst an_OBUF[6]
load net an_OBUF[7] -attr @rip an_OBUF[7] -pin an_OBUF[7]_inst I -pin crono_inst an_OBUF[7]
load net ce -port ce -pin ce_IBUF_inst I
netloc ce 1 0 2 NJ 1380 NJ
load net ce_IBUF -pin ce_IBUF_inst O -pin crono_inst ce_IBUF
netloc ce_IBUF 1 2 1 500J 1380n
load net clk -port clk -pin clk_IBUF_inst I
netloc clk 1 0 1 NJ 1310
load net clk_IBUF -pin clk_IBUF_BUFG_inst I -pin clk_IBUF_inst O -pin xadc_inst clk_IBUF
netloc clk_IBUF 1 1 3 170 1700 NJ 1700 960J
load net clk_IBUF_BUFG -pin alarm_inst CLK -pin clk_IBUF_BUFG_inst O -pin crono_inst CLK -pin xadc_inst CLK
netloc clk_IBUF_BUFG 1 2 3 540 1380 980 1420 1410
load net crono_inst_n_10 -pin crono_inst q_reg[3] -pin xadc_inst LED[0]
netloc crono_inst_n_10 1 3 1 N 1500
load net crono_inst_n_11 -pin crono_inst q_reg[3]_0 -pin xadc_inst LED[1]
netloc crono_inst_n_11 1 3 1 N 1520
load net crono_inst_n_12 -pin crono_inst q_reg[3]_1 -pin xadc_inst LED[2]
netloc crono_inst_n_12 1 3 1 N 1540
load net crono_inst_n_13 -pin crono_inst q_reg[3]_2 -pin xadc_inst LED[3]
netloc crono_inst_n_13 1 3 1 N 1560
load net crono_inst_n_14 -pin crono_inst q_reg[3]_3 -pin xadc_inst LED[4]
netloc crono_inst_n_14 1 3 1 N 1580
load net crono_inst_n_15 -pin crono_inst q_reg[3]_4 -pin xadc_inst LED[5]
netloc crono_inst_n_15 1 3 1 N 1600
load net crono_inst_n_16 -pin crono_inst q_reg[3]_5 -pin xadc_inst LED[6]
netloc crono_inst_n_16 1 3 1 N 1620
load net crono_inst_n_17 -pin alarm_inst cuenta_reg[0]_0 -pin crono_inst sw_alarm_reset
netloc crono_inst_n_17 1 3 2 940J 1760 1390
load net crono_inst_n_18 -pin alarm_inst leds_signal_reg[14]_0 -pin crono_inst sw_alarm_reset_0
netloc crono_inst_n_18 1 3 2 920J 1740 1410
load net dp -port dp -pin dp_OBUF_inst O
netloc dp 1 6 1 NJ 1720
load net dp_OBUF -pin crono_inst dp_OBUF -pin dp_OBUF_inst I
netloc dp_OBUF 1 3 3 940J 1400 1370J 1720 NJ
load net led1_rgb[0] -attr @rip 0 -port led1_rgb[0] -pin led1_rgb_OBUF[0]_inst O
load net led1_rgb[1] -attr @rip 1 -port led1_rgb[1] -pin led1_rgb_OBUF[1]_inst O
load net led2_rgb[0] -attr @rip 0 -port led2_rgb[0] -pin led2_rgb_OBUF[0]_inst O
load net led2_rgb[1] -attr @rip 1 -port led2_rgb[1] -pin led2_rgb_OBUF[1]_inst O
load net led2_rgb_OBUF[0] -attr @rip Q[0] -pin alarm_inst Q[0] -pin led2_rgb_OBUF[0]_inst I
load net led2_rgb_OBUF[1] -attr @rip Q[1] -pin alarm_inst Q[1] -pin led2_rgb_OBUF[1]_inst I
load net leds[0] -attr @rip 0 -port leds[0] -pin leds_OBUF[0]_inst O
load net leds[10] -attr @rip 10 -port leds[10] -pin leds_OBUF[10]_inst O
load net leds[11] -attr @rip 11 -port leds[11] -pin leds_OBUF[11]_inst O
load net leds[12] -attr @rip 12 -port leds[12] -pin leds_OBUF[12]_inst O
load net leds[13] -attr @rip 13 -port leds[13] -pin leds_OBUF[13]_inst O
load net leds[14] -attr @rip 14 -port leds[14] -pin leds_OBUF[14]_inst O
load net leds[15] -attr @rip 15 -port leds[15] -pin leds_OBUF[15]_inst O
load net leds[1] -attr @rip 1 -port leds[1] -pin leds_OBUF[1]_inst O
load net leds[2] -attr @rip 2 -port leds[2] -pin leds_OBUF[2]_inst O
load net leds[3] -attr @rip 3 -port leds[3] -pin leds_OBUF[3]_inst O
load net leds[4] -attr @rip 4 -port leds[4] -pin leds_OBUF[4]_inst O
load net leds[5] -attr @rip 5 -port leds[5] -pin leds_OBUF[5]_inst O
load net leds[6] -attr @rip 6 -port leds[6] -pin leds_OBUF[6]_inst O
load net leds[7] -attr @rip 7 -port leds[7] -pin leds_OBUF[7]_inst O
load net leds[8] -attr @rip 8 -port leds[8] -pin leds_OBUF[8]_inst O
load net leds[9] -attr @rip 9 -port leds[9] -pin leds_OBUF[9]_inst O
load net leds_OBUF[0] -attr @rip leds_OBUF[0] -pin alarm_inst leds_OBUF[0] -pin leds_OBUF[0]_inst I
load net leds_OBUF[10] -attr @rip leds_OBUF[10] -pin alarm_inst leds_OBUF[10] -pin leds_OBUF[10]_inst I
load net leds_OBUF[11] -attr @rip leds_OBUF[11] -pin alarm_inst leds_OBUF[11] -pin leds_OBUF[11]_inst I
load net leds_OBUF[12] -attr @rip leds_OBUF[12] -pin alarm_inst leds_OBUF[12] -pin leds_OBUF[12]_inst I
load net leds_OBUF[13] -attr @rip leds_OBUF[13] -pin alarm_inst leds_OBUF[13] -pin leds_OBUF[13]_inst I
load net leds_OBUF[14] -attr @rip leds_OBUF[14] -pin alarm_inst leds_OBUF[14] -pin leds_OBUF[14]_inst I
load net leds_OBUF[15] -attr @rip leds_OBUF[15] -pin alarm_inst leds_OBUF[15] -pin leds_OBUF[15]_inst I
load net leds_OBUF[1] -attr @rip leds_OBUF[1] -pin alarm_inst leds_OBUF[1] -pin leds_OBUF[1]_inst I
load net leds_OBUF[2] -attr @rip leds_OBUF[2] -pin alarm_inst leds_OBUF[2] -pin leds_OBUF[2]_inst I
load net leds_OBUF[3] -attr @rip leds_OBUF[3] -pin alarm_inst leds_OBUF[3] -pin leds_OBUF[3]_inst I
load net leds_OBUF[4] -attr @rip leds_OBUF[4] -pin alarm_inst leds_OBUF[4] -pin leds_OBUF[4]_inst I
load net leds_OBUF[5] -attr @rip leds_OBUF[5] -pin alarm_inst leds_OBUF[5] -pin leds_OBUF[5]_inst I
load net leds_OBUF[6] -attr @rip leds_OBUF[6] -pin alarm_inst leds_OBUF[6] -pin leds_OBUF[6]_inst I
load net leds_OBUF[7] -attr @rip leds_OBUF[7] -pin alarm_inst leds_OBUF[7] -pin leds_OBUF[7]_inst I
load net leds_OBUF[8] -attr @rip leds_OBUF[8] -pin alarm_inst leds_OBUF[8] -pin leds_OBUF[8]_inst I
load net leds_OBUF[9] -attr @rip leds_OBUF[9] -pin alarm_inst leds_OBUF[9] -pin leds_OBUF[9]_inst I
load net lopt -pin alarm_inst lopt -pin led1_rgb_OBUF[0]_inst I
netloc lopt 1 5 1 1790 1600n
load net lopt_2 -pin alarm_inst lopt_2 -pin led1_rgb_OBUF[1]_inst I
netloc lopt_2 1 5 1 1770 1620n
load net modo -port modo -pin modo_IBUF_inst I
netloc modo 1 0 2 NJ 1450 NJ
load net modo_IBUF -pin alarm_inst modo_IBUF -pin crono_inst modo_IBUF -pin modo_IBUF_inst O -pin xadc_inst modo_IBUF
netloc modo_IBUF 1 2 3 480 1720 1000 1800 1430
load net reset -port reset -pin reset_IBUF_inst I
netloc reset 1 0 2 NJ 1520 NJ
load net reset_IBUF -pin crono_inst reset_IBUF -pin reset_IBUF_inst O -pin xadc_inst reset_IBUF
netloc reset_IBUF 1 2 2 440 1740 900J
load net sel[0] -attr @rip sel[0] -port sel[0] -pin sel_IBUF[0]_inst I
load net sel[1] -attr @rip sel[1] -port sel[1] -pin sel_IBUF[1]_inst I
load net sel[2] -attr @rip sel[2] -port sel[2] -pin sel_IBUF[2]_inst I
load net sel_IBUF[0] -attr @rip 0 -pin sel_IBUF[0]_inst O -pin xadc_inst sel_IBUF[0]
load net sel_IBUF[1] -attr @rip 1 -pin sel_IBUF[1]_inst O -pin xadc_inst sel_IBUF[1]
load net sel_IBUF[2] -attr @rip 2 -pin sel_IBUF[2]_inst O -pin xadc_inst sel_IBUF[2]
load net sel_dig[0] -attr @rip sel_dig[0] -pin crono_inst sel_dig[0] -pin xadc_inst sel_dig[0]
load net sel_dig[1] -attr @rip sel_dig[1] -pin crono_inst sel_dig[1] -pin xadc_inst sel_dig[1]
load net sw_alarm_on -port sw_alarm_on -pin sw_alarm_on_IBUF_inst I
netloc sw_alarm_on 1 0 2 NJ 1590 NJ
load net sw_alarm_on_IBUF -pin crono_inst sw_alarm_on_IBUF -pin sw_alarm_on_IBUF_inst O
netloc sw_alarm_on_IBUF 1 2 1 460J 1580n
load net sw_alarm_reset -port sw_alarm_reset -pin sw_alarm_reset_IBUF_inst I
netloc sw_alarm_reset 1 0 2 NJ 1660 NJ
load net sw_alarm_reset_IBUF -pin crono_inst sw_alarm_reset_IBUF -pin sw_alarm_reset_IBUF_inst O
netloc sw_alarm_reset_IBUF 1 2 1 500J 1600n
load net time_out[0] -attr @rip time_out[0] -port time_out[0] -pin time_out_IBUF[0]_inst I
load net time_out[1] -attr @rip time_out[1] -port time_out[1] -pin time_out_IBUF[1]_inst I
load net time_out[2] -attr @rip time_out[2] -port time_out[2] -pin time_out_IBUF[2]_inst I
load net time_out[3] -attr @rip time_out[3] -port time_out[3] -pin time_out_IBUF[3]_inst I
load net time_out[4] -attr @rip time_out[4] -port time_out[4] -pin time_out_IBUF[4]_inst I
load net time_out[5] -attr @rip time_out[5] -port time_out[5] -pin time_out_IBUF[5]_inst I
load net time_out[6] -attr @rip time_out[6] -port time_out[6] -pin time_out_IBUF[6]_inst I
load net time_out[7] -attr @rip time_out[7] -port time_out[7] -pin time_out_IBUF[7]_inst I
load net time_out_IBUF[0] -attr @rip 0 -pin crono_inst time_out_IBUF[0] -pin time_out_IBUF[0]_inst O
load net time_out_IBUF[1] -attr @rip 1 -pin crono_inst time_out_IBUF[1] -pin time_out_IBUF[1]_inst O
load net time_out_IBUF[2] -attr @rip 2 -pin crono_inst time_out_IBUF[2] -pin time_out_IBUF[2]_inst O
load net time_out_IBUF[3] -attr @rip 3 -pin crono_inst time_out_IBUF[3] -pin time_out_IBUF[3]_inst O
load net time_out_IBUF[4] -attr @rip 4 -pin crono_inst time_out_IBUF[4] -pin time_out_IBUF[4]_inst O
load net time_out_IBUF[5] -attr @rip 5 -pin crono_inst time_out_IBUF[5] -pin time_out_IBUF[5]_inst O
load net time_out_IBUF[6] -attr @rip 6 -pin crono_inst time_out_IBUF[6] -pin time_out_IBUF[6]_inst O
load net time_out_IBUF[7] -attr @rip 7 -pin crono_inst time_out_IBUF[7] -pin time_out_IBUF[7]_inst O
load netBundle @sel 3 sel[2] sel[1] sel[0] -autobundled
netbloc @sel 1 0 3 NJ 1720 NJ 1720 420
load netBundle @time_out 8 time_out[7] time_out[6] time_out[5] time_out[4] time_out[3] time_out[2] time_out[1] time_out[0] -autobundled
netbloc @time_out 1 0 2 NJ 1760 170
load netBundle @LED 7 LED[6] LED[5] LED[4] LED[3] LED[2] LED[1] LED[0] -autobundled
netbloc @LED 1 6 1 2060 40n
load netBundle @an 8 an[7] an[6] an[5] an[4] an[3] an[2] an[1] an[0] -autobundled
netbloc @an 1 6 1 2060 530n
load netBundle @led1_rgb 2 led1_rgb[1] led1_rgb[0] -autobundled
netbloc @led1_rgb 1 6 1 2080 1790n
load netBundle @led2_rgb 2 led2_rgb[1] led2_rgb[0] -autobundled
netbloc @led2_rgb 1 6 1 2080 1580n
load netBundle @leds 16 leds[15] leds[14] leds[13] leds[12] leds[11] leds[10] leds[9] leds[8] leds[7] leds[6] leds[5] leds[4] leds[3] leds[2] leds[1] leds[0] -autobundled
netbloc @leds 1 6 1 2060 1090n
load netBundle @led2_rgb_OBUF 2 led2_rgb_OBUF[1] led2_rgb_OBUF[0] -autobundled
netbloc @led2_rgb_OBUF 1 5 1 1830 1560n
load netBundle @leds_OBUF 16 leds_OBUF[15] leds_OBUF[14] leds_OBUF[13] leds_OBUF[12] leds_OBUF[11] leds_OBUF[10] leds_OBUF[9] leds_OBUF[8] leds_OBUF[7] leds_OBUF[6] leds_OBUF[5] leds_OBUF[4] leds_OBUF[3] leds_OBUF[2] leds_OBUF[1] leds_OBUF[0] -autobundled
netbloc @leds_OBUF 1 5 1 1810 1090n
load netBundle @an_OBUF 8 an_OBUF[7] an_OBUF[6] an_OBUF[5] an_OBUF[4] an_OBUF[3] an_OBUF[2] an_OBUF[1] an_OBUF[0] -autobundled
netbloc @an_OBUF 1 3 3 900 1360 NJ 1360 1790
load netBundle @alarm 8 alarm[7] alarm[6] alarm[5] alarm[4] alarm[3] alarm[2] alarm[1] alarm[0] -autobundled
netbloc @alarm 1 4 1 1290 1500n
load netBundle @CHANNEL 5 CHANNEL[4] CHANNEL[3] CHANNEL[2] CHANNEL[1] CHANNEL[0] -autobundled
netbloc @CHANNEL 1 4 1 1350 1520n
load netBundle @LED_OBUF 7 LED_OBUF[6] LED_OBUF[5] LED_OBUF[4] LED_OBUF[3] LED_OBUF[2] LED_OBUF[1] LED_OBUF[0] -autobundled
netbloc @LED_OBUF 1 4 2 1310 1340 1770
load netBundle @sel_dig 2 sel_dig[1] sel_dig[0] -autobundled
netbloc @sel_dig 1 2 3 540 1760 900J 1780 1310
load netBundle @time_out_IBUF 8 time_out_IBUF[7] time_out_IBUF[6] time_out_IBUF[5] time_out_IBUF[4] time_out_IBUF[3] time_out_IBUF[2] time_out_IBUF[1] time_out_IBUF[0] -autobundled
netbloc @time_out_IBUF 1 2 1 520 1620n
load netBundle @sel_IBUF 3 sel_IBUF[2] sel_IBUF[1] sel_IBUF[0] -autobundled
netbloc @sel_IBUF 1 3 1 980 1700n
levelinfo -pg 1 0 40 210 700 1110 1580 1870 2100
pagesize -pg 1 -db -bbox -sgen -150 0 2240 2530
show
zoom 0.752489
scrollpos -113 1285
#
# initialize ictrl to current module cronometro_top work:cronometro_top:NOFILE
ictrl init topinfo |
