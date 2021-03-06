clear all;
close all;

Anat_path = 'D:/Donnees/PatientsPark/';
Perf_path = 'D:/Donnees/PerfusionPark/';
Diff_path = 'D:/Donnees/DTIPark/Park/';
Subj_dir = dir([Anat_path '*']);
Subj_dir = Subj_dir(arrayfun(@(x) ~strcmp(x.name(1),'.'),Subj_dir));
%C3Dcommand='/home/veronica/Downloads/Programs/c3d/bin/';
C3Dcommand='C:/"Program Files"/Convert3D/bin/c3d.exe ';

for i = 1 : size(Subj_dir,1)
disp(Subj_dir(i,1).name);
t1_path=fullfile(Anat_path, Subj_dir(i,1).name, 'Anat', 'rAnat.nii');
if (Subj_dir(i,1).isdir==1 && exist(t1_path, 'file') ~= 0)
    fgatir_path=fullfile(Anat_path, Subj_dir(i,1).name, 'FGATIR');
    if exist(fullfile(fgatir_path, 'FGATIR.nii'), 'file') ~= 0
        system([C3Dcommand fullfile(fgatir_path, 'FGATIR.nii') ' -resample-mm 1.0x1.0x1.0mm -o ' fullfile(fgatir_path, 'c3d_FGATIR.nii')]);
        
        clear matlabbatch
        spm_jobman('initcfg');
        matlabbatch{1}.spm.spatial.coreg.estwrite.ref = {t1_path};
        matlabbatch{1}.spm.spatial.coreg.estwrite.source = {fullfile(fgatir_path, 'c3d_FGATIR.nii')};
        matlabbatch{1}.spm.spatial.coreg.estwrite.other = {''};
        matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
        matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
        matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
        matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
        matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.interp = 4;
        matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
        matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.mask = 0;
        matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
       spm('defaults', 'FMRI');
       spm_jobman('run', matlabbatch);
       clear matlabbatch
       disp('---FGATIR coregistrée');
    end
    cbf_path=fullfile(Perf_path, Subj_dir(i,1).name, 'pcasl');
    if exist(fullfile(cbf_path, 'cbf_map.nii'), 'file') ~= 0
        system([C3Dcommand fullfile(cbf_path, 'cbf_map.nii') ' -resample-mm 1.0x1.0x1.0mm -o ' fullfile(cbf_path, 'c3d_cbf_map.nii')]);
        clear matlabbatch
        spm_jobman('initcfg');
        matlabbatch{1}.spm.spatial.coreg.estwrite.ref = {t1_path};
        matlabbatch{1}.spm.spatial.coreg.estwrite.source = {fullfile(cbf_path, 'c3d_cbf_map.nii')};
        matlabbatch{1}.spm.spatial.coreg.estwrite.other = {''};
        matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
        matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
        matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
        matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
        matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.interp = 4;
        matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
        matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.mask = 0;
        matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
       spm('defaults', 'FMRI');
       spm_jobman('run', matlabbatch);
       clear matlabbatch
       disp('---Carte CBF coregistrée');
    end
%     diff2_path=fullfile(Diff_path, Subj_dir(i,1).name, 'pcasl');
%     if exist(fullfile(cbf_path, 'cbf_map.nii'), 'file') ~= 0
%         system([C3Dcommand fullfile(cbf_path, 'cbf_map.nii') ' -resample-mm 1.0x1.0x1.0mm -o ' fullfile(cbf_path, 'c3d_cbf_map.nii')]);
%     end
end
end
        
    