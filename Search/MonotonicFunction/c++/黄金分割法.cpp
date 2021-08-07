#include<bits/stdc++.h>
using namespace std;
#define rep(i,a,n) for(int i=a;i<n;i++)
#define per(i,a,n) for(int i=n-1;i>=a;i--)
#define close ios::sync_with_stdio(0);cin.tie(0);cout.tie(0);
#define ll long long
#define db double
const db eps=0.00000001;
const db gold=(sqrt(5)-1)/2;
const db gold_=1-gold;
db f(db x){return 8*x*x*x-2*x*x-7*x+3;}
// db f(db x){return x*x+2*x;}
int main(){
    int cnt=0;
    db x_ans;
    db min=0,max=2;
    // db min=-3,max=5;
    db left = min + gold_ * (max - min);
    db right = min + gold * (max - min);
    
    while(abs(right-left)>eps){
        cout<<++cnt<<"次"<<endl;
        if(f(left)<f(right)){
            max=right;
            right=left;
            left=min + gold_ * (max - min);
        }
        else{
            min=left;
            left=right;
            right=min + gold * (max - min);
        }
        x_ans=abs((left+right)/2);
        // x_ans=(left+right)/2;
    }
    printf("迭代次数:  %d\n", cnt);
    printf("x： %.20lf\n",x_ans);
    printf("最小值： %.20lf\n",f(x_ans));
}
