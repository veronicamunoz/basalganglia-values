clear all;
clc

Sub_val=struct('name', {}, 'RN_d',{},'RN_g',{}, 'SN_d', {}, 'SN_g', {}, 'STN_d', {}, 'STN_g', {}, 'cau_d', {}, 'cau_g', {}, 'Putamen_d', {}, 'Putamen_g', {}, 'GPe_d', {}, 'GPe_g', {}, 'GPi_d', {}, 'GPi_g', {}, 'Th_d', {}, 'Th_g', {}, 'CS_d', {}, 'CS_g', {});
Path2 = 'D:/Donnees/PatientsPark/';
Subj_dir= dir([ Path2 '*']);
Subj_dir = Subj_dir(arrayfun(@(x) ~strcmp(x.name(1),'.'),Subj_dir));

for i = 1 : size(Subj_dir,1)
    if Subj_dir(i,1).isdir==1
    disp(['Extracting data from ' Subj_dir(i,1).name]);          
    if exist(fullfile(Path2, Subj_dir(i,1).name, 'FGATIR', 'rFGATIR.nii'), 'file') ~= 0
        Atlas=niftiread(fullfile(Path2, Subj_dir(i,1).name, 'FGATIR_Collins_atlas.nii')); 
        Orig=niftiread(fullfile(Path2, Subj_dir(i,1).name, 'FGATIR', 'rFGATIR.nii'));

        % imtool(Seg_MNI(:,:,62),'DisplayRange',[]);
        %%Segmentation du Red Nucleus
        s.RN_d=Orig;
        s.RN_d(Atlas~=2)=0;
        s.RN_g=Orig;
        s.RN_g(Atlas~=1)=0;
        %%Segmentation de la Substantia Nigra
        s.SN_d=Orig;
        s.SN_d(Atlas~=4)=0;
        s.SN_g=Orig;
        s.SN_g(Atlas~=3)=0;
        %%Segmentation du Subthalamic Nucleus
        s.STN_d=Orig;
        s.STN_d(Atlas~=6)=0;
        s.STN_g=Orig;
        s.STN_g(Atlas~=5)=0;
        %%Segmentation des caudates
        s.cau_d=Orig;
        s.cau_d(Atlas~=8)=0;
        s.cau_g=Orig;
        s.cau_g(Atlas~=7)=0;
        %%Segmentation du putamen
        s.Putamen_d=Orig;
        s.Putamen_d(Atlas~=10)=0;
        s.Putamen_g=Orig;
        s.Putamen_g(Atlas~=9)=0;
        %%Segmentation du Globus Pallidus externa et interna
        s.GPe_d=Orig;
        s.GPe_d(Atlas~=12)=0;
        s.GPe_g=Orig;
        s.GPe_g(Atlas~=11)=0;
        s.GPi_d=Orig;
        s.GPi_d(Atlas~=14)=0;
        s.GPi_g=Orig;
        s.GPi_g(Atlas~=13)=0;
        %%Segmentation du Thalamus
        s.Th_d=Orig;
        s.Th_d(Atlas~=16)=0;
        s.Th_g=Orig;
        s.Th_g(Atlas~=15)=0;

        %%Segmentation du Colliculus Supérieur
        s.CS_d=Orig;
        s.CS_d(Atlas~=18)=0;
        s.CS_g=Orig;
        s.CS_g(Atlas~=17)=0;
        %cau_d(find(cau_d))

    %     val(end+1)=s;
    %     A.name=Subjects_dir(i,1).name;
    %     A.val=val;
    %     Sub_anat(end+1)=A;
        s.name=Subj_dir(i,1).name;
        Sub_val(end+1)=s;
        disp('Done');
    end
    end
end

Sub_val_hist=struct('RN_d',{},'RN_g',{}, 'SN_d', {}, 'SN_g', {}, 'STN_d', {}, 'STN_g', {}, 'cau_d', {}, 'cau_g', {}, 'Putamen_d', {}, 'Putamen_g', {}, 'GPe_d', {}, 'GPe_g', {}, 'GPi_d', {}, 'GPi_g', {}, 'Th_d', {}, 'Th_g', {},'CS_d', {}, 'CS_g', {});
RN_d=[]; RN_g=[]; SN_d=[]; SN_g=[]; STN_d=[]; STN_g=[]; cau_d=[]; cau_g=[];
Putamen_d=[]; Putamen_g=[]; GPe_d=[]; GPe_g=[]; GPi_d=[]; GPi_g=[]; Th_d=[]; Th_g=[];
CS_d=[]; CS_g=[];

