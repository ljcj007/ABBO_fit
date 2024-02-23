clear all;
close all;
% Generate lattice
mfoo = spinw;
a = 4.84743; b = 5.15219; c = 7.34036;
mfoo.genlattice('lat_const',[a b c],'angled',[90 83.2486 90])     %,'spgr',14)
mfoo.addatom('r',[0.5266742425450377,0.0335028316996356,0.2085503897417705],'S',1,'label','Mn1','color',[0 255 0])
mfoo.addatom('r',[0.4733257064549617,0.9664971243003680,0.7914496762582351],'S',1,'label','Mn2','color',[0 255 0])
mfoo.addatom('r',[0.9733257574549623,0.5335028316996354,0.2914496192582339],'S',1,'label','Mn3','color',[0 255 0])
mfoo.addatom('r',[0.0266742405450374,0.4664971683003644,0.7085503827417662],'S',1,'label','Mn4','color',[0 255 0])
mfoo.addatom('r',[0.5,0.5,0],'S',1,'label','Fe1','color',[0 0 255])
mfoo.addatom('r',[0,0,0.5],'S',1,'label','Fe2','color',[0 0 255])
mfoo.addatom('r',[0,0,0],'S',1,'label','Os1','color',[255 0 0])
mfoo.addatom('r',[0.5,0.5,0.5],'S',1,'label','Os2','color',[255 0 0])
mfoo.gencoupling()
mfoo.table('bond',1:17)
ja = [0.000968192137443171
-0.0404847860201287
0.0200695817637401
-0.0143281431999359
0.0165813958318473
-0.0127192847677480
0.0273490847652089
0.0192034049453625
-0.0398785122758833
0.0150591277881225
-0.0183222493043849
0.0122552888720374
0.0254327283228845
0.0286051056680502
-0.00101430758809790
0.0134886160988384
-0.0167413606609414
0.0156487192997902
0.00125931497669570
-0.0132710491607024
0.0170517624897119
-0.0157650570370407
0.0120125583378154
-0.0353864898260103
0.0128684915919825
0.00914479229525034
-0.0334903017851681
0.00661454071349100];
ja=1000*ja;
mfoo.addmatrix('label','J12','value',ja(1));
mfoo.addmatrix('label','J13','value',ja(2));
mfoo.addmatrix('label','J14','value',ja(3));
mfoo.addmatrix('label','J15','value',ja(4));
mfoo.addmatrix('label','J16','value',ja(5));
mfoo.addmatrix('label','J17','value',ja(6));
mfoo.addmatrix('label','J18','value',ja(7));
mfoo.addmatrix('label','J23','value',ja(8));
mfoo.addmatrix('label','J24','value',ja(9));
mfoo.addmatrix('label','J25','value',ja(10));
mfoo.addmatrix('label','J26','value',ja(11));
mfoo.addmatrix('label','J27','value',ja(12));
mfoo.addmatrix('label','J28','value',ja(13));
mfoo.addmatrix('label','J34','value',ja(14));
mfoo.addmatrix('label','J35','value',ja(15));
mfoo.addmatrix('label','J36','value',ja(16));
mfoo.addmatrix('label','J37','value',ja(17));
mfoo.addmatrix('label','J38','value',ja(18));
mfoo.addmatrix('label','J45','value',ja(19));
mfoo.addmatrix('label','J46','value',ja(20));
mfoo.addmatrix('label','J47','value',ja(21));
mfoo.addmatrix('label','J48','value',ja(22));
mfoo.addmatrix('label','J56','value',ja(23));
mfoo.addmatrix('label','J57','value',ja(24));
mfoo.addmatrix('label','J58','value',ja(25));
mfoo.addmatrix('label','J67','value',ja(26));
mfoo.addmatrix('label','J68','value',ja(27));
mfoo.addmatrix('label','J78','value',ja(28));
S0 = [[0;0;1] [0;0;-1] [0;0;1] [0;0;-1] [0;0;1] [0;0;-1] [0;0;1] [0;0;-1]];

