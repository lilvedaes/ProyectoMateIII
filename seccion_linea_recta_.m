Po=[1 2 2];
Pf=[6 3 9];
T=5;
vo=0;
pr=0.3;
n=30;
t=T*pr;
trayectoria=Pf-Po
distancia=norm(trayectoria)
vk=distancia/(T*(1-pr))
a=vk/t
xt=(a*(t^2)*(Pf(1)-Po(1))/(2*distancia))+Po(1);
yt=(a*(t^2)*(Pf(2)-Po(2))/(2*distancia))+Po(2);
zt=(a*(t^2)*(Pf(3)-Po(3))/(2*distancia))+Po(3);
Pt=[xt yt zt]
xt2=(vk*(T-2*t)*(Pf(1)-Po(1))/distancia)+xt;
yt2=(vk*(T-2*t)*(Pf(2)-Po(2))/distancia)+yt;
zt2=(vk*(T-2*t)*(Pf(3)-Po(3))/distancia)+zt;
Pt2=[xt2 yt2 zt2]
%%Primera parte acelerada
trayecace=Pt-Po;
Tace=2*norm(trayecace)/vk+vo
a=(vk-vo)/Tace
%Vector con los tiempos
tk=[0:1.5/9:1.5];%Segmento de x acelerado
    for i=1:1:9
        xace=Po(1)+((a*tk(i)^2 + vo*tk(i)^2)*(Pt(1)-Po(1))/(2*norm(trayecace)));
        Xace(i)=xace;
    end
    Xace;
%Segmento de y acelerado    
    for i=1:1:9
        yace=Po(2)+((a*tk(i)^2 + vo*Tace*tk(i)^2)*(Pt(2)-Po(2))/(2*norm(trayecace)));
        Yace(i)=yace;
    end
    Yace;
    %Segmento de z acelerado    
    for i=1:1:9
  
        zace=Po(3)+((a*tk(i)^2 + vo*Tace*tk(i)^2)*(Pt(3)-Po(3))/(2*norm(trayecace)));
        Zace(i)=zace;
    end
    Zace;
%%
%%Parte con velocidad constante
trayeccons=Pt2-Po;
Tcons=norm(trayeccons)/vk;
tk2=linspace(0,1,12) 
%%Segmento de x constate
    for i=1:1:12
        xcons=tk2(i)*(Pt2(1)-Pt(1))+Pt(1);
        Xcons(i)=xcons;
        if(length(Xcons)==13)
            Xcons(13)=[];
        end
    end
    Xcons;
    %%
%Segmento de y constate
    for i=1:1:12
        ycons=tk2(i)*(Pt2(2)-Pt(2))+Pt(2);
        Ycons(i)=ycons;
        if(length(Ycons)==13)
            Ycons(13)=[];
        end
    end
    Ycons;
%Segmento de z constate
    for i=1:1:12
        zcons=tk2(i)*(Pt2(3)-Pt(3))+Pt(3);
        Zcons(i)=zcons;
         if(length(Zcons)==13)
            Zcons(13)=[];
        end
    end
    Zcons;
%%   
%%tercera parte desacelerada
trayecace=Pf-Pt2;
dTace=2*norm(trayecace)/vk+vo;
a=(vo-vk)/Tace;
%Vector con los tiempos
tk3=[0:1.5/9:1.5];
%Segmento de x acelerado
    for i=1:1:9
        xdace=Pt2(1)+((a*tk3(i)^2 + vk*dTace*tk3(i)^2)*(Pf(1)-Pt2(1))/(2*norm(trayecace)));
        Xdace(i)=xdace;
    end
    Xdace;
%Segmento de y acelerado    
    for i=1:1:9
        ydace=Pt2(2)+((a*tk3(i)^2 + vk*dTace*tk3(i)^2)*(Pf(2)-Pt2(2))/(2*norm(trayecace)));
        Ydace(i)=ydace
    end
    Ydace;
    %Segmento de z acelerado    
    for i=1:1:9
  
        zdace=Pt2(3)+((a*tk(i)^2 + vk*dTace*tk3(i)^2)*(Pf(3)-Pt2(3))/(2*norm(trayecace)));
        Zdace(i)=zdace;
    end
    Zdace;
    t=linspace(0,5,30);
Xtotal=[Xace Xcons Xdace];
Ytotal=[Yace Ycons Ydace];
Ztotal=[Zace Zcons Zdace];
plot3(Xtotal,Ytotal,Ztotal,'*','MarkerEdgeColor','r','LineWidth',1)
