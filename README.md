# carbonic

<!-- 추후 submodule 관련 md 문서 작성 후 링크 -->

- submodule add 방법

        git submodule add {Git Repository URL} {Submodule Project directory}

- submodule 포함하여 clone할 경우

        git clone --recurse-submodules

- submodule 초기화

        git submodule init
        git submodule update

- submodule 변경사항 반영

        git submodule update --remote
