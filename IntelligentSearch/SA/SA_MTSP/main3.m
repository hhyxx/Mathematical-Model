clc;clear;
load('Data.mat')
[MinPath,MinDistance,record] = Min_MTsp(29 , 4 ,distance);
fprintf('��õ����·�߾���Ϊ    :     %d\n',MinDistance);

for i = 1 : length(MinPath) 
    MinPath(i) = MinPath(i) + 1;
end
MinPath
index = find(MinPath == 1);


%% �ֱ�õ�4��·����ֵ
Path1 = MinPath(1:index(1)-1);Path1 = [1,Path1];
Path1(Path1==1) =[];
Path1 = [1,Path1];Path1 = [Path1,1]

Path2 = MinPath(index(1)+1:index(2)-1);Path2 = [1,Path2];
Path2(Path2==1) =[];
Path2 = [1,Path2];Path2=[Path2,1]

Path3 = MinPath(index(2)+1:index(3)-1);Path3 = [1,Path3]; 
Path3(Path3==1) =[];
Path3 = [1,Path3]; Path3=[Path3,1]

Path4 = MinPath(index(3)+1:end);Path4 = [1,Path4];
Path4(Path4==1) =[];
Path4 = [1,Path4];Path4=[Path4,1]



%% ����MTsp ·��ͼ
figure(1);
length(Path1)-1
for a = 1:length(Path1)-1
    b = a+1;
    loc_a = location( Path1 (a) , : );   u_a = loc_a(1);     v_a = loc_a(2); 
    loc_b = location( Path1 (b) , : );   u_b = loc_b(1);     v_b = loc_b(2);     
    plot([u_a,u_b],[v_a,v_b],'-','linewidth',1.1,'color','b','HandleVisibility','off')    
    hold on
end
length(Path2)-1
for a = 1:length(Path2)-1
    b = a+1;
    loc_a = location( Path2 (a) , : );   u_a = loc_a(1);     v_a = loc_a(2); 
    loc_b = location( Path2 (b) , : );   u_b = loc_b(1);     v_b = loc_b(2);     
    plot([u_a,u_b],[v_a,v_b],'-','linewidth',1.1,'color','r','HandleVisibility','off')    
    hold on
end
length(Path3)-1
for a = 1:length(Path3)-1
    b = a+1;
    loc_a = location( Path3 (a) , : );   u_a = loc_a(1);     v_a = loc_a(2); 
    loc_b = location( Path3 (b) , : );   u_b = loc_b(1);     v_b = loc_b(2);     
    plot([u_a,u_b],[v_a,v_b],'-','linewidth',1.1,'color','g','HandleVisibility','off')    
    hold on
end
length(Path4)-1 
for a = 1:length(Path4)-1 
    b = a+1;
    loc_a = location( Path4 (a) , : );   u_a = loc_a(1);     v_a = loc_a(2); 
    loc_b = location( Path4 (b) , : );   u_b = loc_b(1);     v_b = loc_b(2);     
    plot([u_a,u_b],[v_a,v_b],'-','linewidth',1.1,'color','m','HandleVisibility','off')    
    hold on
end

for i=1:30
    text(location(i,1)+0.0005,location(i,2)+0.0005,num2str(i));
    hold on
end
hold on


plot(location(1,1),location(1,2),'o','MarkerSize',15,'MarkerFaceColor','r');hold on;
tmp=location(1,:);
location(1,:)=[];
plot(location(:,1),location(:,2),'o','MarkerSize',12,'MarkerFaceColor',[36,169,255]/255);
grid on
location=[tmp;location];
title('�೵�������·��ͼ');
xlabel('����');ylabel('γ��');
legend('DC��������','S������');



%%  �������Ž�����������ı仯����
figure(2);
x=1:1:length(record);
plot(x,record,'linewidth',1.3);
grid on
title('ģ���˻��������');
legend('����ֵ��������');
xlabel('��������');ylabel('����ֵ');

save('FourPath','Path1','Path2','Path3','Path4');

