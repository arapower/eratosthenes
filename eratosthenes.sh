#!/bin/sh

set -u

# Sieve of Eratosthenes
# Input: argument 1 -> limit number
# Output: number<space>0 -> not prime number
#         number<space>1 -> prime number
# Reference: https://qiita.com/drken/items/3beb679e54266f20ab63

limit=$1
awk -v limit="$limit" 'BEGIN{
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
}'
