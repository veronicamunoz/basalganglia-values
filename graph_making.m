clear all;
close all;

malade='fgatir_park_hist.';
sain='fgatir_control_hist.';
load(['D:/Donnees/PatientsPark/' malade 'mat']);
load(['D:/Donnees/ControlsPark/' sain 'mat']);

fns=fieldnames(fgatir_park_hist);
% for j = 1:2:length(fns)
for j = 1:2:length(fns)
    Sd=fns{j};
    Sg=fns{j+1};

    figure1=figure;
    axes1 = axes('Parent',figure1);
    hold(axes1,'all');
    
    s1=subplot(2,2,1); 
    a=eval([malade Sd]);
    h=histogram(a, 'Normalization', 'probability', 'FaceColor', [0.686, 0.929, 0.172]);
    h.BinEdges = [0:200]; h.NumBins = 40;
    title(['Patients (' Sd ')']);
    s2=subplot(2,2,2);
    a=eval([sain Sd]);
    h=histogram(a, 'Normalization', 'probability', 'FaceColor', [0.686, 0.929, 0.172]);
    h.BinEdges = [0:200]; h.NumBins = 40;
    title(['Controls (' Sd ')'])
    s3=subplot(2,2,3); 
    a=eval([malade Sg]);
    h=histogram(a, 'Normalization', 'probability', 'FaceColor', [0.686, 0.929, 0.172]);
    h.BinEdges = [0:200]; h.NumBins = 40; 
    title(['Patients (' Sg ')']);
    s4=subplot(2,2,4);
    a=eval([sain Sg]);
    h=histogram(a, 'Normalization', 'probability', 'FaceColor', [0.686, 0.929, 0.172]);
    h.BinEdges = [0:200]; h.NumBins = 40; 
    title(['Controls (' Sg ')']);
    linkaxes([s1,s2,s3,s4],'xy')
    saveas(figure1, ['D:/Images/matlab/FGATIR/' Sd(1:end-2) '.jpg'])
end