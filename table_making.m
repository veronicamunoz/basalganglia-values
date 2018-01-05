clear all;
close all;

malade='perf_park_hist.';
sain='perf_control_hist.';
load(['D:/Donnees/PerfusionPark/' malade 'mat']);
load(['D:/Donnees/PerfusionControls/' sain 'mat']);

fns=fieldnames(perf_control_hist);
for j = 1:2:length(fns)
    Sd=fns{j};
    Sg=fns{j+1};

    park_droit=eval([malade Sd]); park_droit=double(park_droit);
    park_gauche=eval([malade Sg]); park_gauche=double(park_gauche);
    control_droit=eval([sain Sd]); control_droit=double(control_droit);
    control_gauche=eval([sain Sg]); control_gauche=double(control_gauche);
    data=[mean(park_droit), std(park_droit), mean(control_droit), std(control_droit);
        mean(park_gauche), std(park_gauche), mean(control_gauche), std(control_gauche)];
    
    data_cells=num2cell(data);     %Convert data to cell array
    col_header={'Patients','','Controls',''};     %Row cell array (for column labels)
    row_header={Sd; Sg};     %Column cell array (for row labels)
    output_matrix=[{' '} col_header; row_header data_cells];     %Join cell arrays
%     xlswrite('D:/Donnees/PatientsPark/meant1values.xls',output_matrix, strcat('Sheet',string(sheetnum)));     %Write data and both headers
    xlswrite('D:/Donnees/PatientsPark/meanfgatirvalues.xls',output_matrix, Sd(1:end-2));
end