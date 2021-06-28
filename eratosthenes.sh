#!/bin/sh

# エラトステネスの篩

###sample
##include <iostream>
##include <vector>
#using namespace std;
#
#// 1 以上 N 以下の整数が素数かどうかを返す
#vector<bool> Eratosthenes(int N) {
#    // テーブル
#    vector<bool> isprime(N+1, true);
#
#    // 1 は予めふるい落としておく
#    isprime[1] = false;
#
#    // ふるい
#    for (int p = 2; p <= N; ++p) {
#        // すでに合成数であるものはスキップする
#        if (!isprime[p]) continue;
#
#        // p 以外の p の倍数から素数ラベルを剥奪
#        for (int q = p * 2; q <= N; q += p) {
#            isprime[q] = false;
#        }
#    }
#
#    // 1 以上 N 以下の整数が素数かどうか
#    return isprime;
#}
#
#int main() {
#    vector<bool> isprime = Eratosthenes(50);
#
#    for (int v = 2; v <= 50; ++v) {
#        cout << v << ": "
#             << (isprime[v] ? "prime" : "not") << endl;
#    }
#}

limit=10000000
time awk -v limit="$limit" 'BEGIN{
	# 素数判定用テーブルを用意
	# isprime: array
	# 1は素数でないためあらかじめ除外している
	for(i = 2; i <= limit; i++){
		isprime[i] = 1;
	}
}'

time awk -v limit="$limit" 'BEGIN{
	# 素数判定用テーブルを用意
	# isprime: array
	# 1は素数でないためあらかじめ除外している
	for(i = 2; i <= limit; i++){
		isprime[i] = 1;
	}
	# ふるいにかける
	for(p = 2; p <= limit; ++p){
		# すでに合成数であるものはスキップ
		if(!isprime[p]) continue;

		# p以外のpの倍数から素数ラベルをはく奪
		for (q = p * 2; q <= limit; q += p) {
			isprime[q] = 0;
		}
	}
	for(v in isprime){
		print v, isprime[v];
	}
}' > /dev/null
