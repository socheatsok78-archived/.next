CONFIG_PATH=./lib/configs
VSCODE_EXTENSIONS=${CONFIG_PATH}/vscode-extensions.txt

build: build-start vscode
	@echo "\nBuild completed!"

build-start:
	@echo "Building dotfile configuratioons...\n"

vscode:
	@echo "    - Generating Visual Studio Code Extensions"
	@code --list-extensions >> ${VSCODE_EXTENSIONS}
