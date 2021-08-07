#include<bits/stdc++.h>
using namespace std;
#define db double
db fun(db x){ return (8*x*x*x-2*x*x-7*x+3);}
void solve(){
    db a=0,b=2,err=0.001,x=0,x0=1,f,f0;
    do{
        x= (x0*x0 -b*b * fun(a) + (b*b -a*a)*fun(x0)+(a*a-x0*x0)*fun(b))/(2*((x0-b)*fun(a)+(b-a)*fun(x0)+(a-x0)*fun(b)));
        f0=fun(x0);
        f=fun(x);
        if(f==f0){
            a=min(x,x0);
            b=max(x,x0);
            x0=(a+b)/2;
        }
        else{
            if((fun(x)-f0)*(x-x0)>0){
                b=max(x,x0);
                x0=min(x,x0);
            }
            else{
                a=min(x,x0);
                x0=max(x,x0);
            }
        }
    }while(abs(x-x0) > err);
    x=(x+x0)/2;
    printf("迭代结果：  近似根为 x=%.10lf\n",x);
    printf("函数近似值为： f(x) = %.10lf\n",fun(x));
}
int main(){
    solve();
}


