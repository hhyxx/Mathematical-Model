

// 需要先将数据处理成逗号分隔的csv文件后才能读取


#include <bits/stdc++.h>
using namespace std;
#define rep(i, a, n) for (int i = a; i < n; i++)
#define per(i, a, n) for (int i = n - 1; i >= a; i--)
#define ll long long
int r;

void get_data() { // 读取数据 
    ifstream fin("test_A.csv");
    string line;    
    while (getline(fin, line)) {                           
        ++r; 
        c = 0;
        rep (i, 0, line.size())
            if (line[i] != ',')  // 读取逗号分隔的数据
                A[r][++c] = line[i]-'0';
    }

    fin.close;
    ifstream in("test_B.csv");
    
    r = 0;
    while (getline(in,line)) {                           
        ++r;
        c = 0;
        rep (i, 0, line.size())
            if (line[i] != ',')  
                B[r][++c] = line[i] - '0';
    } 
    in.close; 
}


int _;
int main(){
    
    
}

