# 社会シミュレーションの採点用プログラム
## 実行環境 
* mac book 標準搭載のbashで開発しています。大学環境のbashでも動作確認する予定です。
version 3.2.57(1)-release (x86_64-apple-darwin16)

## 使用方法
1.
```
$ sh ./scripts/exec_file_all.sh [入力ファイルパス] [オプション（課題番号）]
```
#### 入力ファイルパスはこのようなファイル形式を対象とする
```
.
├── classroom.c
├── s1230227
│   ├── s1230227-1.c
│   └── s1230227-1.pdf
├── s1240116
│   ├── a.out
│   ├── s1240116-1.c
│   ├── s1240116-1.pdf
│   ├── s1240116-2-2.c
│   ├── s1240116-2.c
│   └── s1240116-2.pdf
```

2. 実行すると次のような画面に変わるので、オプションを入力して次の処理を確定してください。
```
./ssim//s1230227/s1230227-1.c
n := next student
r := Repeat the experiment again
v := read program file with vim
e := read program file with emacs
q := quit process
INPUT OPTION -:
```

* n : 次の生徒の回答に移る
* r : もう一度同じ生徒に対して実行をする
* v : vimで現在実行していたプログラムファイルの中身をみる
* e : emacsで現在実行していたプログラムファイルの中身をみる
* q : 現在のプロセスを終了する
