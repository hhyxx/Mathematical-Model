#include<bits/stdc++.h>
using namespace std;


#define rep(i,a,n) for(int i=a;i<n;i++)
#define per(i,a,n) for(int i=n-1;i>=a;i--)
#define close ios::sync_with_stdio(0);cin.tie(0);cout.tie(0);
#define ll long long
#define db double
#define fi first 
#define se second

typedef pair<int,int> pii;
double U_Random();
db possion();

db possion() {
    db lambda=0.5,k=0;
    long double p=1.0;
    long double l=exp(-lambda);
    double u=U_Random();
    double F=l;
    while(u>=F) {
        k++;
        l*=(double)lambda/k;
        F+=l;
    }
    return k;
}

double U_Random()
{
    return (double)rand()/RAND_MAX;
}
int main()
{
    rep(i,0,20)
    {
        int x=possion();
        cout<<x<<endl;
    }
}
