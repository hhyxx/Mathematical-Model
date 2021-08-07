// 可以求存在负权边图的最短路

int n, m;		// n表示点数，m表示边数
int dist[N];		// dist[x]存储1到x的最短路距离
struct Edge{		// 边，a表示出点，b表示入点，w表示边的权重
	int a, b, w;
}edges[M];
// 求1到n的最短路距离，如果无法从1走到n，则返回-1。
bool bellman_ford(){
	memset(dist, 0x3f, sizeof dist);
	dist[1] = 0;
	rep(i,0,n-1){
		bool update=false;
		rep(j,0,m){
			int a = edges[j].a, b = edges[j].b, w = edges[j].w;
			if (dist[b] > dist[a] + w){
				dist[b] = dist[a] + w;
				update=true;
			}
		}
		if(!update) return true; //已经不会再进行松弛操作了，所以不会存在负权回路
	}
	//判断是否存在负权回路
	rep(j,0,m){
		int a = edges[j].a, b = edges[j].b, w = edges[j].w;
		if (dist[b] > dist[a] + w){
			return false;
	}
	return true;
}


