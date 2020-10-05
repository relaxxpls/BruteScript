// -------------------------- Author: relaxxpls -------------------------- //
#include <bits/stdc++.h>
using namespace std;
#define int long long
#define chr std::chrono
const int I_MAX = 1e5+3;
const int LL_MAX = 1e18+3;
const int MOD = 100;

int rand(int a, int b) {
	return a + rand()%(b-a+1);
}

int32_t main() {
	int seed = chr::duration_cast<chr::milliseconds>(chr::system_clock::now().time_since_epoch()).count();
	srand(seed);

	cout<<1<<endl;	// keep num of test cases 1
	int n = rand(1, 100), m = rand(1, 100);
	cout<<n<<" "<<m<<endl;
    for(int i=0; i<n; i++) {
    	for(int j=0; j<m; j++)
    		cout<<rand(0, 1e9)<<" ";
    	cout<<endl;
    }
    return 0;
}