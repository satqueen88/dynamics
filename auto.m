v=50;%���x
t=0.01;%�T���v�����O�^�C��
m=1500;%�ԗ��d��
Kr=55000;%�O�փR�[�i�����O�p���[
Kf=60000;%��փR�[�i�����O�p���[
lf=1.1;%�ԗ��d�S����O�ւ܂�
lr=1.6;%�ԗ��d�S�����ւ܂�
I=2500;%���[�C���O�������[�����g

a11 = -2*(Kf+Kr)/(m*v);
a12 = -(m*v+2/v*(lf*Kf-lr*Kr))/(m*v);
a21 = -2*(lf*Kf-lr*Kr)/I;
a22 = -2*(lf*lf*Kf+lr*lr*Kr)/(I*v);

znext=zeros(5);
A=zeros(2,2);
B=zeros(1,2);

znext=[0;0;0;0;0];%�����l [beta(1)������p, gamma(1)���[���[�g, x(1), y(1), theta(1)]
delta=-0.0349066;%���Ǌp15(deg)

for j=1:1000
    for i=1:5
        
z(1,1)=znext(1,j)%������pbe-ta�͕s�ςȂ̂��H�H�H
z(2,1)=znext(2,j);%���[���[�ggammma�͕s�ςȂ̂��H�H�H

A=[a11,a12;a21,a22];
B=[2*Kf/(m*v);2+lf*Kf/I];


fu=zeros(5,1);
fu=A*z+B*delta;%delta�͏����l�ŏ�ɕω��Ȃ��ł����̂��H�H�H%����
fu(3)=v*cos(znext(1,j)+znext(5,j));%x
fu(4)=v*sin(znext(1,j)+znext(5,j));%y
fu(5)=znext(2,j)%�����l�K���}�ł����̂��H�H�H%theta
%fu(6)=delta;

    znext(i,j+1)=znext(i,j)+fu(i)*t;
    
    end
end





