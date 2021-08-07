const int M=2e5+10;
const int INF=0x3f3f3f3f;
int n,m;
int fa[M];
struct Edge{
    int x,y,w;
    bool operator < (const Edge &W)const{
        return w<W.w;
    }
}edges[M];
int find(int x){
    if(fa[x]!=x) fa[x]=find(fa[x]);
    return fa[x];
}
int Kruskal(){
    sort(edges,edges+m);
    rep(i,1,n+1) fa[i]=i;//初始化并查集
    int res=0,cnt=0;
    rep(i,0,m){
        int x=edges[i].x,y=edges[i].y,w=edges[i].w;
        x=find(x),y=find(y);
        if(x!=y){// 如果两个连通块不连通，则将这两个连通块合并
            fa[x]=y;
            res+=w;
            cnt++;
        }
    }
    if(cnt<n-1) return INF;
    return res;
}