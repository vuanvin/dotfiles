## 基本使用

### 打开快捷键

`ALT + =`  打开下侧的面板

`ATL + [  ]` 分别表示打开左右侧边栏

`ATL + SHIFT + [` 打开左边的工具栏

Terminal 的创建、切换窗口等操作类似于TMUX，前缀建为 `ALT + i`，比如 `<A-I> + c` 创建一个终端窗口



### 跳转快捷键

ALT + h j k l 表示上下左右页面跳转，包括编辑框、侧边栏和下侧的面板，可以跳来跳去

ALT + x 或者 CTRL + SHIFT + p 打开命令面板，平时记不住快捷键或者没有设置快捷键的时候可以使用

CTRL + n p  表示上一条、下一条命令

ALT + n p 表示上一个、下一个标签页，包括编辑框、侧边栏和下侧的面板



### 编辑快捷键

空格（SPC） 是VIM的 leader 键。SPC + f + f 打开快速切换文件的模糊搜索浮窗，就是 VS Code 的 `Go to file` 其它的命令可以直接看 `settings.json` 中的 vim 键位映射相关字段。下面列举几个正常模式的使用

- 标签页的切换除了 ALT + n p ，也可以 SPC + b + n p，b 表示 buffer
- SPC + b + h l 表示左移 右移 buffer 的相对位置
- SPC + b + H L 表示左移 右移 buffer 的窗口位置
- SPC + w + H L 表示左移 右移窗口的位置
- SPC + F 表示代码格式化



为了方便在插入模式下编辑，在插入模式下可以使用Emacs模式的 `C-a` `C-e` `C-h` `C-u` `C-f` `C-b` `A-f` `A-b` （暂时没有设置 `C-n` 和 `C-p`，尽量只作用于一行），还可以使用 VS Code 自带的一下快捷键，比如 Ctrl + Backspace 表示删除一个单词，ALT + ↓ 往下挪动该行等，包括`Home` `End` `PgUp` `PgDn`等编辑键的使用。



一般输入的时候就触发代码补全建议窗口，也可以输入 `C-i` 主动触发。
