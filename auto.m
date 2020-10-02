v=50;%速度
t=0.01;%サンプリングタイム
m=1500;%車両重さ
Kr=55000;%前輪コーナリングパワー
Kf=60000;%後輪コーナリングパワー
lf=1.1;%車両重心から前輪まで
lr=1.6;%車両重心から後輪まで
I=2500;%ヨーイング慣性モーメント

a11 = -2*(Kf+Kr)/(m*v);
a12 = -(m*v+2/v*(lf*Kf-lr*Kr))/(m*v);
a21 = -2*(lf*Kf-lr*Kr)/I;
a22 = -2*(lf*lf*Kf+lr*lr*Kr)/(I*v);

znext=zeros(5);
A=zeros(2,2);
B=zeros(1,2);

znext=[0;0;0;0;0];%初期値 [beta(1)横滑り角, gamma(1)ヨーレート, x(1), y(1), theta(1)]
delta=-0.0349066;%実舵角15(deg)

for j=1:1000
    for i=1:5
        
z(1,1)=znext(1,j)%横滑り角be-taは不変なのか？？？
z(2,1)=znext(2,j);%ヨーレートgammmaは不変なのか？？？

A=[a11,a12;a21,a22];
B=[2*Kf/(m*v);2+lf*Kf/I];


fu=zeros(5,1);
fu=A*z+B*delta;%deltaは初期値で常に変化なしでいいのか？？？%βγ
fu(3)=v*cos(znext(1,j)+znext(5,j));%x
fu(4)=v*sin(znext(1,j)+znext(5,j));%y
fu(5)=znext(2,j)%初期値ガンマでいいのか？？？%theta
%fu(6)=delta;

    znext(i,j+1)=znext(i,j)+fu(i)*t;
    
    end
end





