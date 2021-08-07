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

void make_rand_permutation(pii a[],int b[],int n) { // 根据随机数进行排序
    srand(time(0));
    rep(i, 1, n) {
        a[i].fi = rand();
        a[i].se = i;
    }
    sort(a + 1, a + n);
    copy(a, b, n - 1);
}

void make_r(db p[],int n) {
    srand(time(0));
    rep(i, 1, n + 1) {
        p[i] = rand() % (999 + 1) / (db)(999 + 1); // 精确到3位
    }
}

int _;
int main() {
    db p[10];

    make_r(p, 10);
    rep(i, 1, 10 + 1)
        cout<<p[i]<<endl;
}
