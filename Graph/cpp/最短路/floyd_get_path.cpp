#include<bits/stdc++.h>
#define rep(i,a,n) for(int i=a;i<n;i++)
#define per(i,a,n) for(int i=n-1;i>=a;i--)
#define close ios::sync_with_stdio(0);cin.tie(0);cout.tie(0);
using namespace std;

const int INF=0x3f3f3f3f;
const int N=1010;
int g[N][N];
int dist[N][N]; // 记录任意两点之间的最短路径长度
int p[N][N]; // 记录任意两点间最短路径的前驱
int n,m,k; // 顶点数目、边数
void init()
{
    rep(i,1,n+1) rep(j,1,n+1) 
    if(i==j) 
    {
        dist[i][j]=0;
        p[i][j] = j;
    }
    else 
    {
        dist[i][j]=INF;
        p[i][j] = j;
    }
}

void floyd()
{
    rep(k,1,n+1)
        rep(i,1,n+1)
            rep(j,1,n+1)
            {
                if(dist[i][j] > (dist[i][k] + dist[k][j]) )
                {
                    dist[i][j] = dist[i][k] + dist[k][j];    
                    p[i][j] = p[i][k];//更新最小路径中间顶点 
                }
            }
}

int main()
{
    close
    cin>>n>>m>>k;
    init();
    while(m--)
    {
        int x,y,z;
        cin>>x>>y>>z;
        dist[x][y] = z;
    }
    floyd();
    while(k--)
    {
        int x,y;
        cin>>x>>y;
        
        if (dist[x][y] > INF/2) 
        {
            cout<<"unreach"<<endl;
        }
        else
        {
            cout<<"distance : "<<dist[x][y]<<endl;
            int k = p[x][y];
            cout<<"path: "<<x;
            while(k != y)
            {
                cout<<"-> "<< k;
                k = p[k][y];
            }
            cout<<"-> "<<y<<endl;
        }
    }
}