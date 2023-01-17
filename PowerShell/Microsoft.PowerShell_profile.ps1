{
  // "latex-workshop.latex.recipes": [
  //     {
  //         "name": "xelatex 🔃",
  //         "tools": [
  //             "xelatex"
  //         ]
  //     },
  //     {
  //         "name": "latexmk 🔃",
  //         "tools": [
  //             "latexmk"
  //         ]
  //     },
  //     {
  //         "name": "latexmk (latexmkrc)",
  //         "tools": [
  //             "latexmk_rconly"
  //         ]
  //     },
  //     {
  //         "name": "latexmk (lualatex)",
  //         "tools": [
  //             "lualatexmk"
  //         ]
  //     },
  //     {
  //         "name": "xelatex ➞ bibtex ➞ xelatex × 2",
  //         "tools": [
  //             "xelatex",
  //             "bibtex",
  //             "xelatex",
  //             "xelatex"
  //         ]
  //     },
  //     {
  //         "name": "pdflatex ➞ bibtex ➞ pdflatex × 2",
  //         "tools": [
  //             "pdflatex",
  //             "bibtex",
  //             "pdflatex",
  //             "pdflatex"
  //         ]
  //     },
  //     {
  //         "name": "Compile Rnw files",
  //         "tools": [
  //             "rnw2tex",
  //             "latexmk"
  //         ]
  //     }
  // ],
  // "latex-workshop.latex.tools": [
  //     {
  //         // 编译工具和命令
  //         "name": "xelatex",
  //         "command": "xelatex",
  //         "args": [
  //             "-synctex=1",
  //             "-interaction=nonstopmode",
  //             "-file-line-error",
  //             "-pdf",
  //             "%DOCFILE%"
  //         ]
  //     },
  //     {
  //         "name": "latexmk",
  //         "command": "latexmk",
  //         "args": [
  //             "-synctex=1",
  //             "-interaction=nonstopmode",
  //             "-file-line-error",
  //             "-pdf",
  //             "-outdir=%OUTDIR%",
  //             "%DOCFILE%"
  //         ],
  //         "env": {}
  //     },
  //     {
  //         "name": "lualatexmk",
  //         "command": "latexmk",
  //         "args": [
  //             "-synctex=1",
  //             "-interaction=nonstopmode",
  //             "-file-line-error",
  //             "-lualatex",
  //             "-outdir=%OUTDIR%",
  //             "%DOCFILE%"
  //         ],
  //         "env": {}
  //     },
  //     {
  //         "name": "latexmk_rconly",
  //         "command": "latexmk",
  //         "args": [
  //             "%DOCFILE%"
  //         ],
  //         "env": {}
  //     },
  //     {
  //         "name": "pdflatex",
  //         "command": "pdflatex",
  //         "args": [
  //             "-synctex=1",
  //             "-interaction=nonstopmode",
  //             "-file-line-error",
  //             "%DOCFILE%"
  //         ],
  //         "env": {}
  //     },
  //     {
  //         "name": "bibtex",
  //         "command": "bibtex",
  //         "args": [
  //             "%DOCFILE%"
  //         ],
  //         "env": {}
  //     },
  //     {
  //         "name": "rnw2tex",
  //         "command": "Rscript",
  //         "args": [
  //             "-e",
  //             "knitr::opts_knit$set(concordance = TRUE); knitr::knit('%DOCFILE_EXT%')"
  //         ],
  //         "env": {}
  //     }
  // ],
  // "latex-workshop.view.pdf.viewer": "external",
  // "latex-workshop.view.pdf.external.viewer.args": [
  //     "%PDF%"
  // ],
  // "latex-workshop.view.pdf.external.synctex.args": [
  //     "-forward-search",
  //     "%TEX%",
  //     "%LINE%",
  //     "-reuse-instance",
  //     "-inverse-search",
  //     "code \"C:\\Users\\yuanyin\\AppData\\Local\\Programs\\Microsoft VS Code\\resources\\app\\out\\cli.js\" -r -g \"%f:%l\"", // 注意修改路径
  //     "%PDF%",
  // ],
  // "latex-workshop.latex.recipe.default": "lastUsed",
  "editor.fontFamily": "FiraCode Nerd Font,Hack Nerd Font",
  "editor.wordWrap": "on",
  "editor.lineNumbers": "on",
  "editor.renderControlCharacters": true,
  "editor.renderWhitespace": "all",
  "editor.suggestSelection": "first",
  "editor.inlineSuggest.enabled": true,
  "editor.fontSize": 12,
  "editor.accessibilitySupport": "off",
  "editor.scrollbar.vertical": "hidden",
  "editor.scrollbar.verticalScrollbarSize": 0,
  "editor.scrollbar.horizontal": "hidden",
  "editor.scrollbar.horizontalScrollbarSize": 0,
  "editor.minimap.showSlider": "always",
  "editor.minimap.enabled": false,
  "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",
  "java.semanticHighlighting.enabled": true,
  "files.watcherExclude": {
    "**/.bloop": true,
    "**/.metals": true,
    "**/.ammonite": true
  },
  "remote.SSH.remotePlatform": {
    "121.46.19.2": "linux",
    "10.12.117.6": "linux",
    "cloud-kvm": "linux",
    "10.182.191.16": "linux",
    "kickseed": "linux",
    "kickseed(frp)": "linux",
    "Machine5": "linux",
    "云主机": "linux",
    "NVM5": "linux",
    "CloudHost": "linux",
    "zyynote": "linux",
    "cloud": "linux",
    "nsccgz": "linux"
  },
  "extensions.autoUpdate": false,
  "workbench.colorTheme": "Monokai Pro (Filter Machine)",
  "workbench.iconTheme": "material-icon-theme",
  "workbench.editorAssociations": {
    "*.ipynb": "jupyter-notebook"
  },
  "terminal.integrated.inheritEnv": false,
  "terminal.integrated.defaultProfile.windows": "PowerShell",
  "cmake.configureOnOpen": true,
  "python.linting.enabled": true,
  "python.terminal.activateEnvironment": false,
  "code-runner.executorMap": {
    "javascript": "node",
    "java": "cd $dir && javac $fileName && java $fileNameWithoutExt",
    "c": "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
    "cpp": "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
    "objective-c": "cd $dir && gcc -framework Cocoa $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
    "php": "php",
    "python": "python -u",
    "perl": "perl",
    "perl6": "perl6",
    "ruby": "ruby",
    "go": "go run",
    "lua": "lua",
    "groovy": "groovy",
    "powershell": "powershell -ExecutionPolicy ByPass -File",
    "bat": "cmd /c",
    "shellscript": "bash",
    "fsharp": "fsi",
    "csharp": "scriptcs",
    "vbscript": "cscript //Nologo",
    "typescript": "ts-node",
    "coffeescript": "coffee",
    "scala": "scala",
    "swift": "swift",
    "julia": "julia",
    "crystal": "crystal",
    "ocaml": "ocaml",
    "r": "Rscript",
    "applescript": "osascript",
    "clojure": "lein exec",
    "haxe": "haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt",
    "rust": "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
    "racket": "racket",
    "scheme": "csi -script",
    "ahk": "autohotkey",
    "autoit": "autoit3",
    "dart": "dart",
    "pascal": "cd $dir && fpc $fileName && $dir$fileNameWithoutExt",
    "d": "cd $dir && dmd $fileName && $dir$fileNameWithoutExt",
    "haskell": "runhaskell",
    "nim": "nim compile --verbosity:0 --hints:off --run",
    "lisp": "sbcl --script",
    "kit": "kitc --run",
    "v": "v run",
    "sass": "sass --style expanded",
    "scss": "scss --style expanded",
    "less": "cd $dir && lessc $fileName $fileNameWithoutExt.css",
    "FortranFreeForm": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
    "fortran-modern": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
    "fortran_fixed-form": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
    "fortran": "cd $dir && gfortran $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt"
  },
  "code-runner.runInTerminal": true,
  "picgo.picBed.github.repo": "vuanvin/cdn",
  "picgo.picBed.github.token": "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",
  "picgo.picBed.github.branch": "main",
  "picgo.picBed.github.path": "images/",
  "security.workspace.trust.untrustedFiles": "open",
  "notebook.cellToolbarLocation": {
    "default": "right",
    "jupyter-notebook": "left"
  },
  "files.exclude": {
    "**/.classpath": true,
    "**/.project": true,
    "**/.settings": true,
    "**/.factorypath": true
  },
  "jupyter.askForKernelRestart": false,
  "diffEditor.ignoreTrimWhitespace": false,
  "picgo.picBed.github.customUrl": "https://cdn.jsdelivr.net/gh/vuanvin/cdn",
  "picgo.picBed.current": "github",
  "picgo.customOutputFormat": "<img src=\"${url}\" alt=\"${uploadedName}\" height=\"80%\" width=\"80%\">",
  "go.toolsManagement.autoUpdate": true,
  "git.ignoreLegacyWarning": true,
  "github.copilot.enable": {
    "*": true,
    "yaml": false,
    "plaintext": false,
    "markdown": false,
    "cpp": true
  },
  "window.commandCenter": true,
  "redhat.telemetry.enabled": true,
  "explorer.autoReveal": false,
  "hexeditor.columnWidth": 16,
  "hexeditor.showDecodedText": true,
  "hexeditor.defaultEndianness": "little",
  "hexeditor.inspectorType": "aside",
  "better-comments.tags": [
    {
      "tag": "!",
      "color": "#FF2D00",
      "strikethrough": false,
      "underline": false,
      "backgroundColor": "transparent",
      "bold": false,
      "italic": false
    },
    {
      "tag": "?",
      "color": "#3498DB",
      "strikethrough": false,
      "underline": false,
      "backgroundColor": "transparent",
      "bold": false,
      "italic": false
    },
    {
      "tag": "//",
      "color": "#474747",
      "strikethrough": true,
      "underline": false,
      "backgroundColor": "transparent",
      "bold": false,
      "italic": false
    },
    {
      "tag": "hack",
      "color": "##DC143C",
      "strikethrough": false,
      "underline": false,
      "backgroundColor": "transparent",
      "bold": false,
      "italic": false
    },
    {
      "tag": "todo",
      "color": "#FF8C00",
      "strikethrough": false,
      "underline": false,
      "backgroundColor": "transparent",
      "bold": false,
      "italic": false
    },
    {
      "tag": "*",
      "color": "#98C379",
      "strikethrough": false,
      "underline": false,
      "backgroundColor": "transparent",
      "bold": false,
      "italic": false
    }
  ],
  "[rust]": {
    "editor.defaultFormatter": "rust-lang.rust-analyzer",
    "editor.formatOnSave": true
  },
  "clangd.arguments": [
    "-log=verbose",
    "-pretty",
    "--background-index",
    "--header-insertion=never"
    //"--query-driver=/bin/arm-buildroot-linux-gnueabihf-g++", //for cross compile usage
    // "--compile-commands-dir=/path/to/your/compile_commands_dir/"
  ],
  "clangd.fallbackFlags": [
    "-std=c++17"
  ],
  "vscode-neovim.neovimInitVimPaths.win32": "C:\\Users\\yuanyin\\AppData\\Local\\nvim.bak\\init.vim",
  "vim.autoSwitchInputMethod.defaultIM": "\"1033\"",
  "vim.autoSwitchInputMethod.obtainIMCmd": "C:\\Users\\yuanyin\\scoop\\shims\\im-select.exe",
  "vim.autoSwitchInputMethod.switchIMCmd": "C:\\Users\\yuanyin\\scoop\\shims\\im-select.exe {im}",
  "vim.foldfix": true,
  "vim.commandLineModeKeyBindingsNonRecursive": [],
  "vim.leader": "<space>",
  "vim.useSystemClipboard": true,
  "vim.easymotion": true,
  "vim.normalModeKeyBindingsNonRecursive": [
    {
      "before": [
        ","
      ],
      "after": [
        "<leader>",
        "<leader>",
        "<leader>",
        "b",
        "d",
        "w"
      ]
    },
    {
      "before": [
        "<leader>",
        "f"
      ],
      "after": [
        "<leader>",
        "<leader>",
        "2",
        "s"
      ]
    },
    {
      "before": [
        "<leader>",
        "s"
      ],
      "after": [
        "<leader>",
        "<leader>",
        "s"
      ]
    },
    {
      "before": [
        "<leader>",
        "j"
      ],
      "after": [
        "<leader>",
        "<leader>",
        "j"
      ]
    },
    {
      "before": [
        "<leader>",
        "k"
      ],
      "after": [
        "<leader>",
        "<leader>",
        "k"
      ]
    }
  ],
  "vim.normalModeKeyBindings": [
    {
      "before": [
        "<leader>",
        "t"
      ],
      "commands": [
        "workbench.action.toggleSidebarVisibility"
      ],
      "silent": true
    },
    {
      "before": [
        "<leader>",
        "s",
        "p"
      ],
      "commands": [
        "workbench.action.replaceInFiles"
      ],
      "silent": true
    },
    {
      "before": [
        "<leader>",
        "p",
        "p"
      ],
      "commands": [
        "projectManager.listProjects"
      ]
    },
    {
      "before": [
        "<leader>",
        "p",
        "e"
      ],
      "commands": [
        "projectManager.editProjects"
      ]
    },
    {
      "before": [
        "<C-w>",
        "<C-l>"
      ],
      "commands": [
        "workbench.action.moveEditorToRightGroup"
      ]
    },
    {
      "before": [
        "<C-w>",
        "<C-h>"
      ],
      "commands": [
        "workbench.action.moveEditorToLeftGroup"
      ]
    }
  ],
  "vim.enableNeovim": true,
  "vim.neovimPath": "nvim",
  "vim.camelCaseMotion.enable": true,
  "vim.autoSwitchInputMethod.enable": true,
  "leetcode.endpoint": "leetcode-cn",
  "leetcode.defaultLanguage": "cpp",
  "leetcode.useWsl": true,
  "leetcode.problems.sortStrategy": "Acceptance Rate (Ascending)",
  "leetcode.workspaceFolder": "/home/yuanyin/.leetcode",
  "leetcode.hint.configWebviewMarkdown": false,
  "leetcode.hint.commandShortcut": false,
  "clipboard-manager.preview": false,
  "clipboard-manager.snippet.enabled": false,
  "workbench.editor.revealIfOpen": true
  // "C_Cpp.intelliSenseEngine": "disabled"
}