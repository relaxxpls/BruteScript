// -------------------------- Author: relaxxpls -------------------------- //
#include <bits/stdc++.h>
using namespace std;
#define int             long long

void solve() {
    int n; cin>>n;
    int a[n];
    for(int i=0; i<n; i++)
        cin>>a[i];
    sort(a, a+n);	// correct way of sorting
    cout<<a[1]<<endl;
}

int32_t main() {
	int t = 1; cin>>t;	// no of test cases, default 1
    while(t--)
    	solve();
    return 0;
}
