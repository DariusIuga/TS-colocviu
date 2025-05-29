function [timp, vin, m, omega, ia] = read_io_data(~)
    
table = readtable('date_identificare.xlsx');
timp = table.timp;  
vin = table.v_in;
m = table.m;
omega = table.omega; 
ia = table.ia;  

end