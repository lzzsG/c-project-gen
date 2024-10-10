# C 项目模板（带单元测试）

[English](#c-project-template-with-unit-testing)

这是一个 C 项目模板，旨在简化设置、编译和使用 **Criterion** 进行单元测试。该项目根据不同平台（macOS 和 Linux）进行自动配置，支持平台特定的编译器和调试工具。

## 目录

- [项目结构](#项目结构)
- [功能](#功能)
- [先决条件](#先决条件)
- [项目构建](#项目构建)
  - [构建主程序](#构建主程序)
  - [运行主程序](#运行主程序)
  - [构建并运行测试](#构建并运行测试)
  - [调试](#调试)
  - [清理项目](#清理项目)
- [添加新代码](#添加新代码)
- [添加新测试](#添加新测试)
- [完整使用流程](#完整使用流程)
- [许可证](#许可证)

## 项目结构

```
my_project/
├── bin/                # 编译生成的二进制文件
├── include/            # 头文件 (.h)
│   └── fibonacci.h     # 示例 Fibonacci 头文件
├── obj/                # 编译生成的目标文件 (.o)
├── src/                # 源代码 (.c)
│   ├── fibonacci.c     # 示例 Fibonacci 实现
│   └── main.c          # 主程序入口
├── tests/              # 单元测试代码 (.c)
│   └── test.c          # 示例 Fibonacci 测试套件
├── Makefile            # 构建系统
└── README.md           # 项目文档（本文件）
```

## 功能

- **跨平台支持**：根据 macOS 和 Linux 平台自动调整编译和调试工具。
- **单元测试**：使用 **CUnit** 测试框架，提供测试示例，方便扩展。
- **Makefile 自动化**：`Makefile` 处理编译、测试和调试任务。

## 先决条件

开始之前，需要安装以下工具：

- **Criterion**:
  - macOS: `brew install criterion`
  - Linux: `sudo apt install criterion`
- **gcc**（大多数 Linux 系统预装，macOS 可通过 Xcode 安装）。
- **gdb** 或 **lldb**:
  - macOS: 系统自带 `lldb`。
  - Linux: `sudo apt install gdb`

## 项目构建

项目附带了一个 `Makefile`，用于自动化处理构建、测试和调试流程。以下是常用的命令说明。

使用以下命令查看帮助：

```bash
make help
```

### 构建主程序

使用以下命令构建主程序：

```bash
make build
```

这将编译 `src/` 目录中的源文件，并将生成的二进制文件放在 `bin/` 目录中。

### 运行主程序

构建完成后，可以通过以下命令运行主程序：

```bash
make run
```

使用 `make check` 可以快速检查代码语法错误，而不执行实际的编译或链接。

在不生成目标文件的情况下，只检查源代码的语法错误，可以使用：

```bash
make check
```

此命令不会编译项目，只会进行语法检查，确保代码没有明显的语法错误。

### 构建并运行测试

该项目使用 **Criterion** 进行单元测试。要构建并运行测试：

```bash
make build_test   # 构建测试套件
make test         # 运行测试
make test VB=1    # 启用 verbose 模式运行测试
```

### 调试

该项目支持使用 `gdb`（Linux）和 `lldb`（macOS）进行调试。通过以下命令启动调试：

```bash
make debug
```

- **macOS**：使用 `lldb` 进行调试。
- **Linux**：使用 `gdb` 进行调试。

进入调试器后，可以设置断点、运行程序、逐步执行代码：

```bash
(lldb) b main       # 在 main 函数设置断点
(lldb) run          # 运行程序
(lldb) step         # 逐步执行代码
(lldb) continue     # 继续执行
(lldb) quit         # 退出调试器
```

### 清理项目

要清理项目中生成的二进制文件和目标文件，可以使用以下命令：

```bash
make clean
```

此命令将删除 `bin/` 和 `obj/` 目录，清理所有编译生成的文件。

## 添加新代码

1. **添加源文件**：
   - 将新的 `.c` 文件放入 `src/` 目录。
   - 在 `include/` 目录中创建相应的头文件。
   - 例如，要添加一个新函数 `foo`，可以将 `foo.c` 添加到 `src/`，并将 `foo.h` 添加到 `include/`。

2. **编辑 `Makefile`**：
   - `Makefile` 会自动检测 `src/` 目录中的新 `.c` 文件，无需手动编辑。

## 添加测试

1. **创建测试函数**：

   - 在 `tests/test.c` 中引入要测试的头文件：

     ```c
     #include "../include/foo.h"
     ```

   - 使用 **Criterion** 框架编写测试用例：

     ```c
     Test(FooSuite, test_foo) {
         cr_assert_eq(foo(1), expected_value, "Expected: %d, but got: %d", expected_value, foo(1));
     }
     ```

2. **运行测试**：

   - 使用 `make test` 构建并运行测试套件：

     ```bash
     make test
     ```

   - 如果需要详细的测试输出，可以使用以下命令启用 `verbose` 模式：

     ```bash
     make test VB=1
     ```

## 完整使用流程

1. **生成项目**：

   - 运行以下命令生成一个新项目：

     ```bash
     make new PROJ=my_project
     ```

2. **修改 `main.c` 文件**：

   - 在 `src/main.c` 中修改主程序的实现。例如，将 `Hello, World!` 修改为自定义功能代码。

     ```c
     #include <stdio.h>
     #include "fibonacci.h"  // 包含 Fibonacci 函数头文件
     
     int main() {
         int n = 10;
         printf("Fibonacci(%d) = %d\n", n, fibonacci(n));
         return 0;
     }
     ```

3. **添加/修改头文件**：

   - 在 `include/` 目录中编辑或添加新的头文件。例如，编辑 `fibonacci.h` 文件：

     ```c
     #ifndef FIBONACCI_H
     #define FIBONACCI_H
     
     int fibonacci(int n);
     
     #endif
     ```

4. **实现新函数**：

   - 在 `src/` 目录中编写新函数的实现。例如，编写 `fibonacci.c` 文件：

     ```c
     #include "fibonacci.h"
     
     int fibonacci(int n) {
         if (n <= 1) return n;
         return fibonacci(n - 1) + fibonacci(n - 2);
     }
     ```

5. **编写测试用例**：

   - 在 `tests/` 目录中修改或添加测试用例。例如，修改 `test.c` 以测试 Fibonacci 函数：

    ```c
    #include <criterion/criterion.h>
    #include "../include/fibonacci.h" // 包含 Fibonacci 函数的头文件
    /* 测试 Fibonacci 递归实现 */
    Test(FibonacciSuite, test_fibonacci_recursive)
    {
        cr_assert_eq(fibonacci_recursive(0), 0, "Expected: %d, but got: %d", 0, fibonacci_recursive(0));
        cr_assert_eq(fibonacci_recursive(1), 1, "Expected: %d, but got: %d", 1, fibonacci_recursive(1));
        cr_assert_eq(fibonacci_recursive(2), 1, "Expected: %d, but got: %d", 1, fibonacci_recursive(2));
        cr_assert_eq(fibonacci_recursive(10), 55, "Expected: %d, but got: %d", 55, fibonacci_recursive(10));
    }

    /*测试 Fibonacci 迭代实现*/
    Test(FibonacciSuite, test_fibonacci_iterative)
    {
        cr_assert_eq(fibonacci_iterative(0), 0, "Expected: %d, but got: %d", 0, fibonacci_iterative(0));
        cr_assert_eq(fibonacci_iterative(1), 55, "Expected: %d, but got: %d", 55, fibonacci_iterative(1)); // 失败示例
        cr_assert_eq(fibonacci_iterative(2), 1, "Expected: %d, but got: %d", 1, fibonacci_iterative(2));
        cr_assert_eq(fibonacci_iterative(10), 55, "Expected: %d, but got: %d", 55, fibonacci_iterative(10));
    }
    ```

6. **构建项目**：

   - 使用 `make build` 构建项目：

     ```bash
     make build
     ```

7. **运行项目**：

   - 构建完成后，使用 `make run` 运行项目：

     ```bash
     make run
     ```

8. **构建并运行测试**：

   - 使用以下命令构建并运行测试：

     ```bash
     make build_test
     make test
     ```

9. **调试项目**：

   - 通过以下命令进入调试模式：

     ```bash
     make debug
     ```

10. **清理项目**：

- 使用 `make clean` 清理项目生成的文件：

  ```bash
  make clean
  ```

## 许可证

本项目使用 MIT 许可证。有关更多信息，请查看 [LICENSE](LICENSE) 文件。

---

# C Project Template (with Unit Testing)

[中文](#c项目模板带单元测试)

This is a C project template designed to simplify setup, compilation, and unit testing with **Criterion**. The project automatically configures itself for different platforms (macOS and Linux), supporting platform-specific compilers and debugging tools.

## Table of Contents

- [Project Structure](#project-structure)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Building the Project](#building-the-project)
  - [Build Main Program](#build-main-program)
  - [Run Main Program](#run-main-program)
  - [Build and Run Tests](#build-and-run-tests)
  - [Debugging](#debugging)
  - [Clean the Project](#clean-the-project)
- [Adding New Code](#adding-new-code)
- [Adding New Tests](#adding-new-tests)
- [Full Usage Workflow](#full-usage-workflow)
- [License](#license)

## Project Structure

```
my_project/
├── bin/                # Compiled binaries
├── include/            # Header files (.h)
│   └── fibonacci.h     # Example Fibonacci header
├── obj/                # Compiled object files (.o)
├── src/                # Source code (.c)
│   ├── fibonacci.c     # Example Fibonacci implementation
│   └── main.c          # Main entry point
├── tests/              # Unit tests (.c)
│   └── test.c          # Example Fibonacci test suite
├── Makefile            # Build system
└── README.md           # Project documentation (this file)
```

## Features

- **Cross-platform support**: Automatically adjusts for macOS and Linux platforms, including compiler and debugger support.
- **Unit Testing**: Includes **Criterion** testing framework with sample tests for easy extension.
- **Makefile Automation**: The `Makefile` manages compilation, testing, and debugging tasks.

## Prerequisites

Before starting, you will need to install the following tools:

- **Criterion**:
  - macOS: `brew install criterion`
  - Linux: `sudo apt install criterion`
- **gcc** (usually pre-installed on Linux, or available on macOS via Xcode).
- **gdb** or **lldb**:
  - macOS: Comes with `lldb`.
  - Linux: `sudo apt install gdb`

## Building the Project

This project includes a `Makefile` to automate the build, test, and debugging processes. Below are the commands for common actions.

View help with the following command:

```bash
make help
```

### Build Main Program

To build the main program, run:

```bash
make build
```

This will compile the source files in the `src/` directory and place the generated binary in the `bin/` directory.

### Run Main Program

Once built, you can run the main program with:

```bash
make run
```

### Build and Run Tests

This project uses **Criterion** for unit testing. To build and run the tests:

```bash
make build_test   # Build the test suite
make test         # Run the tests
make test VB=1    # Enable verbose mode for detailed test output
```

### Debugging

This project supports debugging with either `gdb` (on Linux) or `lldb` (on macOS). Start debugging with:

```bash
make debug
```

- **macOS**: Uses `lldb` for debugging.
- **Linux**: Uses `gdb` for debugging.

Inside the debugger, you can set breakpoints, run the program, and step through code:

```bash
(lldb) b main       # Set a breakpoint at the main function
(lldb) run          # Run the program
(lldb) step         # Step into functions
(lldb) continue     # Continue execution
(lldb) quit         # Exit the debugger
```

### Clean the Project

To clean the project by removing generated binaries and object files, run:

```bash
make clean
```

This will delete the `bin/` and `obj/` directories, clearing out all compiled files.

## Adding New Code

1. **Add Source Files**:
   - Place new `.c` files in the `src/` directory.
   - Create corresponding header files in the `include/` directory.
   - For example, to add a new function `foo`, place `foo.c` in `src/` and `foo.h` in `include/`.

2. **Edit the `Makefile`**:
   - The `Makefile` will automatically detect new `.c` files in the `src/` directory, so no manual edits are needed.

## Adding New Tests

1. **Create Test Functions**:

   - In `tests/test.c`, include the header file for the function you want to test:

     ```c
     #include "../include/foo.h"
     ```

   - Write the test case using the **Criterion** framework:

     ```c
     Test(FooSuite, test_foo) {
         cr_assert_eq(foo(1), expected_value, "Expected: %d, but got: %d", expected_value, foo(1));
     }
     ```

2. **Run the Tests**:

   - Use `make test` to build and run the test suite:

     ```bash
     make test
     ```

   - For more detailed output, enable verbose mode with:

     ```bash
     make test VB=1
     ```

## Full Usage Workflow

1. **Generate a New Project**:

   Run the following command to generate a new project:

   ```bash
   make new PROJ=my_project
   ```

2. **Modify `main.c`**:

   Edit `src/main.c` to implement your desired functionality. For example:

   ```c
   #include <stdio.h>
   #include "fibonacci.h"  // Include the Fibonacci header
     
   int main() {
       int n = 10;
       printf("Fibonacci(%d) = %d\n", n, fibonacci(n));
       return 0;
   }
   ```

3. **Add/Edit Header Files**:

   Edit or add new header files in the `include/` directory. For example, modify `fibonacci.h`:

   ```c
   #ifndef FIBONACCI_H
   #define FIBONACCI_H
   
   int fibonacci(int n);
   
   #endif
   ```

4. **Implement the Function**:

   Implement the function in the `src/` directory, for example, in `fibonacci.c`:

   ```c
   #include "fibonacci.h"
   
   int fibonacci(int n) {
       if (n <= 1) return n;
       return fibonacci(n - 1) + fibonacci(n - 2);
   }
   ```

5. **Write Test Cases**:

   In the `tests/` directory, add or modify test cases to test the Fibonacci function:

   ```c
   #include <criterion/criterion.h>
   #include "../include/fibonacci.h"
   
   /* Test Fibonacci Recursive */
   Test(FibonacciSuite, test_fibonacci_recursive) {
       cr_assert_eq(fibonacci_recursive(0), 0, "Expected: %d, but got: %d", 0, fibonacci_recursive(0));
       cr_assert_eq(fibonacci_recursive(1), 1, "Expected: %d, but got: %d", 1, fibonacci_recursive(1));
       cr_assert_eq(fibonacci_recursive(2), 1, "Expected: %d, but got: %d", 1, fibonacci_recursive(2));
       cr_assert_eq(fibonacci_recursive(10), 55, "Expected: %d, but got: %d", 55, fibonacci_recursive(10));
   }
   ```

6. **Build the Project**:

   Use `make build` to compile the project:

   ```bash
   make build
   ```

7. **Run the Program**:

   Once built, use `make run` to run the program:

   ```bash
   make run
   ```

8. **Build and Run Tests**:

   Use the following commands to build and run the tests:

   ```bash
   make build_test
   make test
   ```

9. **Debug the Project**:

   Enter debugging mode with the following command:

   ```bash
   make debug
   ```

10. **Clean the Project**:

    Clean the generated files and directories with:

    ```bash
    make clean
    ```

## License

This project is licensed under the MIT License. For more information, see the [LICENSE](LICENSE) file.
