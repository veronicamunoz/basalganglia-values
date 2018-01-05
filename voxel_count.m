clear all;
clc

Sub_val=struct('name', {}, 'RN_d',{},'RN_g',{}, 'SN_d', {}, 'SN_g', {}, 'STN_d', {}, 'STN_g', {}, 'cau_d', {}, 'cau_g', {}, 'Putamen_d', {}, 'Putamen_g', {}, 'GPe_d', {}, 'GPe_g', {}, 'GPi_d', {}, 'GPi_g', {}, 'Th_d', {}, 'Th_g', {}, 'CS_d', {}, 'CS_g', {});
Path2 = 'D:/Donnees/PatientsPark/';
Subj_dir= dir([ Path2 '*']);
Subj_dir = Subj_dir(arrayfun(@(x) ~strcmp(x.name(1),'.'), Subj_dir));

load([Path2  't1_park.mat']);
Sub_val=t1_park;
% col_header={};
% for i = 1:size(perf_control,2)
%     col_header=[col_header, perf_control(i).name]
% end
% row_header=fieldnames(perf_control_hist);  


RN_d=[]; RN_g=[]; SN_d=[]; SN_g=[]; STN_d=[]; STN_g=[]; cau_d=[]; cau_g=[];
Putamen_d=[]; Putamen_g=[]; GPe_d=[]; GPe_g=[]; GPi_d=[]; GPi_g=[]; Th_d=[]; Th_g=[];
CS_d=[]; CS_g=[]; name=[];

for i = 1:size(Sub_val,2)
    name=[name; cellstr(Sub_val(i).name)];
    v1=Sub_val(i).RN_d(find(Sub_val(i).RN_d));
    RN_d=[RN_d; length(v1)];
    v1=Sub_val(i).RN_g(find(Sub_val(i).RN_g));
    RN_g=[RN_g; length(v1)];
    v1=Sub_val(i).SN_d(find(Sub_val(i).SN_d));
    SN_d=[SN_d; length(v1)];
    v1=Sub_val(i).SN_g(find(Sub_val(i).SN_g));
    SN_g=[SN_g; length(v1)];
    v1=Sub_val(i).STN_d(find(Sub_val(i).STN_d));
    STN_d=[STN_d; length(v1)];
    v1=Sub_val(i).STN_g(find(Sub_val(i).STN_g));
    STN_g=[STN_g; length(v1)];
    v1=Sub_val(i).cau_d(find(Sub_val(i).cau_d));
    cau_d=[cau_d; length(v1)];
    v1=Sub_val(i).cau_g(find(Sub_val(i).cau_g));
    cau_g=[cau_g; length(v1)];
    v1=Sub_val(i).Putamen_d(find(Sub_val(i).Putamen_d));
    Putamen_d=[Putamen_d; length(v1)];
    v1=Sub_val(i).Putamen_g(find(Sub_val(i).Putamen_g));
    Putamen_g=[Putamen_g; length(v1)];
    v1=Sub_val(i).GPe_d(find(Sub_val(i).GPe_d));
    GPe_d=[GPe_d; length(v1)];
    v1=Sub_val(i).GPe_g(find(Sub_val(i).GPe_g));
    GPe_g=[GPe_g; length(v1)];    
    v1=Sub_val(i).GPi_d(find(Sub_val(i).GPi_d));
    GPi_d=[GPi_d; length(v1)];
    v1=Sub_val(i).GPi_g(find(Sub_val(i).GPi_g));
    GPi_g=[GPi_g; length(v1)];     
    v1=Sub_val(i).Th_d(find(Sub_val(i).Th_d));
    Th_d=[Th_d; length(v1)];
    v1=Sub_val(i).Th_g(find(Sub_val(i).Th_g));
    Th_g=[Th_g; length(v1)]; 
    v1=Sub_val(i).CS_d(find(Sub_val(i).CS_d));
    CS_d=[CS_d; length(v1)];
    v1=Sub_val(i).CS_g(find(Sub_val(i).CS_g));
    CS_g=[CS_g; length(v1)]; 
end

T=table(cau_d,cau_g,CS_d,CS_g,GPe_d,GPe_g,GPi_d,GPi_g,Putamen_d,Putamen_g,RN_d,RN_g,SN_d,SN_g,STN_d,STN_g,Th_d,Th_g);
T.Properties.RowNames = name;

writetable(T,fullfile(Path2,'t1_park_count.csv'),'Delimiter',',', 'WriteVariableNames',true,'WriteRowNames',true);
writetable(T,fullfile(Path2,'t1_park_count.xls'),'WriteVariableNames',true,'WriteRowNames',true);


