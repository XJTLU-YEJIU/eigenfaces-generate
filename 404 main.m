%*************************************************************************%
%                               PRESENTATION

%Xi'An Jiaotong - Liverpool University
%Lecture :INT404 Assignment 2 
%Author: YE JIU
%*************************************************************************%

% Orthonormal basis (20 marks)
    % based on your defintion , verify eigenfaces are orthogonal
Face = load('data_for_eignfaces.mat');
eigenfaces_blk = Face.eignfaces_blk;
figure,
for i = 1:100
    subplot(10,10,i),imshow(eigenfaces_blk(:,:,i));
end

for i = 1:99
    for j = i+1:100
    each_eignfaces_blk_i= eigenfaces_blk(:,:,i);
    each_eignfaces_blk_j = eigenfaces_blk(:,:,j);
    column = each_eignfaces_blk_i(:);
    column2 = each_eignfaces_blk_j(:);
    result = round(dot(column,column2));
    end
end
if result == 0
        fprintf('They are orthonormal')
end
    % normalize them to be orthonormal
BLK=zeros(135000,100);  % 赋值必要操作
for i = 1:100
    each_eignfaces_blk_i=eigenfaces_blk(:,:,i);
    column = each_eignfaces_blk_i(:);
    BLK(:,i) = column;
end

eigenfaces_blk_norm = zeros(135000,100);
for i = 1:100
    term = dot(BLK(:,i),BLK(:,i));
    term = sqrt(term);
    eigenfaces_blk_norm(:,i) = BLK(:,i) ./ term;
end
% Forward transform: generating the Eigenfaces weights of a face.(20 marks)
im = imread('find_id.jpg');
[weights_of_face] = get_face_weights(pic,eigenfaces_blk_norm);
figure,
x=1:1:100;
plot(x,weights_of_face,'-r');
% Face generation from its "weights" (30 marks)
im_re_column = eigenfaces_blk_norm * weights_of_face;
% question
max_imre=max(max(im_re_column));
min_imre=min(min(im_re_column));
for i=1:length(im_re_column)
    im_re_column(i)=(im_re_column(i)-min_imre)/(max_imre-min_imre);
end
% question end
im_re = zeros(450,300);
for i = 1:1
    for j = 1:300
        im_re(:,j) = im_re_column(((j-1)*450+1):450*j,i);
    end
end
figure,
subplot(1,2,1);imshow(im);title('original picture');
subplot(1,2,2);imshow(im_re);title('process picture');
PSNR_100 = psnr(im,im_re);
fprintf('psnr of im and im_re_100：%fdB\n',PSNR_100)
% use different eigenfaces to generate original picture
    % use 50 eigenfaces to generate picture
weights_of_face_50 = weights_of_face(1:50,:);
eigenfaces_blk_50 = eigenfaces_blk_norm(:,1:50);
im_re_column_50 = eigenfaces_blk_50 * weights_of_face_50;
   % question
max_imre=max(max(im_re_column_50));
min_imre=min(min(im_re_column_50));
for i=1:length(im_re_column_50)
    im_re_column_50(i)=(im_re_column_50(i)-min_imre)/(max_imre-min_imre);
end
    % question end
im_re_50 = zeros(450,300);
for i = 1:1
    for j = 1:300
        im_re_50(:,j) = im_re_column_50(((j-1)*450+1):450*j,i);
    end
end
figure,
subplot(1,2,1);imshow(im);title('original picture');
subplot(1,2,2);imshow(im_re_50);title('process 50 picture');
PSNR_50 = psnr(im,im_re_50);
fprintf('psnr of im and im_re_50：%fdB\n',PSNR_50);
    % use 10 eigenfaces to generate picture  
weights_of_face_10 = weights_of_face(1:10,:);
eigenfaces_blk_10 = eigenfaces_blk_norm(:,1:10);
im_re_column_10 = eigenfaces_blk_10 * weights_of_face_10;
    % question
max_imre=max(max(im_re_column_10));
min_imre=min(min(im_re_column_10));
for i=1:length(im_re_column_10)
    im_re_column_10(i)=(im_re_column_10(i)-min_imre)/(max_imre-min_imre);
end
    % question end
im_re_10 = zeros(450,300);
for i = 1:1
    for j = 1:300
        im_re_10(:,j) = im_re_column_10(((j-1)*450+1):450*j,i);
    end
end
figure,
subplot(1,2,1);imshow(im);title('original picture');
subplot(1,2,2);imshow(im_re_10);title('process 10 picture');
PSNR_10 = psnr(im,im_re_10);
fprintf('psnr of im and im_re_10：%fdB\n',PSNR_10)
    % use 30 eigenfaces to generate picture  
weights_of_face_30 = weights_of_face(1:30,:);
eigenfaces_blk_30 = eigenfaces_blk_norm(:,1:30);
im_re_column_30 = eigenfaces_blk_30 * weights_of_face_30;
    % question
max_imre=max(max(im_re_column_30));
min_imre=min(min(im_re_column_30));
for i=1:length(im_re_column_30)
    im_re_column_30(i)=(im_re_column_30(i)-min_imre)/(max_imre-min_imre);
end
    % question end
im_re_30 = zeros(450,300);
for i = 1:1
    for j = 1:300
        im_re_30(:,j) = im_re_column_30(((j-1)*450+1):450*j,i);
    end
end
figure,
subplot(1,2,1);imshow(im);title('original picture');
subplot(1,2,2);imshow(im_re_30);title('process 30 picture');
PSNR_30 = psnr(im,im_re_30);
fprintf('psnr of im and im_re_30：%fdB\n',PSNR_30)
 % use 80 eigenfaces to generate picture  
weights_of_face_80 = weights_of_face(1:80,:);
eigenfaces_blk_80 = eigenfaces_blk_norm(:,1:80);
im_re_column_80 = eigenfaces_blk_80 * weights_of_face_80;
    % question
max_imre=max(max(im_re_column_80));
min_imre=min(min(im_re_column_80));
for i=1:length(im_re_column_80)
    im_re_column_80(i)=(im_re_column_80(i)-min_imre)/(max_imre-min_imre);
end
    % question end
im_re_80 = zeros(450,300);
for i = 1:1
    for j = 1:300
        im_re_80(:,j) = im_re_column_80(((j-1)*450+1):450*j,i);
    end
end
figure,
subplot(1,2,1);imshow(im);title('original picture');
subplot(1,2,2);imshow(im_re_80);title('process 80 picture');
PSNR_80 = psnr(im,im_re_80);
fprintf('psnr of im and im_re_80：%fdB\n',PSNR_80)


%recognizing an employee from his/her image. (30 marks)
employees_DB=Face.employees_DB;
[ID,ID_list] = get_employees_ID_from_DB (employees_DB,weights_of_face);
figure,
x=1:1:100;
plot(x,ID_list,'-r'); 
legend('distance of weights');   
xlabel('ID')  
ylabel('distance') 
fprintf('the employee ID is: %d\n', ID);















