# C++ Template (for VSCode + Docker)

## Usage

1. Coding : Write `src/**/*` .
1. When file added, generate Makefile : Run `bin/bin/regenerate_makefile.rb` .
1. Build & Run : `F5` on VSCode (or run `make build run`)

## MEMO

### Linter

```sh
clang-format -style=google -dump-config > .clang-format
```

* .clang-format
* (auto format on save) .vscode/settings.json

### C++ intellisense

`[ctrl + p] > [C/C++: Edit Configurations (JSON)]`

* .vscode/c_cpp_properties.json
* .vscode/settings.json

### Build task

`[ctrl + p] > [Tasks: Configure Default Build Task] > [Create tasks.json file from template] > [Others]`

* .vscode/tasks.json

### Launcher

* .vscode/launch.json
