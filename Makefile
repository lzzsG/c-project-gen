# Makefile for creating new C projects with templates

# 默认目标：帮助信息
.PHONY: help
help:
	@echo "Usage:"
	@echo "  make new PROJECT=new_project_name  # 创建一个包含模板文件的 C 项目"
	@echo "  make build                        # 编译项目"
	@echo "  make run                          # 编译并运行项目"
	@echo "  make test                         # 运行测试"
	@echo "  make clean                        # 清理生成的文件"
	@echo "  make check                        # 只检查语法"

# 创建新项目的目标
.PHONY: new
new:
	@if [ -z "$(PROJECT)" ]; then \
		echo "Error: 请使用 make new PROJECT=new_project_name"; \
		exit 1; \
	fi
	@echo "Creating new project: $(PROJECT)"
	@mkdir -p $(PROJECT)/src $(PROJECT)/include $(PROJECT)/tests $(PROJECT)/bin $(PROJECT)/obj
	@cp templates/Makefile.template $(PROJECT)/Makefile
	@cp templates/main.c.template $(PROJECT)/src/main.c
	@cp templates/README.md.template $(PROJECT)/README.md
	@cp templates/run_tests.sh.template $(PROJECT)/tests/run_tests.sh
	@chmod +x $(PROJECT)/tests/run_tests.sh
	@echo "Project $(PROJECT) created successfully."

# 模板Makefile生成
Makefile.template:
	@echo "Generating Makefile template..."
	@echo "# 通用 Makefile" > Makefile.template
	@echo "CC=gcc" >> Makefile.template
	@echo "CFLAGS=-Wall -Wextra -O2" >> Makefile.template
	@echo "SRC_DIR=src" >> Makefile.template
	@echo "OBJ_DIR=obj" >> Makefile.template
	@echo "BIN_DIR=bin" >> Makefile.template
	@echo 'SRCS=$(wildcard $(SRC_DIR)/*.c)' >> Makefile.template
	@echo 'OBJS=$(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))' >> Makefile.template
	@echo '$(BIN_DIR)/$(PROJECT): $(OBJS)' >> Makefile.template
	@echo '	$(CC) $(CFLAGS) $(OBJS) -o $@' >> Makefile.template
	@echo '$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c' >> Makefile.template
	@echo '	$(CC) $(CFLAGS) -c $< -o $@' >> Makefile.template
	@echo "clean:" >> Makefile.template
	@echo "	rm -rf $(OBJ_DIR) $(BIN_DIR)" >> Makefile.template