mfoo.addcoupling('mat','J12','bond',3,'subIdx',1) 
mfoo.addcoupling('mat','J12','bond',14,'subIdx',2) 
mfoo.addcoupling('mat','J13','bond',9,'subIdx',2) 
mfoo.addcoupling('mat','J13','bond',9,'subIdx',3) 
mfoo.addcoupling('mat','J13','bond',13,'subIdx',1) 
mfoo.addcoupling('mat','J13','bond',13,'subIdx',2) 
mfoo.addcoupling('mat','J14','bond',15,'subIdx',2) 
mfoo.addcoupling('mat','J14','bond',15,'subIdx',3) 
mfoo.addcoupling('mat','J15','bond',2,'subIdx',4) 
mfoo.addcoupling('mat','J15','bond',6,'subIdx',4) 
mfoo.addcoupling('mat','J16','bond',5,'subIdx',1) 
mfoo.addcoupling('mat','J16','bond',8,'subIdx',1) 
mfoo.addcoupling('mat','J17','bond',1,'subIdx',4) 
mfoo.addcoupling('mat','J17','bond',4,'subIdx',4) 
mfoo.addcoupling('mat','J18','bond',7,'subIdx',1) 
mfoo.addcoupling('mat','J18','bond',10,'subIdx',1) 
mfoo.addcoupling('mat','J23','bond',15,'subIdx',1) 
mfoo.addcoupling('mat','J23','bond',15,'subIdx',4) 
mfoo.addcoupling('mat','J24','bond',9,'subIdx',1) 
mfoo.addcoupling('mat','J24','bond',9,'subIdx',4) 
mfoo.addcoupling('mat','J24','bond',13,'subIdx',3) 
mfoo.addcoupling('mat','J24','bond',13,'subIdx',4) 
mfoo.addcoupling('mat','J25','bond',2,'subIdx',1) 
mfoo.addcoupling('mat','J25','bond',6,'subIdx',3) 
mfoo.addcoupling('mat','J26','bond',5,'subIdx',4) 
mfoo.addcoupling('mat','J26','bond',8,'subIdx',4) 
mfoo.addcoupling('mat','J27','bond',1,'subIdx',1) 
mfoo.addcoupling('mat','J27','bond',4,'subIdx',1) 
mfoo.addcoupling('mat','J28','bond',7,'subIdx',4) 
mfoo.addcoupling('mat','J28','bond',10,'subIdx',4) 
mfoo.addcoupling('mat','J34','bond',3,'subIdx',2) 
mfoo.addcoupling('mat','J34','bond',14,'subIdx',1) 
mfoo.addcoupling('mat','J35','bond',5,'subIdx',3) 
mfoo.addcoupling('mat','J35','bond',8,'subIdx',3) 
mfoo.addcoupling('mat','J36','bond',2,'subIdx',2) 
mfoo.addcoupling('mat','J36','bond',6,'subIdx',1) 
mfoo.addcoupling('mat','J37','bond',7,'subIdx',3) 
mfoo.addcoupling('mat','J37','bond',10,'subIdx',3) 
mfoo.addcoupling('mat','J38','bond',1,'subIdx',3) 
mfoo.addcoupling('mat','J38','bond',4,'subIdx',2) 
mfoo.addcoupling('mat','J45','bond',5,'subIdx',2) 
mfoo.addcoupling('mat','J45','bond',8,'subIdx',2) 
mfoo.addcoupling('mat','J46','bond',2,'subIdx',3) 
mfoo.addcoupling('mat','J46','bond',6,'subIdx',2) 
mfoo.addcoupling('mat','J47','bond',7,'subIdx',2) 
mfoo.addcoupling('mat','J47','bond',10,'subIdx',2) 
mfoo.addcoupling('mat','J48','bond',1,'subIdx',3) 
mfoo.addcoupling('mat','J48','bond',4,'subIdx',3) 
mfoo.addcoupling('mat','J56','bond',17,'subIdx',1) 
mfoo.addcoupling('mat','J56','bond',17,'subIdx',2) 
mfoo.addcoupling('mat','J56','bond',17,'subIdx',3) 
mfoo.addcoupling('mat','J56','bond',17,'subIdx',4) 
mfoo.addcoupling('mat','J57','bond',11,'subIdx',4) 
mfoo.addcoupling('mat','J57','bond',11,'subIdx',5) 
mfoo.addcoupling('mat','J57','bond',11,'subIdx',6) 
mfoo.addcoupling('mat','J57','bond',11,'subIdx',7) 
mfoo.addcoupling('mat','J58','bond',12,'subIdx',1) 
mfoo.addcoupling('mat','J58','bond',12,'subIdx',4) 
mfoo.addcoupling('mat','J67','bond',12,'subIdx',2) 
mfoo.addcoupling('mat','J67','bond',12,'subIdx',3) 
mfoo.addcoupling('mat','J68','bond',11,'subIdx',6) 
mfoo.addcoupling('mat','J68','bond',11,'subIdx',7) 
mfoo.addcoupling('mat','J68','bond',11,'subIdx',1) 
mfoo.addcoupling('mat','J68','bond',11,'subIdx',4) 
mfoo.addcoupling('mat','J78','bond',17,'subIdx',5) 
mfoo.addcoupling('mat','J78','bond',17,'subIdx',6) 
mfoo.addcoupling('mat','J78','bond',17,'subIdx',7) 
mfoo.addcoupling('mat','J78','bond',17,'subIdx',8) 

