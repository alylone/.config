# .config
这是我的个人终端配置仓库，包含`zsh`, `zim,` `tmux`, `yazi`, `neovim`, `lazygit`的配置文件

**配置文件的备份流程:**

1. 创建项目目录

    ```zsh
    cd ~
    git clone git@github.com:alylone/.config.git
    ```

2. 复制配置文件，到项目目录

    ```zsh
    cp -r .config .zim .zimrc .zshrc .tmux.conf .tmux config/
    ```

3. 通过git，将新配置文件进行`push`

    ```zsh
    cd config
    git push
    ```
    
    

**将配置文件，移动到windows桌面：**

我使用的是wsl，文件系统与windows是互通的，通过如下命令，将配置文件传递到桌面

1. 打包`config`配置文件

   ```zsh
   cd ~
   zip config.zip -r config
   ```

2. 将配置文件，移动到桌面

   ```zsh
   mv config.zip /mnt/c/Users/26377/Desktop
   ```

   
