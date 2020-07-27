clear;clc;clf;
G = 6.67 * 10 ^ -11;  %   gravitational constant
d = 0;               %   distance
t = 0;               %   time
M = 0;               %   mass of body causing grav pull
r = 0;              %   distance between centers of these two bodies

accel = @(G, M, r) (G * M) / r ^ 2; % accel due to grav (G, MASS, RADI)
distanceCovered = @(g,t) 0.5 * g * t ^ 2; % dist. covered (ACCEL,TIME)

%///////////
%-EARTH---//
%///////////

eM = 5.97 * 10 ^ 24; % mass
ed = 6369.7 + 500; % radius + 500
eg = accel(G, eM , ed); % earth's accel due to grav

% stores distance covered for earth in vec
E(1) = distanceCovered(eg,0);
for i = 0:1:100
    E(i+1) = distanceCovered(eg,i);
endfor

%///////////
%-JUPITER-//
%///////////

jM = 1.90 * 10 ^ 27; % mass
jd = 69897 + 500; % radius + 500
jg = accel(G, jM , jd); % jupiter's accel due to grav

% stores distance covered for jupiter in vec
J(1) = distanceCovered(eg,0);
for i = 0:1:100
    J(i+1) = distanceCovered(jg,i);
endfor

%///////////
%-SATURN--//
%///////////

sM = 5.68 * 10 ^ 26; % mass
sd = 58220 + 500; % radius + 500
sg = accel(G, sM , sd); % saturn's accel due to grav

% stores distance covered for saturn in vec
S(1) = distanceCovered(eg,0);
for i = 0:1:100
    S(i+1) = distanceCovered(sg,i);
endfor

%///////////
%-PLOTTING-/
%///////////

plot(J, "linewidth", 2, "color", "k"); 
hold on; 
plot(S, "linewidth", 2, "color", "y"); 
plot(E, "linewidth", 2, "color", "b"); 

% Formatting
xlabel("time (sec)");
ylabel("distance (m)");

legend("Jupiter","Saturn","Earth");

xlim([0, 100]);
ylim([0, 1.6e+11]);
