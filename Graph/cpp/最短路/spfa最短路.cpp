const int INF=0x3f3f3f3f;
int n,m;      // 总点数
int dist[N];        // 存储每个点到1号点的最短距离
bool st[N];     // 存储每个点是否在队列中

struct Edge{
    int to,w,ne;
}e[N];
void add(int x,int y,int z){
    e[idx++].to=y;
    e[idx].ne=h[x];
    e[idx].w=z;
    h[x]=idx; 
}

// 求1号点到n号点的最短路距离，如果从1号点无法走到n号点则返回-1
int spfa(){
    memset(dist,0x3f,sizeof dist);
    dist[1]=0;
    queue<int>q;
    q.push(1);
    st[1]=1;
    while(q.size()){
        auto t=q.front();
        q.pop();
        st[t]=0;
        for(int i=h[t];i;i=e[i].ne){
            int j=e[i].to;
            if(dist[j]>dist[t]+e[i].w){
                dist[j]=dist[t]+e[i].w;
                if(!st[j]){// 如果队列中已存在j，则不需要将j重复插入
                    q.push(j);
                    st[j]=1;
                }
            }
        }
    }
    if(dist[n]==INF) return -1;
    return dist[n];
}