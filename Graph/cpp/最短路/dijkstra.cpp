//1. 朴素dijkstra算法,适用于稠密图，不含负权边
// O(n^2)

const int INF=0x3f3f3f3f;
int g[N][N];// 存储每条边
int dist[N];// 存储1号点到每个点的最短距离// 存储每条边
bool st[N]; // 存储每个点的最短路是否已经确定
int n,m;
// 求1号点到n号点的最短路，如果不存在则返回-1
int dijkstra(){
    memset(dist,0x3f,sizeof dist);
    memset(st,0,sizeof st);
    dist[1]=0;

    rep(i,0,n){//更新n-1次即更新每个点
        int t=-1;
        rep(j,1,n+1)// 在还未确定最短路的点中，寻找距离最小的点
            if(!st[j] && (dist[t]>dist[j] || t==-1))
                t=j;

        rep(j,1,n+1)// 用t更新其他点的距离
            dist[j]=min(dist[j],dist[t]+g[t][j]);
        st[t]=1;
        
    }
    if(dist[n]==INF) return -1;
    return dist[n];
}


//2. 堆优化版dijkstra
// O(m * log m)	
typedef pair<int,int> pii;
const int INF=0x3f3f3f3f;
int h[N],ne[N],e[N],w[N],idx;
int dist[N];
bool st[N];
int n,m;
void add(int x,int y,int z){
    e[idx]=y,ne[idx]=h[x],w[idx]=z,h[x]=idx++;
}
int dijkstra(){
    memset(dist,0x3f,sizeof dist);
    memset(st,0,sizeof st);
    priority_queue<pii,vector<pii>,greater<pii>>heap;
    heap.push({0,1});// first存储距离，second存储节点编号

    while(heap.size()){
        auto t=heap.top();
        heap.pop();

        int ver=t.se,d=t.fi;
        if(st[ver]) continue;
        st[ver]=true;

        for(int i=h[ver];i!=-1;i=ne[i]){
            int j=e[i];
            if(dist[j] > d+w[i]){
                dist[j] = d+w[i];
                heap.push({dist[j],j});
            }
        }
    }

    if(dist[n]==INF) return -1;
}
