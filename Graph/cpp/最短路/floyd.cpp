#include<bits/stdc++.h>
#define rep(i,a,n) for(int i=a;i<n;i++)
#define per(i,a,n) for(int i=n-1;i>=a;i--)
using namespace std;

const int INF=0x3f3f3f3f;
int g[N][N];
int dist[N][N];
int n,m,k;
void init(){
    rep(i,1,n+1) rep(j,1,n+1) 
    if(i==j) dist[i][j]=0;
    else dist[i][j]=INF;
}

void floyd(){
    rep(k,1,n+1)
        rep(i,1,n+1)
            rep(j,1,n+1)
                dist[i][j]=min(dist[i][j],dist[i][k]+dist[k][j]);
}