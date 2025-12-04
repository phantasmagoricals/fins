 
% PSP IREC's fun and funky fin flutter calculator
% by Brooke

function flutterresults = dynamic_fin_flutter(tip_chord, root_chord, fin_thickness, semi_span, surface_area)

% fin specs 
tip_chord = tip_chord / 12; % in > ft
root_chord = root_chord / 12; % in > ft
fin_thickness = fin_thickness / 12;  % in > ft
semi_span = semi_span / 12; % in > ft
surface_area = surface_area / 144; % in^2 > ft^2

taper_ratio = tip_chord/root_chord; 
aspect_ratio = (semi_span^2)/surface_area;

%storage for flutter data and altitudes
allflutters = [];
alts = [];

% forming A_66 term to form the composite shear modulus from CLT
G_fg = 0;
G_cf = 120 * 2.0885e7; % in GPa > lb/ft^2, from Toray T700 plain weave fabric 
fg_layerthickness = 0;
cf_layerthickness = 0.01 / 12; %in > ft
cf_layernum = fin_thickness / cf_layerthickness;

%fg_layernum = (fin_thickness - (cf_layerthickness * cf_layernum)) / fg_layerthickness;
fg_layernum = 0;

A = (fg_layernum * (G_fg * fg_layerthickness)) + (cf_layernum * (G_cf * cf_layerthickness));
G_fins = A / fin_thickness;

% constants
radius_earth = 20902913.5; % radius of the Earth (ft)
gamma = 1.4; % specific heat
g = 32.15; % gravitational acceleration (ft/s^2)
R = 1716; % specific gas constant 

% base conditions
base_pressure = 2116.2;  % Sea-level pressure (lb/ft^2)
base_temp = 518.69;   % Sea-level temperature (R)
h_base = 0;   % base hg (ft)

% stats for 0 - 11k ft (first grad region)
h_top = 36000;             % max height of first gradient region
delta_h = h_top - h_base;
delta_temp = 390.204 - base_temp;
temp_gradient = delta_temp / delta_h; % temperature gradient (R/ft)

for hg = 0:1:11000
    % geopotential height calc
    h = (hg * radius_earth) / (radius_earth - hg);

    % temperature, pressure calculations
    temp = base_temp + temp_gradient * (h - h_base);
    pressure = base_pressure * (temp / base_temp)^(-g / (temp_gradient * R));

    % speed of sound calc
    speed_of_sound = sqrt(gamma * R * temp);
   
    %calc fin flutter using NACA 4197 method
    flutter = speed_of_sound * sqrt(G_fins / (((1.337) * (aspect_ratio)^3 * pressure * (taper_ratio + 1)) / (2 * (aspect_ratio + 2) * (fin_thickness / root_chord)^3)));
    allflutters = [allflutters flutter];
    alts = [alts h];
end

% finds worst case fin flutter and its altitude
max_flutter = max(allflutters); 
[~, idx] = max(allflutters(:));
max_flutter_alt = alts(idx);
flutterresults = [max_flutter, max_flutter_alt];

end