for i = 1:size(Sub_val,2)
    v1=Sub_val(i).RN_d(find(Sub_val(i).RN_d));
    RN_d=[RN_d; v1];
    v1=Sub_val(i).RN_g(find(Sub_val(i).RN_g));
    RN_g=[RN_g; v1];
    v1=Sub_val(i).SN_d(find(Sub_val(i).SN_d));
    SN_d=[SN_d; v1];
    v1=Sub_val(i).SN_g(find(Sub_val(i).SN_g));
    SN_g=[SN_g; v1];
    v1=Sub_val(i).STN_d(find(Sub_val(i).STN_d));
    STN_d=[STN_d; v1];
    v1=Sub_val(i).STN_g(find(Sub_val(i).STN_g));
    STN_g=[STN_g; v1];
    v1=Sub_val(i).cau_d(find(Sub_val(i).cau_d));
    cau_d=[cau_d; v1];
    v1=Sub_val(i).cau_g(find(Sub_val(i).cau_g));
    cau_g=[cau_g; v1];
    v1=Sub_val(i).Putamen_d(find(Sub_val(i).Putamen_d));
    Putamen_d=[Putamen_d; v1];
    v1=Sub_val(i).Putamen_g(find(Sub_val(i).Putamen_g));
    Putamen_g=[Putamen_g; v1];
    v1=Sub_val(i).GPe_d(find(Sub_val(i).GPe_d));
    GPe_d=[GPe_d; v1];
    v1=Sub_val(i).GPe_g(find(Sub_val(i).GPe_g));
    GPe_g=[GPe_g; v1];    
    v1=Sub_val(i).GPi_d(find(Sub_val(i).GPi_d));
    GPi_d=[GPi_d; v1];
    v1=Sub_val(i).GPi_g(find(Sub_val(i).GPi_g));
    GPi_g=[GPi_g; v1];     
    v1=Sub_val(i).Th_d(find(Sub_val(i).Th_d));
    Th_d=[Th_d; v1];
    v1=Sub_val(i).Th_g(find(Sub_val(i).Th_g));
    Th_g=[Th_g; v1]; 
    v1=Sub_val(i).CS_d(find(Sub_val(i).CS_d));
    CS_d=[CS_d; v1];
    v1=Sub_val(i).CS_g(find(Sub_val(i).CS_g));
    CS_g=[CS_g; v1]; 
%     fns=fieldnames(Sub_anat);
%     for j = 2:length(fns)
%         assignin('base', strcat('Sub_anat_hist.',fns{j}), eval(fns{j}));
%     end
end

x.RN_d=RN_d; x.RN_g=RN_g;
x.SN_d=SN_d; x.SN_g=SN_g;
x.STN_d=STN_d; x.STN_g=STN_g;
x.cau_d=cau_d; x.cau_g=cau_g;
x.Putamen_d=Putamen_d; x.Putamen_g=Putamen_g;
x.GPe_d=GPe_d; x.GPe_g=GPe_g;
x.GPi_d=GPi_d; x.GPi_g=GPi_g;
x.Th_d=Th_d; x.Th_g=Th_g;
x.CS_d=CS_d; x.CS_g=CS_g;
Sub_val_hist(end+1)=x;

fgatir_park=Sub_val;
fgatir_park_hist=Sub_val_hist;
% save('fgatir_control.mat', 'fgatir_control', 'fgatir_control_hist','-v7.3','-nocompression');
% save('fgatir_control_hist.mat', 'fgatir_control_hist');

%histogram(cau_d)

%Pat_anat = table(Sub_anat_hist.RN_d, Sub_anat_hist.RN_g,Sub_anat_hist.SN_d,Sub_anat_hist.SN_g,Sub_anat_hist.STN_d,Sub_anat_hist.STN_g,Sub_anat_hist.cau_d,Sub_anat_hist.cau_g,Sub_anat_hist.Putamen_d,Sub_anat_hist.Putamen_g,Sub_anat_hist.GPe_d,Sub_anat_hist.GPe_g,Sub_anat_hist.GPi_d,Sub_anat_hist.GPi_g,Sub_anat_hist.Th_d,Sub_anat_hist.Th_g,Sub_anat_hist.CS_d,Sub_anat_hist.CS_g,'VariableNames',{'RN_d','RN_g','SN_d','SN_g','STN_d','STN_g','cau_d','cau_g','Putamen_d','Putamen_g','GPe_d','GPe_g','GPi_d','GPi_g','Th_d','Th_g','CS_d','CS_g'})

% figure;
% s1=subplot(2,2,1); 
% histogram(Sub_anat_hist.CS_d);
% title('Patients(Colliculus droite)')
% s2=subplot(2,2,2); 
% histogram(Con_anat_hist.CS_d);
% title('Controls(Colliculus droite)')
% s3=subplot(2,2,3); 
% histogram(Sub_anat_hist.CS_g);
% title('Patients(Colliculus gauche)')
% s4=subplot(2,2,4); 
% histogram(Con_anat_hist.CS_g);
% title('Controls(Colliculus gauche)')
% linkaxes([s1,s2,s3,s4],'xy')

%save('t1_park.mat', 't1_park', 't1_park_hist','-v7.3','-nocompression')