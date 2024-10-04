# Makefile for creating new C projects with templates

# 默认目标：帮助信息
.PHONY: help
help:
	@echo "Usage:"
	@echo "  make new PROJECT=new_project_name  # 创建一个包含模板文件的 C 项目"

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
	@cp templates/test.c.template $(PROJECT)/tests/test.c
	@cp templates/fibonacci.h.template $(PROJECT)/include/fibonacci.h
	@cp templates/fibonacci.c.template $(PROJECT)/src/fibonacci.c
	@cp templates/README.md.template $(PROJECT)/README.md
	@cp templates/gitignore.template $(PROJECT)/.gitignore
	@cd $(PROJECT) && git init
	@echo "Project $(PROJECT) created successfully."
