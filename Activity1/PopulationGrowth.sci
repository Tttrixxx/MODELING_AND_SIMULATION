// --- Model Parameters ---
P0 = 100; 
r = 0.1; 
T = 20;  
dt = 0.1;

// --- Discrete-Time Simulation ---
time_discrete = 0:1:T;
population_discrete = zeros(1, length(time_discrete));
population_discrete(1) = P0;

for i = 2:length(time_discrete)
    population_discrete(i) = population_discrete(i-1) * (1 + r);
end

// --- Continuous-Time Simulation (Euler Method) ---
time_continuous = 0:dt:T; 
population_continuous = zeros(1, length(time_continuous));
population_continuous(1) = P0;

for i = 2:length(time_continuous)
    dP = r * population_continuous(i-1) * dt;
    population_continuous(i) = population_continuous(i-1) + dP;
end

// --- Analytical Solution (Exact continuous exponential growth) ---
population_exact = P0 * exp(r * time_continuous);

// --- Combined Plot ---
scf(0); // Open a new graphics window
plot(time_discrete, population_discrete, 'b-o'); // Discrete
plot(time_continuous, population_continuous, 'r-'); // Continuous (Euler)
plot(time_continuous, population_exact, 'g--'); // Analytical

xlabel("Time (years)");
ylabel("Population");
title("Comparison of Population Growth Models");
legend(["Discrete", "Continuous (Euler)", "Analytical"], "location", "topleft");
grid();
