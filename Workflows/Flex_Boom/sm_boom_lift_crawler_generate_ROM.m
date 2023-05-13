function arm = sm_boom_lift_crawler_generate_ROM(stlFile,origins,faceIDs,meshSize,freqRange, dampingRatio,varargin)
% Calculate reduced order flexible solid properties
% for sm_boom_lift_crawler
%
% Copyright 2020-2023 The MathWorks, Inc.

showplots = false;
if(nargin == 7)
    showplots = lower(varargin{1});
end
[~,f,e] = fileparts(stlFile);

%% Read STL
if(showplots)
    figure(1)
    trisurf(stlread(stlFile))
    axis equal
    title(['Geometry: ' strrep([f e],'_','\_')]);
    %title('Geometry');
    xlabel('x');
    ylabel('y');
end

%% Define material parameters
E   = 70e9;     % Young's modulus in Pa
nu  = 0.33;     % Poisson's ratio (nondimensional)
matrho = 2700;    % Mass density in kg/m^3

%% Define interface frames
numFrames = size(origins,1);

%% Create Mesh
feModel = createpde('structural','modal-solid');
importGeometry(feModel,stlFile);
structuralProperties(feModel, ...
    'YoungsModulus',E, ...
    'PoissonsRatio',nu, ...
    'MassDensity',matrho);
generateMesh(feModel, ...
    'GeometricOrder','quadratic', ...
    'Hmax',meshSize(2), ...
    'Hmin',meshSize(1));

%% Identify faces
if(showplots)
    figure(2)
    pdegplot(feModel,'FaceLabels','on','FaceAlpha',0.5)
    pde_h = get(gca,'Children');
    delete(pde_h(5));
    xlabel('x');
    ylabel('y');
    title(['Faces: ' strrep([f e],'_','\_')]);
end

%% Plot with highlighted faces
if(showplots)
    figure(3)
    pdemesh(feModel,'FaceAlpha',0.5)
    hold on
    colors = ['rgb' repmat('k',1,numFrames-3)];
    assert(numel(faceIDs) == numFrames);
    for frI = 1:numFrames
        nodeIdxs = findNodes(feModel.Mesh,'region','Face',faceIDs(frI));
        scatter3( ...
            feModel.Mesh.Nodes(1,nodeIdxs), ...
            feModel.Mesh.Nodes(2,nodeIdxs), ...
            feModel.Mesh.Nodes(3,nodeIdxs), ...
            'ok','MarkerFaceColor',colors(frI))
        scatter3( ...
            origins(frI,1), ...
            origins(frI,2), ...
            origins(frI,3), ...
            80,colors(frI),'filled','s')
    end
    hold off
    pdemesh_h=get(gca,'Children');
    delete(pdemesh_h(7));
    title(['Mesh: ' strrep([f e],'_','\_')]);
end
%% Define multipoint constraints for boundary nodes
for frI = 1:numFrames
    structuralBC(feModel, ...
        'Face',faceIDs(frI), ...
        'Constraint','multipoint', ...
        'Reference',origins(frI,:));
end

%% Generate ROM
rom = reduce(feModel,'FrequencyRange',freqRange);

arm.P = rom.ReferenceLocations';  % Interface frame locations (n x 3 matrix)
arm.K = rom.K;                    % Reduced stiffness matrix
arm.M = rom.M;                    % Reduced mass matrix

arm.C = sm_boom_lift_crawler_computeModalDampingMatrix(dampingRatio,rom.K,rom.M);

%% Permute frames
frmPerm = zeros(numFrames,1);    % Frame permutation vector
dofPerm = 1:size(arm.K,1);       % DOF permutation vector

assert(size(arm.P,1) == numFrames);
for i = 1:numFrames
    for j = 1:numFrames
        if isequal(arm.P(j,:),origins(i,:))
            frmPerm(i) = j;
            dofPerm(6*(i-1)+(1:6)) = 6*(j-1)+(1:6);
            continue;
        end
    end
end
assert(numel(frmPerm) == numFrames);
assert(numel(dofPerm) == size(arm.K,1));

arm.P = arm.P(frmPerm,:);
arm.K = arm.K(dofPerm,:);
arm.K = arm.K(:,dofPerm);
arm.M = arm.M(dofPerm,:);
arm.M = arm.M(:,dofPerm);
arm.C = arm.C(dofPerm,:);
arm.C = arm.C(:,dofPerm);