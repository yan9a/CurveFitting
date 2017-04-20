%--------------------------------------
%Curve fitting
%2011-Jun-03
%Yan Naing Aye
%--------------------------------------
clc;
close all;
clear all;
%--------------------------------------
%get data from file that can be edited
load('d.txt');
X=d(:,1);
Y=d(:,2);
%--------------------------------------
%define order
N=2;
%--------------------------------------
%curve fitting
p=polyfit(X,Y,N);

%generate curve fitted data
[nr nc]=size(X);
YA=zeros(nr,1);
for i=0:N
    YA=YA+p(i+1)*X.^(N-i);
end
%--------------------------------------
%Plot Y vs X
figure;
plot(X,Y,' rd','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',6)
hold on;
plot(X,YA,'b','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',6)
hold off;
            
grid on;
Title('Y vs X')
xlabel('X');
ylabel('Y');
legend('Sampled data','Fitted curve',...
       'Location','NW')
%--------------------------------------------------------------------------