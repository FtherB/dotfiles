# committer

```
git config --local user.name FtherB
git config --local user.email aliclahso29103@gmail.com
```

からの

```
git commit --amend --author="FtherB <aliclahso29103@gmail.com>"
git rebase --continue #多分エラーになる
git log --pretty=full
```
で
```
git push 
```
既にpushしてしまった場合は-fオプションで強制的にpushする．
研究室用は

user.nameをsasa

user.emailをsasa@sec.inf.shizuoka.ac.jpにしておくと多分親切

# ssh key
多分生成し直した方が良い．
```
ssh-keygen -t ed25519
```

.sshディレクトリにconfigファイルを作成し，設定をするのを忘れないように
```
Host github github.com
    HostName github.com
    IdentityFile ~/.ssh/github #秘密鍵のファイル名
    User git
```
**公開鍵**を[ここ](https://github.com/settings/ssh)にアップする

# リモートリポジトリURLの設定
githubのssh URLは
git@github.com:<account name>/<repository>.git
になっているが，これを，
git@**githunb-ftherb**:FtherB/<repository>.git
に変えること．
