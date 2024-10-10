# Makefile for creating new C PROJs with templates

# 默认目标：帮助信息
.PHONY: help
help:
	@echo "Usage:"
	@echo "  make new PROJ=new_project_name  # 创建一个包含模板文件的 C 项目"

# 创建新项目的目标
.PHONY: new
new:
	@if [ -z "$(PROJ)" ]; then \
		echo "Error: 请使用 make new PROJ=new_PROJ_name"; \
		exit 1; \
	fi
	@echo "Creating new PROJ: $(PROJ)"
	@mkdir -p $(PROJ)/src $(PROJ)/include $(PROJ)/tests $(PROJ)/bin $(PROJ)/obj
	@cp templates/Makefile.template $(PROJ)/Makefile
	@cp templates/main.c.template $(PROJ)/src/main.c
	@cp templates/test.c.template $(PROJ)/tests/test.c
	@cp templates/fibonacci.h.template $(PROJ)/include/fibonacci.h
	@cp templates/fibonacci.c.template $(PROJ)/src/fibonacci.c
	@cp templates/README.md.template $(PROJ)/README.md
	@cp templates/gitignore.template $(PROJ)/.gitignore
	@cd $(PROJ) && git init
	@echo "PROJ $(PROJ) created successfully."
