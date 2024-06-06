**Note to self**
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

# ssh key
多分生成し直した方が良い．
```
ssh-keygen -t ed25519
```

.sshディレクトリにconfigファイルを作成し，設定をするのを忘れないように
```
Host github-ftherb
    HostName github.com
    IdentityFile ~/.ssh/github # private key file
    User git
    Port 22
    TCPKeepAlive yes
    IdentitiesOnly yes
```
**公開鍵**を[ここ](https://github.com/settings/ssh)にアップする

# リモートリポジトリURLの設定
githubのssh URLは

git@github.com:FtherB/\<repository\>.git

になっているが，これを，
git@**githunb-ftherb**:FtherB/\<repository\>.git
に変えること．
