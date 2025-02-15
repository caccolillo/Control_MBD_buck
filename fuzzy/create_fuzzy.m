clc;
clear all;
close all;

%for guidance about how to prepare a script to build a fuzzy inference
%sistem, refer to:
% https://uk.mathworks.com/help/fuzzy/working-from-the-command-line.html

%create buck converter fuzzy inference system
fis = mamfis("Name","buck_fis");

%Add input variables "error" and "error_rate_of_change"
fis = addInput(fis,[-1 1],"Name","error");
fis = addInput(fis,[-1 1],"Name","error_rate_of_change");

%Add membership functions for the input "error"
fis = addMF(fis,"error","trimf",[-1 -0.75 -0.5],"Name","NB");
fis = addMF(fis,"error","trimf",[-0.8 -0.4 -0.2],"Name","NM");
fis = addMF(fis,"error","trimf",[-0.5 -0.25 0],"Name","NS");
fis = addMF(fis,"error","trimf",[-0.2 0 0.2],"Name","ZE");
fis = addMF(fis,"error","trimf",[0 0.25 0.5],"Name","PS");
fis = addMF(fis,"error","trimf",[0.2 0.4 0.8],"Name","PM");
fis = addMF(fis,"error","trimf",[0.5 0.75 1],"Name","PB");

%Add membership functions for the input "error_rate_of_change"
fis = addMF(fis,"error_rate_of_change","trimf",[-1 -0.75 -0.5],"Name","NB");
fis = addMF(fis,"error_rate_of_change","trimf",[-0.8 -0.4 -0.2],"Name","NM");
fis = addMF(fis,"error_rate_of_change","trimf",[-0.5 -0.25 0],"Name","NS");
fis = addMF(fis,"error_rate_of_change","trimf",[-0.2 0 0.2],"Name","ZE");
fis = addMF(fis,"error_rate_of_change","trimf",[0 0.25 0.5],"Name","PS");
fis = addMF(fis,"error_rate_of_change","trimf",[0.2 0.4 0.8],"Name","PM");
fis = addMF(fis,"error_rate_of_change","trimf",[0.5 0.75 1],"Name","PB");

%Add output variables "duty_cycle"
fis = addOutput(fis,[-1 1],"Name","duty_cycle");

%Add membership functions for the output "duty_cycle"
fis = addMF(fis,"duty_cycle","trimf",[-1 -0.75 -0.70],"Name","NB");
fis = addMF(fis,"duty_cycle","trimf",[-0.8 -0.4 -0.2],"Name","NM");
fis = addMF(fis,"duty_cycle","trimf",[-0.5 -0.25 0],"Name","NS");
fis = addMF(fis,"duty_cycle","trimf",[-0.2 0 0.2],"Name","ZE");
fis = addMF(fis,"duty_cycle","trimf",[0 0.25 0.5],"Name","PS");
fis = addMF(fis,"duty_cycle","trimf",[0.2 0.4 0.8],"Name","PM");
fis = addMF(fis,"duty_cycle","trimf",[0.70 0.75 1],"Name","PB");

%Add rules
% https://uk.mathworks.com/help/fuzzy/mamfis.addrule.html

%error = NB
rule1 = 'If error is NB and error_rate_of_change is NB then duty_cycle is NB';
rule2 = 'If error is NB and error_rate_of_change is NM then duty_cycle is NB';
rule3 = 'If error is NB and error_rate_of_change is NS then duty_cycle is NB';
rule4 = 'If error is NB and error_rate_of_change is ZE then duty_cycle is NB';
rule5 = 'If error is NB and error_rate_of_change is PS then duty_cycle is NM';
rule6 = 'If error is NB and error_rate_of_change is PM then duty_cycle is NS';
rule7 = 'If error is NB and error_rate_of_change is PB then duty_cycle is ZE';


%error = NM
rule8 = 'If error is NM and error_rate_of_change is NB then duty_cycle is NB';
rule9 = 'If error is NM and error_rate_of_change is NM then duty_cycle is NB';
rule10 = 'If error is NM and error_rate_of_change is NS then duty_cycle is NB';
rule11 = 'If error is NM and error_rate_of_change is ZE then duty_cycle is NM';
rule12 = 'If error is NM and error_rate_of_change is PS then duty_cycle is NS';
rule13 = 'If error is NM and error_rate_of_change is PM then duty_cycle is ZE';
rule14 = 'If error is NM and error_rate_of_change is PB then duty_cycle is PS';


