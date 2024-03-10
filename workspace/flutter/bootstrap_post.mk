# makefile 작성시 indent 설정을 tab으로 하여야 한다.
# 따라서 vscode 하단의 space를 클릭 -> tabsize: 4로 변경하여 작성하여야 함.
bootstrap_post:
	dart pub run build_runner build --delete-conflicting-outputs