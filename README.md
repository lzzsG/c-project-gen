# C 项目模板生成器

这个项目提供了一个用于生成新的 C 项目的模板，集成了 **Criterion** 单元测试框架，简化了项目的设置、编译和测试。根据不同的操作系统（macOS 和 Linux）自动配置编译器和调试工具。

## 使用方法

要使用这个模板创建一个新的 C 项目，请运行以下命令：

```bash
make new PROJ=new_project_name
```

这将在当前目录下生成一个名为 `new_project_name` 的新项目，项目结构如下：

```
new_project_name/
├── bin/                # 编译后的二进制文件
├── include/            # 头文件 (.h)
│   └── fibonacci.h     # 示例头文件
├── obj/                # 编译生成的目标文件 (.o)
├── src/                # 源代码 (.c)
│   ├── fibonacci.c     # 示例 Fibonacci 实现
│   └── main.c          # 主程序入口
├── tests/              # 单元测试文件
│   └── test.c          # 示例测试套件
├── Makefile            # 自动生成的 Makefile
└── README.md           # 自动生成的项目说明文档
```

## 功能

- **自动化项目设置**：自动创建必要的目录结构，复制模板文件，并初始化 Git 仓库。
- **支持 Criterion 单元测试**：集成 **Criterion** 测试框架，方便用户快速编写和运行测试。
- **跨平台兼容**：`Makefile` 支持 macOS 和 Linux，并自动调整编译选项以适应不同平台。
- **模块化结构**：项目模板将源文件、头文件和测试文件分离存放，便于代码管理。
  
## 模板文件

`templates/` 目录包含以下模板文件，这些文件会被复制到新生成的项目中：

- `Makefile.template`：负责项目的构建、测试和调试的 `Makefile` 模板。
- `main.c.template`：主程序入口模板。
- `test.c.template`：基于 **Criterion** 编写的单元测试模板。
- `fibonacci.h.template`：Fibonacci 函数的示例头文件。
- `fibonacci.c.template`：Fibonacci 函数的示例实现。
- `README.md.template`：项目使用说明的模板。
- `.gitignore.template`：用于忽略不需要纳入版本控制的文件的模板。

## 快速上手

1. **创建新项目**：

   ```bash
   make new PROJ=my_project
   ```

   这将在当前目录下创建一个名为 `my_project` 的新项目，并复制所有模板文件。

2. **进入项目目录**：

   ```bash
   cd my_project
   ```

3. **查看 README 文件**：
   新生成项目的 `README.md` 文件包含了关于项目的详细使用说明，包括如何构建、运行和测试项目。

```

   make new PROJ=new_project_name # 创建一个包含模板文件的 C 项目
   make build                        # 编译项目
   make run                          # 编译并运行项目
   make build_test                   # 编译测试套件
   make test                         # 运行测试
   make clean                        # 清理生成的文件
   make check                        # 只检查语法
   make debug                        # 调试项目

```

## 构建和运行

### 构建主程序

使用以下命令来构建主程序：

```bash
make build
```

这会编译 `src/` 目录中的源文件，并将生成的二进制文件放在 `bin/` 目录中。

### 运行主程序

构建完成后，可以使用以下命令运行主程序：

```bash
make run
```

### 构建并运行测试

该项目使用 **Criterion** 进行单元测试。要构建并运行测试，请使用以下命令：

```bash
make build_test   # 构建测试套件
make test         # 运行测试
make test VB=1    # 启用详细输出模式
```

### 调试

项目支持 `gdb`（Linux）和 `lldb`（macOS）调试工具。可以通过以下命令启动调试模式：

```bash
make debug
```

## 清理项目

要清理生成的二进制文件和目标文件，请运行：

```bash
make clean
```

## 添加新代码

1. **添加源文件**：
   - 将新的 `.c` 文件放入 `src/` 目录。
   - 在 `include/` 目录中创建相应的头文件。
   - 例如，添加一个新函数 `foo` 时，创建 `src/foo.c` 和 `include/foo.h`。

2. **更新 `Makefile`**：
   - `Makefile` 会自动检测 `src/` 目录中的新 `.c` 文件，无需手动更新。

## 添加新测试

1. **编写测试函数**：

   在 `tests/test.c` 中引入需要测试的头文件：

   ```c
   #include "../include/foo.h"
   ```

   使用 **Criterion** 框架编写测试用例：

   ```c
   Test(FooSuite, test_foo) {
       cr_assert_eq(foo(1), expected_value, "Expected: %d, but got: %d", expected_value, foo(1));
   }
   ```

2. **运行测试**：

   使用 `make test` 运行测试套件：

   ```bash
   make test
   ```

   使用 `make test VB=1` 可以启用详细模式，输出更详细的测试结果。

## 许可证

该模板项目基于 MIT 许可证。有关更多信息，请查看 `LICENSE` 文件。



---

# C Project Template Generator

This project provides a template for generating new C projects with unit testing using **Criterion**, simplifying project setup, compilation, and testing. The structure automatically configures based on platform (macOS and Linux), supporting platform-specific compilers and debugging tools.

## Usage

To create a new C project using this template, run the following command:

```bash
make new PROJ=new_project_name
```

This will generate a new project directory named `new_project_name` with the following structure:

```
new_project_name/
├── bin/                # Compiled binaries
├── include/            # Header files (.h)
│   └── fibonacci.h     # Example header file
├── obj/                # Compiled object files (.o)
├── src/                # Source files (.c)
│   ├── fibonacci.c     # Example Fibonacci implementation
│   └── main.c          # Main program
├── tests/              # Unit test files
│   └── test.c          # Example test suite
├── Makefile            # Automatically generated Makefile
└── README.md           # Generated README with project details
```

## Features

- **Automated project setup**: Automatically creates folder structures, copies template files, and initializes a Git repository.
- **Unit testing with Criterion**: Includes sample test cases for **Criterion**, making it easy to add and run tests.
- **Cross-platform compatibility**: The generated `Makefile` supports macOS and Linux, automatically adjusting compiler flags.
- **Modular structure**: Source, header, and test files are separated for better code organization.

## Template Files

The `templates/` directory contains the following template files that will be copied into the new project:

- `Makefile.template`: Template for the project's `Makefile`, which handles building, testing, and debugging.
- `main.c.template`: Template for the main entry point of the project.
- `test.c.template`: Template for unit tests using **Criterion**.
- `fibonacci.h.template`: Example header file for the Fibonacci function.
- `fibonacci.c.template`: Example implementation of the Fibonacci function.
- `README.md.template`: Template for the project's README file, providing usage instructions and structure.
- `.gitignore.template`: Template for `.gitignore` to exclude unnecessary files from version control.

## Getting Started

1. **Create a new project**:

   ```bash
   make new PROJ=my_project
   ```

   This command generates the `my_project` directory with the files based on the templates.

2. **Navigate to the project directory**:

   ```bash
   cd my_project
   ```

3. **Review the internal README**:  
   Refer to the `README.md` in the generated project for detailed information on building, running, and testing.

## Building and Testing

To build the project:

```bash
make build
```

To run the project:

```bash
make run
```

To build and run tests:

```bash
make build_test
make test
```

For more detailed output, you can run tests in verbose mode:

```bash
make test VB=1
```

## Debugging

To debug the project, use:

```bash
make debug
```

## License

This template project is licensed under the MIT License. For more information, see the `LICENSE` file.
