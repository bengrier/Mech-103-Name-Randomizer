
function [] = MECH103_NameRandomizer(classList)

students=readtable(classList,'NumHeaderLines',4); %Reads in file parameter into
%table

sizeStudents=size(students); %Gets the number of students

how_many_names=1000; %Set how many random names you want in the new file
lastname_length=1; %Set how many letters of last name to print to file
rand_vec=randi(sizeStudents(1),[how_many_names,1]); %generates how_many_names random integers from 1:size of students

filename_start=split(classList,'.'); %Splits .csv file name to be used in new file
filename=[filename_start{1},'_RandomList.xlsx']; %Adds "RandomList" to new filename
headers={'Call Number','Name','Present?','Participated?'}; %Sets column headers
writecell(headers,filename,'Range','A1'); %Writes column headers
for(i=1:how_many_names)
    rand_student_list{i,1}=i;
    namesplit=split(students{rand_vec(i),3}{1},','); %split names to print only first + a few letters of last
    rand_student_list{i,2}=[namesplit{2},' ',namesplit{1}(1:lastname_length),'.']; %generates cell array with student names in random order
end
writecell(rand_student_list,filename,'Range','A2'); %writes random student list to file
