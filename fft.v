`timescale 1 ns / 1 ps

`define WIDTH 1024
`define SIZE 10
`define HALF_WIDTH (`WIDTH / 2)

`define DATA_WIDTH 32
`define TWIDDLE_WIDTH 16

`define OUT_WIDTH (`DATA_WIDTH + `TWIDDLE_WIDTH - 1 + `SIZE)


module twiddle_factors(output logic signed[15:0]twiddle_real[`HALF_WIDTH-1:0], 
                        output logic signed[15:0]twiddle_imag[`HALF_WIDTH-1:0]);
    initial begin
        twiddle_real[0] = 16'sd32767; twiddle_imag[0] = 16'sd0;
        twiddle_real[1] = 16'sd32767; twiddle_imag[1] = -16'sd201;
        twiddle_real[2] = 16'sd32766; twiddle_imag[2] = -16'sd402;
        twiddle_real[3] = 16'sd32762; twiddle_imag[3] = -16'sd603;
        twiddle_real[4] = 16'sd32758; twiddle_imag[4] = -16'sd804;
        twiddle_real[5] = 16'sd32753; twiddle_imag[5] = -16'sd1005;
        twiddle_real[6] = 16'sd32746; twiddle_imag[6] = -16'sd1206;
        twiddle_real[7] = 16'sd32738; twiddle_imag[7] = -16'sd1407;
        twiddle_real[8] = 16'sd32729; twiddle_imag[8] = -16'sd1608;
        twiddle_real[9] = 16'sd32718; twiddle_imag[9] = -16'sd1809;
        twiddle_real[10] = 16'sd32706; twiddle_imag[10] = -16'sd2009;
        twiddle_real[11] = 16'sd32693; twiddle_imag[11] = -16'sd2210;
        twiddle_real[12] = 16'sd32679; twiddle_imag[12] = -16'sd2411;
        twiddle_real[13] = 16'sd32664; twiddle_imag[13] = -16'sd2611;
        twiddle_real[14] = 16'sd32647; twiddle_imag[14] = -16'sd2811;
        twiddle_real[15] = 16'sd32629; twiddle_imag[15] = -16'sd3012;
        twiddle_real[16] = 16'sd32610; twiddle_imag[16] = -16'sd3212;
        twiddle_real[17] = 16'sd32590; twiddle_imag[17] = -16'sd3412;
        twiddle_real[18] = 16'sd32568; twiddle_imag[18] = -16'sd3612;
        twiddle_real[19] = 16'sd32546; twiddle_imag[19] = -16'sd3812;
        twiddle_real[20] = 16'sd32522; twiddle_imag[20] = -16'sd4011;
        twiddle_real[21] = 16'sd32496; twiddle_imag[21] = -16'sd4211;
        twiddle_real[22] = 16'sd32470; twiddle_imag[22] = -16'sd4410;
        twiddle_real[23] = 16'sd32442; twiddle_imag[23] = -16'sd4609;
        twiddle_real[24] = 16'sd32413; twiddle_imag[24] = -16'sd4808;
        twiddle_real[25] = 16'sd32383; twiddle_imag[25] = -16'sd5007;
        twiddle_real[26] = 16'sd32352; twiddle_imag[26] = -16'sd5205;
        twiddle_real[27] = 16'sd32319; twiddle_imag[27] = -16'sd5404;
        twiddle_real[28] = 16'sd32286; twiddle_imag[28] = -16'sd5602;
        twiddle_real[29] = 16'sd32251; twiddle_imag[29] = -16'sd5800;
        twiddle_real[30] = 16'sd32214; twiddle_imag[30] = -16'sd5998;
        twiddle_real[31] = 16'sd32177; twiddle_imag[31] = -16'sd6195;
        twiddle_real[32] = 16'sd32138; twiddle_imag[32] = -16'sd6393;
        twiddle_real[33] = 16'sd32099; twiddle_imag[33] = -16'sd6590;
        twiddle_real[34] = 16'sd32058; twiddle_imag[34] = -16'sd6787;
        twiddle_real[35] = 16'sd32015; twiddle_imag[35] = -16'sd6983;
        twiddle_real[36] = 16'sd31972; twiddle_imag[36] = -16'sd7180;
        twiddle_real[37] = 16'sd31927; twiddle_imag[37] = -16'sd7376;
        twiddle_real[38] = 16'sd31881; twiddle_imag[38] = -16'sd7571;
        twiddle_real[39] = 16'sd31834; twiddle_imag[39] = -16'sd7767;
        twiddle_real[40] = 16'sd31786; twiddle_imag[40] = -16'sd7962;
        twiddle_real[41] = 16'sd31737; twiddle_imag[41] = -16'sd8157;
        twiddle_real[42] = 16'sd31686; twiddle_imag[42] = -16'sd8351;
        twiddle_real[43] = 16'sd31634; twiddle_imag[43] = -16'sd8546;
        twiddle_real[44] = 16'sd31581; twiddle_imag[44] = -16'sd8740;
        twiddle_real[45] = 16'sd31527; twiddle_imag[45] = -16'sd8933;
        twiddle_real[46] = 16'sd31471; twiddle_imag[46] = -16'sd9127;
        twiddle_real[47] = 16'sd31415; twiddle_imag[47] = -16'sd9319;
        twiddle_real[48] = 16'sd31357; twiddle_imag[48] = -16'sd9512;
        twiddle_real[49] = 16'sd31298; twiddle_imag[49] = -16'sd9704;
        twiddle_real[50] = 16'sd31238; twiddle_imag[50] = -16'sd9896;
        twiddle_real[51] = 16'sd31177; twiddle_imag[51] = -16'sd10088;
        twiddle_real[52] = 16'sd31114; twiddle_imag[52] = -16'sd10279;
        twiddle_real[53] = 16'sd31050; twiddle_imag[53] = -16'sd10469;
        twiddle_real[54] = 16'sd30986; twiddle_imag[54] = -16'sd10660;
        twiddle_real[55] = 16'sd30920; twiddle_imag[55] = -16'sd10850;
        twiddle_real[56] = 16'sd30853; twiddle_imag[56] = -16'sd11039;
        twiddle_real[57] = 16'sd30784; twiddle_imag[57] = -16'sd11228;
        twiddle_real[58] = 16'sd30715; twiddle_imag[58] = -16'sd11417;
        twiddle_real[59] = 16'sd30644; twiddle_imag[59] = -16'sd11605;
        twiddle_real[60] = 16'sd30572; twiddle_imag[60] = -16'sd11793;
        twiddle_real[61] = 16'sd30499; twiddle_imag[61] = -16'sd11980;
        twiddle_real[62] = 16'sd30425; twiddle_imag[62] = -16'sd12167;
        twiddle_real[63] = 16'sd30350; twiddle_imag[63] = -16'sd12354;
        twiddle_real[64] = 16'sd30274; twiddle_imag[64] = -16'sd12540;
        twiddle_real[65] = 16'sd30196; twiddle_imag[65] = -16'sd12725;
        twiddle_real[66] = 16'sd30118; twiddle_imag[66] = -16'sd12910;
        twiddle_real[67] = 16'sd30038; twiddle_imag[67] = -16'sd13095;
        twiddle_real[68] = 16'sd29957; twiddle_imag[68] = -16'sd13279;
        twiddle_real[69] = 16'sd29875; twiddle_imag[69] = -16'sd13463;
        twiddle_real[70] = 16'sd29792; twiddle_imag[70] = -16'sd13646;
        twiddle_real[71] = 16'sd29707; twiddle_imag[71] = -16'sd13828;
        twiddle_real[72] = 16'sd29622; twiddle_imag[72] = -16'sd14010;
        twiddle_real[73] = 16'sd29535; twiddle_imag[73] = -16'sd14192;
        twiddle_real[74] = 16'sd29448; twiddle_imag[74] = -16'sd14373;
        twiddle_real[75] = 16'sd29359; twiddle_imag[75] = -16'sd14553;
        twiddle_real[76] = 16'sd29269; twiddle_imag[76] = -16'sd14733;
        twiddle_real[77] = 16'sd29178; twiddle_imag[77] = -16'sd14912;
        twiddle_real[78] = 16'sd29086; twiddle_imag[78] = -16'sd15091;
        twiddle_real[79] = 16'sd28993; twiddle_imag[79] = -16'sd15269;
        twiddle_real[80] = 16'sd28899; twiddle_imag[80] = -16'sd15447;
        twiddle_real[81] = 16'sd28803; twiddle_imag[81] = -16'sd15624;
        twiddle_real[82] = 16'sd28707; twiddle_imag[82] = -16'sd15800;
        twiddle_real[83] = 16'sd28610; twiddle_imag[83] = -16'sd15976;
        twiddle_real[84] = 16'sd28511; twiddle_imag[84] = -16'sd16151;
        twiddle_real[85] = 16'sd28411; twiddle_imag[85] = -16'sd16326;
        twiddle_real[86] = 16'sd28311; twiddle_imag[86] = -16'sd16500;
        twiddle_real[87] = 16'sd28209; twiddle_imag[87] = -16'sd16673;
        twiddle_real[88] = 16'sd28106; twiddle_imag[88] = -16'sd16846;
        twiddle_real[89] = 16'sd28002; twiddle_imag[89] = -16'sd17018;
        twiddle_real[90] = 16'sd27897; twiddle_imag[90] = -16'sd17190;
        twiddle_real[91] = 16'sd27791; twiddle_imag[91] = -16'sd17361;
        twiddle_real[92] = 16'sd27684; twiddle_imag[92] = -16'sd17531;
        twiddle_real[93] = 16'sd27576; twiddle_imag[93] = -16'sd17700;
        twiddle_real[94] = 16'sd27467; twiddle_imag[94] = -16'sd17869;
        twiddle_real[95] = 16'sd27357; twiddle_imag[95] = -16'sd18037;
        twiddle_real[96] = 16'sd27246; twiddle_imag[96] = -16'sd18205;
        twiddle_real[97] = 16'sd27133; twiddle_imag[97] = -16'sd18372;
        twiddle_real[98] = 16'sd27020; twiddle_imag[98] = -16'sd18538;
        twiddle_real[99] = 16'sd26906; twiddle_imag[99] = -16'sd18703;
        twiddle_real[100] = 16'sd26791; twiddle_imag[100] = -16'sd18868;
        twiddle_real[101] = 16'sd26674; twiddle_imag[101] = -16'sd19032;
        twiddle_real[102] = 16'sd26557; twiddle_imag[102] = -16'sd19195;
        twiddle_real[103] = 16'sd26439; twiddle_imag[103] = -16'sd19358;
        twiddle_real[104] = 16'sd26320; twiddle_imag[104] = -16'sd19520;
        twiddle_real[105] = 16'sd26199; twiddle_imag[105] = -16'sd19681;
        twiddle_real[106] = 16'sd26078; twiddle_imag[106] = -16'sd19841;
        twiddle_real[107] = 16'sd25956; twiddle_imag[107] = -16'sd20001;
        twiddle_real[108] = 16'sd25833; twiddle_imag[108] = -16'sd20160;
        twiddle_real[109] = 16'sd25708; twiddle_imag[109] = -16'sd20318;
        twiddle_real[110] = 16'sd25583; twiddle_imag[110] = -16'sd20475;
        twiddle_real[111] = 16'sd25457; twiddle_imag[111] = -16'sd20632;
        twiddle_real[112] = 16'sd25330; twiddle_imag[112] = -16'sd20788;
        twiddle_real[113] = 16'sd25202; twiddle_imag[113] = -16'sd20943;
        twiddle_real[114] = 16'sd25073; twiddle_imag[114] = -16'sd21097;
        twiddle_real[115] = 16'sd24943; twiddle_imag[115] = -16'sd21251;
        twiddle_real[116] = 16'sd24812; twiddle_imag[116] = -16'sd21403;
        twiddle_real[117] = 16'sd24680; twiddle_imag[117] = -16'sd21555;
        twiddle_real[118] = 16'sd24548; twiddle_imag[118] = -16'sd21706;
        twiddle_real[119] = 16'sd24414; twiddle_imag[119] = -16'sd21856;
        twiddle_real[120] = 16'sd24279; twiddle_imag[120] = -16'sd22006;
        twiddle_real[121] = 16'sd24144; twiddle_imag[121] = -16'sd22154;
        twiddle_real[122] = 16'sd24008; twiddle_imag[122] = -16'sd22302;
        twiddle_real[123] = 16'sd23870; twiddle_imag[123] = -16'sd22449;
        twiddle_real[124] = 16'sd23732; twiddle_imag[124] = -16'sd22595;
        twiddle_real[125] = 16'sd23593; twiddle_imag[125] = -16'sd22740;
        twiddle_real[126] = 16'sd23453; twiddle_imag[126] = -16'sd22884;
        twiddle_real[127] = 16'sd23312; twiddle_imag[127] = -16'sd23028;
        twiddle_real[128] = 16'sd23170; twiddle_imag[128] = -16'sd23170;
        twiddle_real[129] = 16'sd23028; twiddle_imag[129] = -16'sd23312;
        twiddle_real[130] = 16'sd22884; twiddle_imag[130] = -16'sd23453;
        twiddle_real[131] = 16'sd22740; twiddle_imag[131] = -16'sd23593;
        twiddle_real[132] = 16'sd22595; twiddle_imag[132] = -16'sd23732;
        twiddle_real[133] = 16'sd22449; twiddle_imag[133] = -16'sd23870;
        twiddle_real[134] = 16'sd22302; twiddle_imag[134] = -16'sd24008;
        twiddle_real[135] = 16'sd22154; twiddle_imag[135] = -16'sd24144;
        twiddle_real[136] = 16'sd22006; twiddle_imag[136] = -16'sd24279;
        twiddle_real[137] = 16'sd21856; twiddle_imag[137] = -16'sd24414;
        twiddle_real[138] = 16'sd21706; twiddle_imag[138] = -16'sd24548;
        twiddle_real[139] = 16'sd21555; twiddle_imag[139] = -16'sd24680;
        twiddle_real[140] = 16'sd21403; twiddle_imag[140] = -16'sd24812;
        twiddle_real[141] = 16'sd21251; twiddle_imag[141] = -16'sd24943;
        twiddle_real[142] = 16'sd21097; twiddle_imag[142] = -16'sd25073;
        twiddle_real[143] = 16'sd20943; twiddle_imag[143] = -16'sd25202;
        twiddle_real[144] = 16'sd20788; twiddle_imag[144] = -16'sd25330;
        twiddle_real[145] = 16'sd20632; twiddle_imag[145] = -16'sd25457;
        twiddle_real[146] = 16'sd20475; twiddle_imag[146] = -16'sd25583;
        twiddle_real[147] = 16'sd20318; twiddle_imag[147] = -16'sd25708;
        twiddle_real[148] = 16'sd20160; twiddle_imag[148] = -16'sd25833;
        twiddle_real[149] = 16'sd20001; twiddle_imag[149] = -16'sd25956;
        twiddle_real[150] = 16'sd19841; twiddle_imag[150] = -16'sd26078;
        twiddle_real[151] = 16'sd19681; twiddle_imag[151] = -16'sd26199;
        twiddle_real[152] = 16'sd19520; twiddle_imag[152] = -16'sd26320;
        twiddle_real[153] = 16'sd19358; twiddle_imag[153] = -16'sd26439;
        twiddle_real[154] = 16'sd19195; twiddle_imag[154] = -16'sd26557;
        twiddle_real[155] = 16'sd19032; twiddle_imag[155] = -16'sd26674;
        twiddle_real[156] = 16'sd18868; twiddle_imag[156] = -16'sd26791;
        twiddle_real[157] = 16'sd18703; twiddle_imag[157] = -16'sd26906;
        twiddle_real[158] = 16'sd18538; twiddle_imag[158] = -16'sd27020;
        twiddle_real[159] = 16'sd18372; twiddle_imag[159] = -16'sd27133;
        twiddle_real[160] = 16'sd18205; twiddle_imag[160] = -16'sd27246;
        twiddle_real[161] = 16'sd18037; twiddle_imag[161] = -16'sd27357;
        twiddle_real[162] = 16'sd17869; twiddle_imag[162] = -16'sd27467;
        twiddle_real[163] = 16'sd17700; twiddle_imag[163] = -16'sd27576;
        twiddle_real[164] = 16'sd17531; twiddle_imag[164] = -16'sd27684;
        twiddle_real[165] = 16'sd17361; twiddle_imag[165] = -16'sd27791;
        twiddle_real[166] = 16'sd17190; twiddle_imag[166] = -16'sd27897;
        twiddle_real[167] = 16'sd17018; twiddle_imag[167] = -16'sd28002;
        twiddle_real[168] = 16'sd16846; twiddle_imag[168] = -16'sd28106;
        twiddle_real[169] = 16'sd16673; twiddle_imag[169] = -16'sd28209;
        twiddle_real[170] = 16'sd16500; twiddle_imag[170] = -16'sd28311;
        twiddle_real[171] = 16'sd16326; twiddle_imag[171] = -16'sd28411;
        twiddle_real[172] = 16'sd16151; twiddle_imag[172] = -16'sd28511;
        twiddle_real[173] = 16'sd15976; twiddle_imag[173] = -16'sd28610;
        twiddle_real[174] = 16'sd15800; twiddle_imag[174] = -16'sd28707;
        twiddle_real[175] = 16'sd15624; twiddle_imag[175] = -16'sd28803;
        twiddle_real[176] = 16'sd15447; twiddle_imag[176] = -16'sd28899;
        twiddle_real[177] = 16'sd15269; twiddle_imag[177] = -16'sd28993;
        twiddle_real[178] = 16'sd15091; twiddle_imag[178] = -16'sd29086;
        twiddle_real[179] = 16'sd14912; twiddle_imag[179] = -16'sd29178;
        twiddle_real[180] = 16'sd14733; twiddle_imag[180] = -16'sd29269;
        twiddle_real[181] = 16'sd14553; twiddle_imag[181] = -16'sd29359;
        twiddle_real[182] = 16'sd14373; twiddle_imag[182] = -16'sd29448;
        twiddle_real[183] = 16'sd14192; twiddle_imag[183] = -16'sd29535;
        twiddle_real[184] = 16'sd14010; twiddle_imag[184] = -16'sd29622;
        twiddle_real[185] = 16'sd13828; twiddle_imag[185] = -16'sd29707;
        twiddle_real[186] = 16'sd13646; twiddle_imag[186] = -16'sd29792;
        twiddle_real[187] = 16'sd13463; twiddle_imag[187] = -16'sd29875;
        twiddle_real[188] = 16'sd13279; twiddle_imag[188] = -16'sd29957;
        twiddle_real[189] = 16'sd13095; twiddle_imag[189] = -16'sd30038;
        twiddle_real[190] = 16'sd12910; twiddle_imag[190] = -16'sd30118;
        twiddle_real[191] = 16'sd12725; twiddle_imag[191] = -16'sd30196;
        twiddle_real[192] = 16'sd12540; twiddle_imag[192] = -16'sd30274;
        twiddle_real[193] = 16'sd12354; twiddle_imag[193] = -16'sd30350;
        twiddle_real[194] = 16'sd12167; twiddle_imag[194] = -16'sd30425;
        twiddle_real[195] = 16'sd11980; twiddle_imag[195] = -16'sd30499;
        twiddle_real[196] = 16'sd11793; twiddle_imag[196] = -16'sd30572;
        twiddle_real[197] = 16'sd11605; twiddle_imag[197] = -16'sd30644;
        twiddle_real[198] = 16'sd11417; twiddle_imag[198] = -16'sd30715;
        twiddle_real[199] = 16'sd11228; twiddle_imag[199] = -16'sd30784;
        twiddle_real[200] = 16'sd11039; twiddle_imag[200] = -16'sd30853;
        twiddle_real[201] = 16'sd10850; twiddle_imag[201] = -16'sd30920;
        twiddle_real[202] = 16'sd10660; twiddle_imag[202] = -16'sd30986;
        twiddle_real[203] = 16'sd10469; twiddle_imag[203] = -16'sd31050;
        twiddle_real[204] = 16'sd10279; twiddle_imag[204] = -16'sd31114;
        twiddle_real[205] = 16'sd10088; twiddle_imag[205] = -16'sd31177;
        twiddle_real[206] = 16'sd9896; twiddle_imag[206] = -16'sd31238;
        twiddle_real[207] = 16'sd9704; twiddle_imag[207] = -16'sd31298;
        twiddle_real[208] = 16'sd9512; twiddle_imag[208] = -16'sd31357;
        twiddle_real[209] = 16'sd9319; twiddle_imag[209] = -16'sd31415;
        twiddle_real[210] = 16'sd9127; twiddle_imag[210] = -16'sd31471;
        twiddle_real[211] = 16'sd8933; twiddle_imag[211] = -16'sd31527;
        twiddle_real[212] = 16'sd8740; twiddle_imag[212] = -16'sd31581;
        twiddle_real[213] = 16'sd8546; twiddle_imag[213] = -16'sd31634;
        twiddle_real[214] = 16'sd8351; twiddle_imag[214] = -16'sd31686;
        twiddle_real[215] = 16'sd8157; twiddle_imag[215] = -16'sd31737;
        twiddle_real[216] = 16'sd7962; twiddle_imag[216] = -16'sd31786;
        twiddle_real[217] = 16'sd7767; twiddle_imag[217] = -16'sd31834;
        twiddle_real[218] = 16'sd7571; twiddle_imag[218] = -16'sd31881;
        twiddle_real[219] = 16'sd7376; twiddle_imag[219] = -16'sd31927;
        twiddle_real[220] = 16'sd7180; twiddle_imag[220] = -16'sd31972;
        twiddle_real[221] = 16'sd6983; twiddle_imag[221] = -16'sd32015;
        twiddle_real[222] = 16'sd6787; twiddle_imag[222] = -16'sd32058;
        twiddle_real[223] = 16'sd6590; twiddle_imag[223] = -16'sd32099;
        twiddle_real[224] = 16'sd6393; twiddle_imag[224] = -16'sd32138;
        twiddle_real[225] = 16'sd6195; twiddle_imag[225] = -16'sd32177;
        twiddle_real[226] = 16'sd5998; twiddle_imag[226] = -16'sd32214;
        twiddle_real[227] = 16'sd5800; twiddle_imag[227] = -16'sd32251;
        twiddle_real[228] = 16'sd5602; twiddle_imag[228] = -16'sd32286;
        twiddle_real[229] = 16'sd5404; twiddle_imag[229] = -16'sd32319;
        twiddle_real[230] = 16'sd5205; twiddle_imag[230] = -16'sd32352;
        twiddle_real[231] = 16'sd5007; twiddle_imag[231] = -16'sd32383;
        twiddle_real[232] = 16'sd4808; twiddle_imag[232] = -16'sd32413;
        twiddle_real[233] = 16'sd4609; twiddle_imag[233] = -16'sd32442;
        twiddle_real[234] = 16'sd4410; twiddle_imag[234] = -16'sd32470;
        twiddle_real[235] = 16'sd4211; twiddle_imag[235] = -16'sd32496;
        twiddle_real[236] = 16'sd4011; twiddle_imag[236] = -16'sd32522;
        twiddle_real[237] = 16'sd3812; twiddle_imag[237] = -16'sd32546;
        twiddle_real[238] = 16'sd3612; twiddle_imag[238] = -16'sd32568;
        twiddle_real[239] = 16'sd3412; twiddle_imag[239] = -16'sd32590;
        twiddle_real[240] = 16'sd3212; twiddle_imag[240] = -16'sd32610;
        twiddle_real[241] = 16'sd3012; twiddle_imag[241] = -16'sd32629;
        twiddle_real[242] = 16'sd2811; twiddle_imag[242] = -16'sd32647;
        twiddle_real[243] = 16'sd2611; twiddle_imag[243] = -16'sd32664;
        twiddle_real[244] = 16'sd2411; twiddle_imag[244] = -16'sd32679;
        twiddle_real[245] = 16'sd2210; twiddle_imag[245] = -16'sd32693;
        twiddle_real[246] = 16'sd2009; twiddle_imag[246] = -16'sd32706;
        twiddle_real[247] = 16'sd1809; twiddle_imag[247] = -16'sd32718;
        twiddle_real[248] = 16'sd1608; twiddle_imag[248] = -16'sd32729;
        twiddle_real[249] = 16'sd1407; twiddle_imag[249] = -16'sd32738;
        twiddle_real[250] = 16'sd1206; twiddle_imag[250] = -16'sd32746;
        twiddle_real[251] = 16'sd1005; twiddle_imag[251] = -16'sd32753;
        twiddle_real[252] = 16'sd804; twiddle_imag[252] = -16'sd32758;
        twiddle_real[253] = 16'sd603; twiddle_imag[253] = -16'sd32762;
        twiddle_real[254] = 16'sd402; twiddle_imag[254] = -16'sd32766;
        twiddle_real[255] = 16'sd201; twiddle_imag[255] = -16'sd32767;
        twiddle_real[256] = 16'sd0; twiddle_imag[256] = -16'sd32768;
        twiddle_real[257] = -16'sd201; twiddle_imag[257] = -16'sd32767;
        twiddle_real[258] = -16'sd402; twiddle_imag[258] = -16'sd32766;
        twiddle_real[259] = -16'sd603; twiddle_imag[259] = -16'sd32762;
        twiddle_real[260] = -16'sd804; twiddle_imag[260] = -16'sd32758;
        twiddle_real[261] = -16'sd1005; twiddle_imag[261] = -16'sd32753;
        twiddle_real[262] = -16'sd1206; twiddle_imag[262] = -16'sd32746;
        twiddle_real[263] = -16'sd1407; twiddle_imag[263] = -16'sd32738;
        twiddle_real[264] = -16'sd1608; twiddle_imag[264] = -16'sd32729;
        twiddle_real[265] = -16'sd1809; twiddle_imag[265] = -16'sd32718;
        twiddle_real[266] = -16'sd2009; twiddle_imag[266] = -16'sd32706;
        twiddle_real[267] = -16'sd2210; twiddle_imag[267] = -16'sd32693;
        twiddle_real[268] = -16'sd2411; twiddle_imag[268] = -16'sd32679;
        twiddle_real[269] = -16'sd2611; twiddle_imag[269] = -16'sd32664;
        twiddle_real[270] = -16'sd2811; twiddle_imag[270] = -16'sd32647;
        twiddle_real[271] = -16'sd3012; twiddle_imag[271] = -16'sd32629;
        twiddle_real[272] = -16'sd3212; twiddle_imag[272] = -16'sd32610;
        twiddle_real[273] = -16'sd3412; twiddle_imag[273] = -16'sd32590;
        twiddle_real[274] = -16'sd3612; twiddle_imag[274] = -16'sd32568;
        twiddle_real[275] = -16'sd3812; twiddle_imag[275] = -16'sd32546;
        twiddle_real[276] = -16'sd4011; twiddle_imag[276] = -16'sd32522;
        twiddle_real[277] = -16'sd4211; twiddle_imag[277] = -16'sd32496;
        twiddle_real[278] = -16'sd4410; twiddle_imag[278] = -16'sd32470;
        twiddle_real[279] = -16'sd4609; twiddle_imag[279] = -16'sd32442;
        twiddle_real[280] = -16'sd4808; twiddle_imag[280] = -16'sd32413;
        twiddle_real[281] = -16'sd5007; twiddle_imag[281] = -16'sd32383;
        twiddle_real[282] = -16'sd5205; twiddle_imag[282] = -16'sd32352;
        twiddle_real[283] = -16'sd5404; twiddle_imag[283] = -16'sd32319;
        twiddle_real[284] = -16'sd5602; twiddle_imag[284] = -16'sd32286;
        twiddle_real[285] = -16'sd5800; twiddle_imag[285] = -16'sd32251;
        twiddle_real[286] = -16'sd5998; twiddle_imag[286] = -16'sd32214;
        twiddle_real[287] = -16'sd6195; twiddle_imag[287] = -16'sd32177;
        twiddle_real[288] = -16'sd6393; twiddle_imag[288] = -16'sd32138;
        twiddle_real[289] = -16'sd6590; twiddle_imag[289] = -16'sd32099;
        twiddle_real[290] = -16'sd6787; twiddle_imag[290] = -16'sd32058;
        twiddle_real[291] = -16'sd6983; twiddle_imag[291] = -16'sd32015;
        twiddle_real[292] = -16'sd7180; twiddle_imag[292] = -16'sd31972;
        twiddle_real[293] = -16'sd7376; twiddle_imag[293] = -16'sd31927;
        twiddle_real[294] = -16'sd7571; twiddle_imag[294] = -16'sd31881;
        twiddle_real[295] = -16'sd7767; twiddle_imag[295] = -16'sd31834;
        twiddle_real[296] = -16'sd7962; twiddle_imag[296] = -16'sd31786;
        twiddle_real[297] = -16'sd8157; twiddle_imag[297] = -16'sd31737;
        twiddle_real[298] = -16'sd8351; twiddle_imag[298] = -16'sd31686;
        twiddle_real[299] = -16'sd8546; twiddle_imag[299] = -16'sd31634;
        twiddle_real[300] = -16'sd8740; twiddle_imag[300] = -16'sd31581;
        twiddle_real[301] = -16'sd8933; twiddle_imag[301] = -16'sd31527;
        twiddle_real[302] = -16'sd9127; twiddle_imag[302] = -16'sd31471;
        twiddle_real[303] = -16'sd9319; twiddle_imag[303] = -16'sd31415;
        twiddle_real[304] = -16'sd9512; twiddle_imag[304] = -16'sd31357;
        twiddle_real[305] = -16'sd9704; twiddle_imag[305] = -16'sd31298;
        twiddle_real[306] = -16'sd9896; twiddle_imag[306] = -16'sd31238;
        twiddle_real[307] = -16'sd10088; twiddle_imag[307] = -16'sd31177;
        twiddle_real[308] = -16'sd10279; twiddle_imag[308] = -16'sd31114;
        twiddle_real[309] = -16'sd10469; twiddle_imag[309] = -16'sd31050;
        twiddle_real[310] = -16'sd10660; twiddle_imag[310] = -16'sd30986;
        twiddle_real[311] = -16'sd10850; twiddle_imag[311] = -16'sd30920;
        twiddle_real[312] = -16'sd11039; twiddle_imag[312] = -16'sd30853;
        twiddle_real[313] = -16'sd11228; twiddle_imag[313] = -16'sd30784;
        twiddle_real[314] = -16'sd11417; twiddle_imag[314] = -16'sd30715;
        twiddle_real[315] = -16'sd11605; twiddle_imag[315] = -16'sd30644;
        twiddle_real[316] = -16'sd11793; twiddle_imag[316] = -16'sd30572;
        twiddle_real[317] = -16'sd11980; twiddle_imag[317] = -16'sd30499;
        twiddle_real[318] = -16'sd12167; twiddle_imag[318] = -16'sd30425;
        twiddle_real[319] = -16'sd12354; twiddle_imag[319] = -16'sd30350;
        twiddle_real[320] = -16'sd12540; twiddle_imag[320] = -16'sd30274;
        twiddle_real[321] = -16'sd12725; twiddle_imag[321] = -16'sd30196;
        twiddle_real[322] = -16'sd12910; twiddle_imag[322] = -16'sd30118;
        twiddle_real[323] = -16'sd13095; twiddle_imag[323] = -16'sd30038;
        twiddle_real[324] = -16'sd13279; twiddle_imag[324] = -16'sd29957;
        twiddle_real[325] = -16'sd13463; twiddle_imag[325] = -16'sd29875;
        twiddle_real[326] = -16'sd13646; twiddle_imag[326] = -16'sd29792;
        twiddle_real[327] = -16'sd13828; twiddle_imag[327] = -16'sd29707;
        twiddle_real[328] = -16'sd14010; twiddle_imag[328] = -16'sd29622;
        twiddle_real[329] = -16'sd14192; twiddle_imag[329] = -16'sd29535;
        twiddle_real[330] = -16'sd14373; twiddle_imag[330] = -16'sd29448;
        twiddle_real[331] = -16'sd14553; twiddle_imag[331] = -16'sd29359;
        twiddle_real[332] = -16'sd14733; twiddle_imag[332] = -16'sd29269;
        twiddle_real[333] = -16'sd14912; twiddle_imag[333] = -16'sd29178;
        twiddle_real[334] = -16'sd15091; twiddle_imag[334] = -16'sd29086;
        twiddle_real[335] = -16'sd15269; twiddle_imag[335] = -16'sd28993;
        twiddle_real[336] = -16'sd15447; twiddle_imag[336] = -16'sd28899;
        twiddle_real[337] = -16'sd15624; twiddle_imag[337] = -16'sd28803;
        twiddle_real[338] = -16'sd15800; twiddle_imag[338] = -16'sd28707;
        twiddle_real[339] = -16'sd15976; twiddle_imag[339] = -16'sd28610;
        twiddle_real[340] = -16'sd16151; twiddle_imag[340] = -16'sd28511;
        twiddle_real[341] = -16'sd16326; twiddle_imag[341] = -16'sd28411;
        twiddle_real[342] = -16'sd16500; twiddle_imag[342] = -16'sd28311;
        twiddle_real[343] = -16'sd16673; twiddle_imag[343] = -16'sd28209;
        twiddle_real[344] = -16'sd16846; twiddle_imag[344] = -16'sd28106;
        twiddle_real[345] = -16'sd17018; twiddle_imag[345] = -16'sd28002;
        twiddle_real[346] = -16'sd17190; twiddle_imag[346] = -16'sd27897;
        twiddle_real[347] = -16'sd17361; twiddle_imag[347] = -16'sd27791;
        twiddle_real[348] = -16'sd17531; twiddle_imag[348] = -16'sd27684;
        twiddle_real[349] = -16'sd17700; twiddle_imag[349] = -16'sd27576;
        twiddle_real[350] = -16'sd17869; twiddle_imag[350] = -16'sd27467;
        twiddle_real[351] = -16'sd18037; twiddle_imag[351] = -16'sd27357;
        twiddle_real[352] = -16'sd18205; twiddle_imag[352] = -16'sd27246;
        twiddle_real[353] = -16'sd18372; twiddle_imag[353] = -16'sd27133;
        twiddle_real[354] = -16'sd18538; twiddle_imag[354] = -16'sd27020;
        twiddle_real[355] = -16'sd18703; twiddle_imag[355] = -16'sd26906;
        twiddle_real[356] = -16'sd18868; twiddle_imag[356] = -16'sd26791;
        twiddle_real[357] = -16'sd19032; twiddle_imag[357] = -16'sd26674;
        twiddle_real[358] = -16'sd19195; twiddle_imag[358] = -16'sd26557;
        twiddle_real[359] = -16'sd19358; twiddle_imag[359] = -16'sd26439;
        twiddle_real[360] = -16'sd19520; twiddle_imag[360] = -16'sd26320;
        twiddle_real[361] = -16'sd19681; twiddle_imag[361] = -16'sd26199;
        twiddle_real[362] = -16'sd19841; twiddle_imag[362] = -16'sd26078;
        twiddle_real[363] = -16'sd20001; twiddle_imag[363] = -16'sd25956;
        twiddle_real[364] = -16'sd20160; twiddle_imag[364] = -16'sd25833;
        twiddle_real[365] = -16'sd20318; twiddle_imag[365] = -16'sd25708;
        twiddle_real[366] = -16'sd20475; twiddle_imag[366] = -16'sd25583;
        twiddle_real[367] = -16'sd20632; twiddle_imag[367] = -16'sd25457;
        twiddle_real[368] = -16'sd20788; twiddle_imag[368] = -16'sd25330;
        twiddle_real[369] = -16'sd20943; twiddle_imag[369] = -16'sd25202;
        twiddle_real[370] = -16'sd21097; twiddle_imag[370] = -16'sd25073;
        twiddle_real[371] = -16'sd21251; twiddle_imag[371] = -16'sd24943;
        twiddle_real[372] = -16'sd21403; twiddle_imag[372] = -16'sd24812;
        twiddle_real[373] = -16'sd21555; twiddle_imag[373] = -16'sd24680;
        twiddle_real[374] = -16'sd21706; twiddle_imag[374] = -16'sd24548;
        twiddle_real[375] = -16'sd21856; twiddle_imag[375] = -16'sd24414;
        twiddle_real[376] = -16'sd22006; twiddle_imag[376] = -16'sd24279;
        twiddle_real[377] = -16'sd22154; twiddle_imag[377] = -16'sd24144;
        twiddle_real[378] = -16'sd22302; twiddle_imag[378] = -16'sd24008;
        twiddle_real[379] = -16'sd22449; twiddle_imag[379] = -16'sd23870;
        twiddle_real[380] = -16'sd22595; twiddle_imag[380] = -16'sd23732;
        twiddle_real[381] = -16'sd22740; twiddle_imag[381] = -16'sd23593;
        twiddle_real[382] = -16'sd22884; twiddle_imag[382] = -16'sd23453;
        twiddle_real[383] = -16'sd23028; twiddle_imag[383] = -16'sd23312;
        twiddle_real[384] = -16'sd23170; twiddle_imag[384] = -16'sd23170;
        twiddle_real[385] = -16'sd23312; twiddle_imag[385] = -16'sd23028;
        twiddle_real[386] = -16'sd23453; twiddle_imag[386] = -16'sd22884;
        twiddle_real[387] = -16'sd23593; twiddle_imag[387] = -16'sd22740;
        twiddle_real[388] = -16'sd23732; twiddle_imag[388] = -16'sd22595;
        twiddle_real[389] = -16'sd23870; twiddle_imag[389] = -16'sd22449;
        twiddle_real[390] = -16'sd24008; twiddle_imag[390] = -16'sd22302;
        twiddle_real[391] = -16'sd24144; twiddle_imag[391] = -16'sd22154;
        twiddle_real[392] = -16'sd24279; twiddle_imag[392] = -16'sd22006;
        twiddle_real[393] = -16'sd24414; twiddle_imag[393] = -16'sd21856;
        twiddle_real[394] = -16'sd24548; twiddle_imag[394] = -16'sd21706;
        twiddle_real[395] = -16'sd24680; twiddle_imag[395] = -16'sd21555;
        twiddle_real[396] = -16'sd24812; twiddle_imag[396] = -16'sd21403;
        twiddle_real[397] = -16'sd24943; twiddle_imag[397] = -16'sd21251;
        twiddle_real[398] = -16'sd25073; twiddle_imag[398] = -16'sd21097;
        twiddle_real[399] = -16'sd25202; twiddle_imag[399] = -16'sd20943;
        twiddle_real[400] = -16'sd25330; twiddle_imag[400] = -16'sd20788;
        twiddle_real[401] = -16'sd25457; twiddle_imag[401] = -16'sd20632;
        twiddle_real[402] = -16'sd25583; twiddle_imag[402] = -16'sd20475;
        twiddle_real[403] = -16'sd25708; twiddle_imag[403] = -16'sd20318;
        twiddle_real[404] = -16'sd25833; twiddle_imag[404] = -16'sd20160;
        twiddle_real[405] = -16'sd25956; twiddle_imag[405] = -16'sd20001;
        twiddle_real[406] = -16'sd26078; twiddle_imag[406] = -16'sd19841;
        twiddle_real[407] = -16'sd26199; twiddle_imag[407] = -16'sd19681;
        twiddle_real[408] = -16'sd26320; twiddle_imag[408] = -16'sd19520;
        twiddle_real[409] = -16'sd26439; twiddle_imag[409] = -16'sd19358;
        twiddle_real[410] = -16'sd26557; twiddle_imag[410] = -16'sd19195;
        twiddle_real[411] = -16'sd26674; twiddle_imag[411] = -16'sd19032;
        twiddle_real[412] = -16'sd26791; twiddle_imag[412] = -16'sd18868;
        twiddle_real[413] = -16'sd26906; twiddle_imag[413] = -16'sd18703;
        twiddle_real[414] = -16'sd27020; twiddle_imag[414] = -16'sd18538;
        twiddle_real[415] = -16'sd27133; twiddle_imag[415] = -16'sd18372;
        twiddle_real[416] = -16'sd27246; twiddle_imag[416] = -16'sd18205;
        twiddle_real[417] = -16'sd27357; twiddle_imag[417] = -16'sd18037;
        twiddle_real[418] = -16'sd27467; twiddle_imag[418] = -16'sd17869;
        twiddle_real[419] = -16'sd27576; twiddle_imag[419] = -16'sd17700;
        twiddle_real[420] = -16'sd27684; twiddle_imag[420] = -16'sd17531;
        twiddle_real[421] = -16'sd27791; twiddle_imag[421] = -16'sd17361;
        twiddle_real[422] = -16'sd27897; twiddle_imag[422] = -16'sd17190;
        twiddle_real[423] = -16'sd28002; twiddle_imag[423] = -16'sd17018;
        twiddle_real[424] = -16'sd28106; twiddle_imag[424] = -16'sd16846;
        twiddle_real[425] = -16'sd28209; twiddle_imag[425] = -16'sd16673;
        twiddle_real[426] = -16'sd28311; twiddle_imag[426] = -16'sd16500;
        twiddle_real[427] = -16'sd28411; twiddle_imag[427] = -16'sd16326;
        twiddle_real[428] = -16'sd28511; twiddle_imag[428] = -16'sd16151;
        twiddle_real[429] = -16'sd28610; twiddle_imag[429] = -16'sd15976;
        twiddle_real[430] = -16'sd28707; twiddle_imag[430] = -16'sd15800;
        twiddle_real[431] = -16'sd28803; twiddle_imag[431] = -16'sd15624;
        twiddle_real[432] = -16'sd28899; twiddle_imag[432] = -16'sd15447;
        twiddle_real[433] = -16'sd28993; twiddle_imag[433] = -16'sd15269;
        twiddle_real[434] = -16'sd29086; twiddle_imag[434] = -16'sd15091;
        twiddle_real[435] = -16'sd29178; twiddle_imag[435] = -16'sd14912;
        twiddle_real[436] = -16'sd29269; twiddle_imag[436] = -16'sd14733;
        twiddle_real[437] = -16'sd29359; twiddle_imag[437] = -16'sd14553;
        twiddle_real[438] = -16'sd29448; twiddle_imag[438] = -16'sd14373;
        twiddle_real[439] = -16'sd29535; twiddle_imag[439] = -16'sd14192;
        twiddle_real[440] = -16'sd29622; twiddle_imag[440] = -16'sd14010;
        twiddle_real[441] = -16'sd29707; twiddle_imag[441] = -16'sd13828;
        twiddle_real[442] = -16'sd29792; twiddle_imag[442] = -16'sd13646;
        twiddle_real[443] = -16'sd29875; twiddle_imag[443] = -16'sd13463;
        twiddle_real[444] = -16'sd29957; twiddle_imag[444] = -16'sd13279;
        twiddle_real[445] = -16'sd30038; twiddle_imag[445] = -16'sd13095;
        twiddle_real[446] = -16'sd30118; twiddle_imag[446] = -16'sd12910;
        twiddle_real[447] = -16'sd30196; twiddle_imag[447] = -16'sd12725;
        twiddle_real[448] = -16'sd30274; twiddle_imag[448] = -16'sd12540;
        twiddle_real[449] = -16'sd30350; twiddle_imag[449] = -16'sd12354;
        twiddle_real[450] = -16'sd30425; twiddle_imag[450] = -16'sd12167;
        twiddle_real[451] = -16'sd30499; twiddle_imag[451] = -16'sd11980;
        twiddle_real[452] = -16'sd30572; twiddle_imag[452] = -16'sd11793;
        twiddle_real[453] = -16'sd30644; twiddle_imag[453] = -16'sd11605;
        twiddle_real[454] = -16'sd30715; twiddle_imag[454] = -16'sd11417;
        twiddle_real[455] = -16'sd30784; twiddle_imag[455] = -16'sd11228;
        twiddle_real[456] = -16'sd30853; twiddle_imag[456] = -16'sd11039;
        twiddle_real[457] = -16'sd30920; twiddle_imag[457] = -16'sd10850;
        twiddle_real[458] = -16'sd30986; twiddle_imag[458] = -16'sd10660;
        twiddle_real[459] = -16'sd31050; twiddle_imag[459] = -16'sd10469;
        twiddle_real[460] = -16'sd31114; twiddle_imag[460] = -16'sd10279;
        twiddle_real[461] = -16'sd31177; twiddle_imag[461] = -16'sd10088;
        twiddle_real[462] = -16'sd31238; twiddle_imag[462] = -16'sd9896;
        twiddle_real[463] = -16'sd31298; twiddle_imag[463] = -16'sd9704;
        twiddle_real[464] = -16'sd31357; twiddle_imag[464] = -16'sd9512;
        twiddle_real[465] = -16'sd31415; twiddle_imag[465] = -16'sd9319;
        twiddle_real[466] = -16'sd31471; twiddle_imag[466] = -16'sd9127;
        twiddle_real[467] = -16'sd31527; twiddle_imag[467] = -16'sd8933;
        twiddle_real[468] = -16'sd31581; twiddle_imag[468] = -16'sd8740;
        twiddle_real[469] = -16'sd31634; twiddle_imag[469] = -16'sd8546;
        twiddle_real[470] = -16'sd31686; twiddle_imag[470] = -16'sd8351;
        twiddle_real[471] = -16'sd31737; twiddle_imag[471] = -16'sd8157;
        twiddle_real[472] = -16'sd31786; twiddle_imag[472] = -16'sd7962;
        twiddle_real[473] = -16'sd31834; twiddle_imag[473] = -16'sd7767;
        twiddle_real[474] = -16'sd31881; twiddle_imag[474] = -16'sd7571;
        twiddle_real[475] = -16'sd31927; twiddle_imag[475] = -16'sd7376;
        twiddle_real[476] = -16'sd31972; twiddle_imag[476] = -16'sd7180;
        twiddle_real[477] = -16'sd32015; twiddle_imag[477] = -16'sd6983;
        twiddle_real[478] = -16'sd32058; twiddle_imag[478] = -16'sd6787;
        twiddle_real[479] = -16'sd32099; twiddle_imag[479] = -16'sd6590;
        twiddle_real[480] = -16'sd32138; twiddle_imag[480] = -16'sd6393;
        twiddle_real[481] = -16'sd32177; twiddle_imag[481] = -16'sd6195;
        twiddle_real[482] = -16'sd32214; twiddle_imag[482] = -16'sd5998;
        twiddle_real[483] = -16'sd32251; twiddle_imag[483] = -16'sd5800;
        twiddle_real[484] = -16'sd32286; twiddle_imag[484] = -16'sd5602;
        twiddle_real[485] = -16'sd32319; twiddle_imag[485] = -16'sd5404;
        twiddle_real[486] = -16'sd32352; twiddle_imag[486] = -16'sd5205;
        twiddle_real[487] = -16'sd32383; twiddle_imag[487] = -16'sd5007;
        twiddle_real[488] = -16'sd32413; twiddle_imag[488] = -16'sd4808;
        twiddle_real[489] = -16'sd32442; twiddle_imag[489] = -16'sd4609;
        twiddle_real[490] = -16'sd32470; twiddle_imag[490] = -16'sd4410;
        twiddle_real[491] = -16'sd32496; twiddle_imag[491] = -16'sd4211;
        twiddle_real[492] = -16'sd32522; twiddle_imag[492] = -16'sd4011;
        twiddle_real[493] = -16'sd32546; twiddle_imag[493] = -16'sd3812;
        twiddle_real[494] = -16'sd32568; twiddle_imag[494] = -16'sd3612;
        twiddle_real[495] = -16'sd32590; twiddle_imag[495] = -16'sd3412;
        twiddle_real[496] = -16'sd32610; twiddle_imag[496] = -16'sd3212;
        twiddle_real[497] = -16'sd32629; twiddle_imag[497] = -16'sd3012;
        twiddle_real[498] = -16'sd32647; twiddle_imag[498] = -16'sd2811;
        twiddle_real[499] = -16'sd32664; twiddle_imag[499] = -16'sd2611;
        twiddle_real[500] = -16'sd32679; twiddle_imag[500] = -16'sd2411;
        twiddle_real[501] = -16'sd32693; twiddle_imag[501] = -16'sd2210;
        twiddle_real[502] = -16'sd32706; twiddle_imag[502] = -16'sd2009;
        twiddle_real[503] = -16'sd32718; twiddle_imag[503] = -16'sd1809;
        twiddle_real[504] = -16'sd32729; twiddle_imag[504] = -16'sd1608;
        twiddle_real[505] = -16'sd32738; twiddle_imag[505] = -16'sd1407;
        twiddle_real[506] = -16'sd32746; twiddle_imag[506] = -16'sd1206;
        twiddle_real[507] = -16'sd32753; twiddle_imag[507] = -16'sd1005;
        twiddle_real[508] = -16'sd32758; twiddle_imag[508] = -16'sd804;
        twiddle_real[509] = -16'sd32762; twiddle_imag[509] = -16'sd603;
        twiddle_real[510] = -16'sd32766; twiddle_imag[510] = -16'sd402;
        twiddle_real[511] = -16'sd32767; twiddle_imag[511] = -16'sd201; 
    end

endmodule

module bit_reversal(
    input [`DATA_WIDTH-1:0] in[`WIDTH-1:0],
    output reg [`DATA_WIDTH-1:0] out[`WIDTH-1:0]
);
    integer i, j;
    reg [`SIZE-1:0] reversed_bits;
    always_comb begin
        for (i = 0; i < `WIDTH; i = i + 1) begin
            for (j = 0; j < `SIZE; j = j + 1)
                reversed_bits[j] = i[`SIZE-1-j];
            out[i] = in[reversed_bits];
        end
    end
endmodule

module add_sub(
    input signed [`OUT_WIDTH-1:0] in_real[`WIDTH-1:0],
    input signed [`OUT_WIDTH-1:0] in_imag[`WIDTH-1:0],
    output reg signed [`OUT_WIDTH-1:0] out_real[`WIDTH-1:0],
    output reg signed [`OUT_WIDTH-1:0] out_imag[`WIDTH-1:0],
    output reg done
);
    logic signed[`TWIDDLE_WIDTH - 1:0] twiddle_real[`HALF_WIDTH-1:0];
    logic signed[`TWIDDLE_WIDTH - 1:0] twiddle_imag[`HALF_WIDTH-1:0];

    twiddle_factors uut(twiddle_real, twiddle_imag);

    integer i, j, k, jump, num;

    reg signed [`OUT_WIDTH-1:0] inter1_real[`WIDTH-1:0];
    reg signed [`OUT_WIDTH-1:0] inter1_imag[`WIDTH-1:0];
    reg signed [`OUT_WIDTH-1:0] inter2_real[`WIDTH-1:0];
    reg signed [`OUT_WIDTH-1:0] inter2_imag[`WIDTH-1:0];

    task complex_multiply;

        input logic signed [`TWIDDLE_WIDTH - 1:0] mul1_real;
        input logic signed [`TWIDDLE_WIDTH - 1:0] mul1_imag;
        input logic signed [`OUT_WIDTH - 1:0] mul2_real;
        input logic signed [`OUT_WIDTH - 1:0] mul2_imag;
        output reg signed [`OUT_WIDTH - 1:0] out_real;
        output reg signed [`OUT_WIDTH - 1:0] out_imag;

        logic signed [`OUT_WIDTH + `TWIDDLE_WIDTH:0] prod_rr, prod_ii, prod_ri, prod_ir;
        logic signed [`OUT_WIDTH + `TWIDDLE_WIDTH:0] temp_real;
        logic signed [`OUT_WIDTH + `TWIDDLE_WIDTH:0] temp_imag;
        logic signed [`OUT_WIDTH + `TWIDDLE_WIDTH:0] round_val;

        begin

            round_val = 1 << (`TWIDDLE_WIDTH - 2);

            prod_rr = $signed(mul1_real) * $signed(mul2_real);
            prod_ii = $signed(mul1_imag) * $signed(mul2_imag);
            prod_ri = $signed(mul1_real) * $signed(mul2_imag);
            prod_ir = $signed(mul1_imag) * $signed(mul2_real);

            temp_real = prod_rr - prod_ii;
            temp_imag = prod_ri + prod_ir;

            out_real = (temp_real + round_val) >>> (`TWIDDLE_WIDTH - 1);
            out_imag = (temp_imag + round_val) >>> (`TWIDDLE_WIDTH - 1);

        end
    endtask

    always_comb begin
        done = 1'b0;
        for (i = 0; i < `SIZE; i = i + 1) begin
            num = 1 << i;
            k = 0;
            jump = `HALF_WIDTH/num;

            for (j = 0; j < `WIDTH; j = j + 1) begin
                if (i != 0) begin 
                    if ((j & num) != 0) begin
                        k = (j % num) * jump;
                        if (i % 2 != 0) begin
                            complex_multiply(twiddle_real[k], twiddle_imag[k], inter1_real[j], inter1_imag[j], inter1_real[j], inter1_imag[j]);
                        end 
                        else begin
                            complex_multiply(twiddle_real[k], twiddle_imag[k], inter2_real[j], inter2_imag[j], inter2_real[j], inter2_imag[j]);
                        end
                    end
                end
            end

            for (j = 0; j < `WIDTH; j = j + 1) begin
                if (i == 0) begin
                    if ((j & num) == 0) begin
                        inter1_real[j] = in_real[j] + in_real[j + 1];
                        inter1_imag[j] = in_imag[j] + in_imag[j + 1];
                    end
                    else begin
                        inter1_real[j] = in_real[j - 1] - in_real[j];
                        inter1_imag[j] = in_imag[j - 1] - in_imag[j];
                    end
                end
                else begin
                    if (i % 2 != 0) begin
                        if ((j & num) == 0) begin
                            inter2_real[j] = inter1_real[j] + inter1_real[j + num];
                            inter2_imag[j] = inter1_imag[j] + inter1_imag[j + num];
                        end
                        else begin
                            inter2_real[j] = inter1_real[j - num] - inter1_real[j];
                            inter2_imag[j] = inter1_imag[j - num] - inter1_imag[j];
                        end
                    end
                    else
                        if ((j & num) == 0) begin
                            inter1_real[j] = inter2_real[j] + inter2_real[j + num];
                            inter1_imag[j] = inter2_imag[j] + inter2_imag[j + num];
                        end
                        else begin
                            inter1_real[j] = inter2_real[j - num] - inter2_real[j];
                            inter1_imag[j] = inter2_imag[j - num] - inter2_imag[j];
                        end
                end
            end
        end
        for (i = 0; i < `WIDTH; i = i + 1) begin
            if (`SIZE % 2 == 0) begin
                out_real[i] = inter2_real[i];
                out_imag[i] = inter2_imag[i];
            end else begin
                out_real[i] = inter1_real[i];
                out_imag[i] = inter1_imag[i];
            end
        end
        done = 1'b1;
    end
endmodule