%mfoo.addcoupling('mat','J27','bond',1) 
%mfoo.addcoupling('mat','J25','bond',2) 
%mfoo.addcoupling('mat','J34','bond',3) 
%mfoo.addcoupling('mat','J38','bond',4) 
%mfoo.addcoupling('mat','J16','bond',5) 
%mfoo.addcoupling('mat','J25','bond',6) 
%mfoo.addcoupling('mat','J18','bond',7) 
%mfoo.addcoupling('mat','J16','bond',8) 
%mfoo.addcoupling('mat','J13','bond',9) 
%mfoo.addcoupling('mat','J28','bond',10) 
%mfoo.addcoupling('mat','J57','bond',11) 
%mfoo.addcoupling('mat','J58','bond',12) 
%mfoo.addcoupling('mat','J13','bond',13) 
%mfoo.addcoupling('mat','J34','bond',14) 
%mfoo.addcoupling('mat','J14','bond',15) 
%mfoo.addcoupling('mat','J56','bond',17) 

% Magnetic structure
S0 = [[0;0;1] [0;0;-1] [0;0;1] [0;0;-1] [0;0;1] [0;0;-1] [0;0;1] [0;0;-1]];
mfoo.genmagstr('mode','direct','S',S0,'k',[0 0 0])   % S:direction in normalization; n:
%plot(mfoo,'range',[1 1 1],'cellMode','inside','magColor','red')

Qlist = {[0 0 0] [0 1/2 0] [0 1/2 1/2] [0 0 1/2] [0 0 0] [-1/2 0 1/2] [-1/2 1/2 1/2] [0 1/2 0] [-1/2 1/2 0] [-1/2 0 0] [0 0 0] 1000};
Qlab  = {'\Gamma' 'Z' 'D' 'B' '\Gamma' 'A' 'E' 'Z' 'C' 'Y' '\Gamma'};
Qspec = mfoo.spinwave(Qlist,'hermit',false);
Qspec = sw_egrid(Qspec,'component',{'Sperp'},'Evect',0:1:600);
% Spin-spin correlation functions
%spec1 = sw_egrid(spec1,'component',{'Sperp'},'Evect',0:5:800);
%figure
%sw_plotspec(Qspec,'mode','disp','imag',true,'colormap',[0 0 0],'qlabel',Qlab,'colorbar',false)
[fhandle, phandle]=sw_plotspec(Qspec,'mode','color','dE',10,'colormap',@jet,'qlabel',Qlab);            % dE半高�?
colormap(jet(500))
%axis([0 3 0 40])
% caxis([0 10])
