fin_count = 3;
tube_radius = 3; 
tube_di = tube_radius * 2;
chimera_length = 
cp_nosecone = 15.357 % from OpenRocket component analysis
cp_cameramountstop = ;
cp_cameramountsbottom 
chimera_mass_nofins = 53.78;
%% Trapezoidal

root_chord = ;
tip_chord = ;
semi_span = ;
fin_thickness = ; 


for semi_span = 4.8:7:0.1 
aspect_ratio = sqrt(semi_span/surface_area)
surface_area =  ;
volume = ; 
fg_volume = ( -0.01) * ( - 0.01) * ( - 0.01);
cf_volume = volume - fg_volume; 
fg_density = ;
cf_density = ; 
%Stability
x_b = chimera_length - root_chord; 
x_r =
l_f = %mid chord line length
cn_fins =  (1 + tube_radius/(semi_span+tube_radius))*4* fin_count * (semi_span / tube_di)^2 / (1 + sqrt(1 + (2 * l_f / (root_chord + tip_chord))^2));


c_n = cn_fins + cn_nosecone + cn_cameramounts;
c_p = / c_n;


fin_mass = (fg_volume * fg_density) + (cf_volume * cf_density);
mass = fin_mass + chimera_mass_nofins;
stability = c_p - c_g;


%Strength


%section_modulus = (1 / 6) * semi_span * (fin_thickness ^ 2);
moment = 
tension = moment / root_chord; 
FoS = 2;


% Fin Flutter

finflutter = dynamic_fin_flutter()
max_finflutter = max(finflutter;
while max_finfluttter > velocity
fin_thickness = fin_thickness + 0.1;
finflutter = dynamic_fin_flutter()
end



end
