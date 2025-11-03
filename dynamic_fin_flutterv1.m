function flutterresults = dynamic_fin_flutter(tip_chord, root_chord, fin_thickness, semi_span, surface_area)

taper_ratio = tip_chord/root_chord; 
aspect_ratio = sqrt(semi_span/surface_area);
sealevel_sos = 
sealevel_pressure = 

%Carbon Fiber Layup

layer_count_cf = 1
thickness_cf = 
G_cf =
cf_section = layer_count_cf * thickness_cf; 
cf_ratio = cf_section/fin_thickness;
fg_ratio = 1 - cf_ratio;

G_fg = ;

G_fin = G_fg * fg_ratio + G_cf * cf_ratio;


% Fin Flutter

flutterresults = 1.223 * ;



end