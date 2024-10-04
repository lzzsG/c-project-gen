# C 项目模板生成器

[English](# C Project Template Generator)

该项目提供了一个用于生成 C 项目的模板，支持使用 **CUnit** 进行单元测试。它能够自动设置基本的 C 项目结构，包含源文件、头文件、单元测试和用于构建、测试、调试的 `Makefile`。

## 使用方法

要使用此模板创建一个新的 C 项目，请运行以下命令：

```bash
make new PROJECT=new_project_name
```

这将在当前目录下生成一个名为 `new_project_name` 的新项目，目录结构如下：

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

- **自动化项目设置**：自动创建必要的文件夹结构，复制模板文件并初始化 Git 仓库。
- **单元测试支持**：内置 **CUnit** 单元测试框架的示例，方便用户快速添加和运行测试。
- **跨平台兼容**：生成的 `Makefile` 支持 macOS 和 Linux，并自动调整编译器选项以适应不同平台。
- **模块化结构**：模板项目将源文件、头文件、测试文件分开存放，便于管理代码。
- **文档生成**：自动生成 `README.md` 文件，详细说明项目的使用和结构。
- 更多模板使用方法请参考[template_README.md](template_README.md)。

## 模板文件

`templates/` 目录包含以下模板文件，它们会被复制到新生成的项目中：

- `Makefile.template`：项目的 `Makefile` 模板，负责构建、测试和调试任务。
- `main.c.template`：项目主程序的入口模板。
- `test.c.template`：使用 **CUnit** 进行单元测试的模板文件。
- `fibonacci.h.template`：Fibonacci 函数的示例头文件。
- `fibonacci.c.template`：Fibonacci 函数的示例实现。
- `README.md.template`：生成项目时的 README 模板，详细介绍项目的使用和结构。
- `.gitignore.template`：`.gitignore` 文件模板，用于忽略不需要纳入版本控制的文件。

## 快速上手

1. **创建新项目**：

   ```bash
   make new PROJECT=my_project
   ```

   这将在当前目录下创建一个名为 `my_project` 的新项目，并自动复制模板文件。

2. **进入项目目录**：

   ```bash
   cd my_project
   ```

3. **阅读内层 README 文件**：
   新生成项目的 `README.md` 文件包含了关于项目的详细使用说明，包括如何构建、运行和测试项目。

## 许可证

该模板项目基于 MIT 许可证。详情请参阅 `LICENSE` 文件。

---

# C Project Template Generator

This project provides a template for generating new C projects with unit testing using **CUnit**. It automates the process of setting up a basic C project structure, complete with source files, header files, unit tests, and a `Makefile` for easy building, testing, and debugging.

## Usage

To create a new C project using this template, run the following command:

```bash
make new PROJECT=new_project_name
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

- **Automated project setup**: Creates the necessary folder structure, copies template files, and initializes a Git repository.
- **Unit testing support**: Comes with a sample test suite using **CUnit**, making it easy to add and run tests.
- **Cross-platform compatibility**: The generated `Makefile` supports macOS and Linux, and automatically adjusts compiler flags for each platform.
- **Modular structure**: Project template includes separate directories for source files, header files, and test files, promoting organized code structure.

## Template Files

The `templates/` directory contains the following template files that will be copied into the new project:

- `Makefile.template`: Template for the project's `Makefile`, which handles building, testing, and debugging.
- `main.c.template`: Template for the main entry point of the project.
- `test.c.template`: Template for unit testing using **CUnit**.
- `fibonacci.h.template`: Example header file for the Fibonacci function.
- `fibonacci.c.template`: Example implementation of the Fibonacci function.
- `README.md.template`: Template for the README file within the generated project, which provides detailed information on project usage and structure.
- `.gitignore.template`: Template for the `.gitignore` file to exclude common unwanted files from version control.

## Getting Started

1. **Create a new project**:

   ```bash
   make new PROJECT=my_project
   ```

   This will create a directory called `my_project` with the necessary files and directories based on the templates.

2. **Navigate to the project directory**:

   ```bash
   cd my_project
   ```

3. **Read the internal README**:
   For more detailed information about the inner workings of the project, including how to build, run, and test the project, refer to the `README.md` file inside the generated project directory.

## License

This template project is licensed under the MIT License. See the `LICENSE` file for more details.
