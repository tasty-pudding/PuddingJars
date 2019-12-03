clear all;

info=dicominfo('IM_1004.1004');

img=dicomread(info);
figure,imshow(img,'DisplayRange',[]);
imwrite(img,'IM_1004.jpeg');

BirthDate=info.PatientBirthDate;
UltrasonographyDate=info.InstanceCreationDate;
BY=str2num(BirthDate(1:4));BM=str2num(BirthDate(5:6));
UY=str2num(UltrasonographyDate(1:4));UM=str2num(UltrasonographyDate(5:6));

PatientGender=info.PatientSex;

PatientAge.val=0;
PatientAge.type=' ';
if((UY-BY)<2)
    PatientAge.val=(UY-BY)*12+(UM-BM);
    PatientAge.type='M';
else
    PatientAge.val=UY-BY;
    PatientAge.type='Y';
end