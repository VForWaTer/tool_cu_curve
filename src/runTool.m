disp("Hello from Octave\n-----------------")
disp("You have tried to run the tool 'foobar'.")
disp("This tool is the template tool without any functionality.")
disp("Please implement another tool or select the tool you")
disp("have already implemented.")

disp("\n\nLoaded Parameters:\n\n")

% build the actual tools here

params = getParameters();

% get the data and all settings
data = params.data;
nvb = params.n_value_bins;
neb = params.n_entropy_bins;
slice_widths = params.slice_widths;

% calculate the binning
% data
ndim = ndims(data) - 1;
edges_values = cell(1, ndim);
edges_values{1} = linspace(min(data), max(data), nvb + 1)

% entropies
edges_entropies = cell(1, 1);
edges_entropies{1} = linspace(0, log2(nvb), neb + 1)

% run tool
[uncs, comps, ns, all_uncs] = f_c_u_curve(data, edges_values, edges_entropies, slice_widths);

% calculate minimum and maximum possible values
tot_nvb = pro(cellfun(@length, edges_values) - 1);
max_uncertainty = log2(tot_nvb)
max_complexity = log2(neb)
min_uncertainty = 0
min_complexity = 0