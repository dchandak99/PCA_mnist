clear;
close all;

load ('../../data/mnist.mat');

label=double(labels_test*1.0);
big_m=reshape(double(digits_test*1.0),[28*28,10000]);
count=zeros(10);

mu=zeros(28*28,10);
cov_d=zeros(28*28,28*28,10);

for i=1:10000
    
    mu(:,label(i)+1)=mu(:,label(i)+1)+big_m(:,i);
    count(label(i)+1)=count(label(i)+1)+1;
end

for i=1:10
    mu(:,i)=mu(:,i)/count(i);
end

X0=zeros(28*28,count(1));
X1=zeros(28*28,count(2));
X2=zeros(28*28,count(3));
X3=zeros(28*28,count(4));
X4=zeros(28*28,count(5));
X5=zeros(28*28,count(6));
X6=zeros(28*28,count(7));
X7=zeros(28*28,count(8));
X8=zeros(28*28,count(9));
X9=zeros(28*28,count(10));
count=zeros(10);

for i=1:10000
    count(label(i)+1)=count(label(i)+1)+1;
    if label(i)==0
        X0(:,count(1))=big_m(:,i)-mu(:,label(i)+1);
        
    elseif label(i)==1
        X1(:,count(2))=big_m(:,i)-mu(:,label(i)+1);
        
    elseif label(i)==2
        X2(:,count(3))=big_m(:,i)-mu(:,label(i)+1);
        
    elseif label(i)==3
        X3(:,count(4))=big_m(:,i)-mu(:,label(i)+1);
    
    elseif label(i)==4
        X4(:,count(5))=big_m(:,i)-mu(:,label(i)+1);
    
    elseif label(i)==5
        X5(:,count(6))=big_m(:,i)-mu(:,label(i)+1);
    
    elseif label(i)==6
        X6(:,count(7))=big_m(:,i)-mu(:,label(i)+1);
    
    elseif label(i)==7
        X7(:,count(8))=big_m(:,i)-mu(:,label(i)+1);
    
    elseif label(i)==8
        X8(:,count(9))=big_m(:,i)-mu(:,label(i)+1);
    
    elseif label(i)==9
        X9(:,count(10))=big_m(:,i)-mu(:,label(i)+1);
    end
end

index=zeros(784);
for i=1:784
    index(i)=i-1;
end

cov_d(:,:,1)=X0*X0.'/(count(1)-1);
cov_d(:,:,2)=X1*X1.'/(count(2)-1);
cov_d(:,:,3)=X2*X2.'/(count(3)-1);
cov_d(:,:,4)=X3*X3.'/(count(4)-1);
cov_d(:,:,5)=X4*X4.'/(count(5)-1);
cov_d(:,:,6)=X5*X5.'/(count(6)-1);
cov_d(:,:,7)=X6*X6.'/(count(7)-1);
cov_d(:,:,8)=X7*X7.'/(count(8)-1);
cov_d(:,:,9)=X8*X8.'/(count(9)-1);
cov_d(:,:,10)=X9*X9.'/(count(10)-1);


lamda=zeros(28*28,10);
lamda_un=lamda;
v=zeros(784,784,10);

for i=1:10
    lamdaun(:,i)=eig(cov_d(:,:,i));
    [V D]=eig(cov_d(:,:,i));
    v(:,:,i)=V;
    lamda(:,i)=sort(lamdaun(:,i),'descend');
end

lamda1=zeros(10,1);

for i=1:10
    lamda1(i)=lamda(1,i);
end

maxindex=zeros(10,1);
v1=zeros(784,10);

for i=1:10
    for j=28*28:-1:1
        if lamda1(i)==lamdaun(j,i)
            maxindex(i)=j;
            break;
        end
    end
end

for i=1:10
    v1(:,i)=v(:,maxindex(i),i);
end

%v1(:,i) stores principal eigen vector for (i-1)th digit
%lamda(i) stores principal eigen value for (i-1)th digit

for i=1:10
    figure;
    plot(lamda(:,i));
    xlabel('Eigen Value index');
    ylabel('Eigen Value');
    title(sprintf('Lamdas for digit %d',i-1))
    drawnow;
    hold off;
end

j=1;
for i=1:10
   
    mu_plot=(reshape((mu(:,i)),[28,28]));
    %lamda1_plot=uint8(lamda1(7));
    v1_plot=(reshape((v1(:,i)),[28,28]));
    
    figure(j);
    imshow(uint8(mu_plot-lamda1(i)^0.5*v1_plot))
    axis equal;
    title(sprintf('mean-root(lamda1)*v1'))
    drawnow;
    hold off;
    
    figure(j+1);
    imshow(uint8(mu_plot));
    axis equal;
    title(sprintf('mean image'))
    drawnow;
    hold off;
    
    figure(j+2);
    imshow(uint8(mu_plot+lamda1(i)^0.5*v1_plot))
    axis equal;
    title(sprintf('mean+root(lamda1)*v1'))
    drawnow;
    hold off;
    
    j=j+3;
end