%error = NS
rule15 = 'If error is NS and error_rate_of_change is NB then duty_cycle is NB';
rule16 = 'If error is NS and error_rate_of_change is NM then duty_cycle is NB';
rule17 = 'If error is NS and error_rate_of_change is NS then duty_cycle is NM';
rule18 = 'If error is NS and error_rate_of_change is ZE then duty_cycle is NS';
rule19 = 'If error is NS and error_rate_of_change is PS then duty_cycle is ZE';
rule20 = 'If error is NS and error_rate_of_change is PM then duty_cycle is PS';
rule21 = 'If error is NS and error_rate_of_change is PB then duty_cycle is PM';


%error = ZE
rule22 = 'If error is ZE and error_rate_of_change is NB then duty_cycle is NB';
rule23 = 'If error is ZE and error_rate_of_change is NM then duty_cycle is NM';
rule24 = 'If error is ZE and error_rate_of_change is NS then duty_cycle is NS';
rule25 = 'If error is ZE and error_rate_of_change is ZE then duty_cycle is ZE';
rule26 = 'If error is ZE and error_rate_of_change is PS then duty_cycle is PS';
rule27 = 'If error is ZE and error_rate_of_change is PM then duty_cycle is PM';
rule28 = 'If error is ZE and error_rate_of_change is PB then duty_cycle is PB';


%error = PS
rule29 = 'If error is PS and error_rate_of_change is NB then duty_cycle is NM';
rule30 = 'If error is PS and error_rate_of_change is NM then duty_cycle is NS';
rule31 = 'If error is PS and error_rate_of_change is NS then duty_cycle is ZE';
rule32 = 'If error is PS and error_rate_of_change is ZE then duty_cycle is PS';
rule33 = 'If error is PS and error_rate_of_change is PS then duty_cycle is PM';
rule34 = 'If error is PS and error_rate_of_change is PM then duty_cycle is PB';
rule35 = 'If error is PS and error_rate_of_change is PB then duty_cycle is PB';


%error = PM
rule36 = 'If error is PM and error_rate_of_change is NB then duty_cycle is NS';
rule37 = 'If error is PM and error_rate_of_change is NM then duty_cycle is ZE';
rule38 = 'If error is PM and error_rate_of_change is NS then duty_cycle is PS';
rule39 = 'If error is PM and error_rate_of_change is ZE then duty_cycle is PM';
rule40 = 'If error is PM and error_rate_of_change is PS then duty_cycle is PB';
rule41 = 'If error is PM and error_rate_of_change is PM then duty_cycle is PB';
rule42 = 'If error is PM and error_rate_of_change is PB then duty_cycle is PB';


%error = PB
rule43 = 'If error is PB and error_rate_of_change is NB then duty_cycle is ZE';
rule44 = 'If error is PB and error_rate_of_change is NM then duty_cycle is PS';
rule45 = 'If error is PB and error_rate_of_change is NS then duty_cycle is PM';
rule46 = 'If error is PB and error_rate_of_change is ZE then duty_cycle is PB';
rule47 = 'If error is PB and error_rate_of_change is PS then duty_cycle is PB';
rule48 = 'If error is PB and error_rate_of_change is PM then duty_cycle is PB';
rule49 = 'If error is PB and error_rate_of_change is PB then duty_cycle is PB';



%add rules
ruleList = char(rule1,rule2,rule3,rule4,rule5,rule6,rule7,rule8,rule9,rule10,rule11,rule12,rule13,rule14,rule15,rule16,rule17,rule18,rule19,rule20,rule21,rule22,rule23,rule24,rule25,rule26,rule27,rule28,rule29,rule30,rule31,rule32,rule33,rule34,rule35,rule36,rule37,rule38,rule39,rule40,rule41,rule42,rule43,rule44,rule45,rule46,rule47,rule48,rule49);
fis = addRule(fis,ruleList);


%save fis file for the current fuzzy inference system
writeFIS(mamfis,"buck_fis");


%open fuzzy logic designer app
fuzzyLogicDesigner(fis);
