# Git 관리 전략

팀 규모가 늘어나고, 작업의 범위가 넓어지게 되면 자동적으로 git을 통한 효율적인 형상관리와 branch 관리에 대해서 고민하게 될 수밖에 없다. 특정한 전략 없이 git branch를 개별적으로 관리하다보면, 배포에 포함되지 않아야 할 내용이 말려 올라가는 경우도 있고, 특정 기능의 롤백이 힘들어지거나, 히스토리를 추적하기 어려워지기 때문이다. 따라서 본 프로젝트에서도 일반적인 git branch 전략을 도입하고자 한다.

## Git-flow

git-flow 전략은 개발-배포준비-핫픽스 를 축으로 branch를 관리하는 전략이다. 해당 전략에 대한 일반적인 사항은 [우아한 형제들 개발팀의 해당 블로그](https://techblog.woowahan.com/2553/)에서 확인할 수 있으니, 자세히 읽어보기를 바란다. 다만 해당 블로그에 있는 내용을 전부 숙지하고 따르기에는 현실적으로 어려운 부분이 있을 거라 생각되어 몇 가지 반드시 지켜야 할 규칙이나 주의해서 살펴야 할 내용을 가상의 시나리오를 예로 들어, 블로그에서의 순서에 맞춰 아래에 기술한다.

### Git-flow를 사용하는 이유

> *이번 버전에 포함될 필수 작업과 함께 다음에 언젠가는 배포될 작업들을 병렬로 진행합니다. 병렬로 처리하던 작업들이 완료가 되면 가까운 배포 주기에 포함시켜 출시합니다.*

블로그에서는 git-flow 전략이 위와 같은 개발 프로세스를 가장 잘 반영할 수 있는 모델이라고 판단했다. 실제로, git-flow 전략에 따르면, **이번 버전에 포함될 필수 작업**과 **다음에 언젠가는 배포될 작업들**을 develop(이하 dev) branch로부터 개별 feature branch를 생성해 진행한다. release 일정이 확정된 상태이고, 이번 release 버전이 1.0.3이라고 가정하자. 각 기능 개발자들은 개발 마감 기한에 맞춰 **이번 버전에 포함될 필수 작업**을 진행하고 있는 feature branch를 dev branch에 merge하고, **다음에 언젠가는 배포될 작업들**을 진행하고 있는 feature branch 중, 작업이 완료됐고 이번 버전에 포함시켜도 되는 branch를 dev branch에 merge한다. 마지막으로 개발 마감 기한 시점에 dev branch에서 release/1.0.3 branch를 생성해 qa팀을 대상으로 배포를 진행한다.

### **Git Repository 구성 살펴보기**

블로그에서 언급한 repository 구성은 잠시 잊도록 하자. 현실적으로 일선 작업자가 알아야 할 부분은, local repository와 origin remote repository이다. 본 프로젝트에서는 **브랜치 관리를 위해서는 fork 기능을 사용하지 않을 것**이기 때문이다.

또한 **pr과 관련된 부분도 당분간 무시**하도록 한다. 따라서 본 프로젝트에서는 일반적으로 remote에는 dev, main, release/ branch들만이 존재하고, feature/ 와 hotfix/ branch들은 local에만 존재하게 된다. 다만, 추후 pr 정책이 도입될 경우에는 해당 문서 내에 별도 pr과 관련된 별도 지시사항을 공유하도록 한다.

### **작업을 할 때 지켜야할 서로 간의 약속**

1. 작업을 시작하기 전에 Jira 티켓을 생성한다.
    1. 본 프로젝트에서는 Notion에 task를 작성하는 것으로 대체한다. 다만, Jira와 Github는 ticket 연동이 되지만, Notion과 Bitbucket의 연동성에 대해서는 추후 R&D 사항이므로, 현재는 수동으로 작업 단위를 관리(Notion의 task와 branch 혹은 commit의 단위를 일치시키는 행위)하도록 한다.
2. 하나의 티켓은 되도록 하나의 커밋으로 한다.
    1. Notion의 task와 branch(commit)의 단위를 일치시키도록 노력한다. 해당 행위는 pr이 포함된 전략에서 원활한 코드 리뷰를 위해 반드시 필요하다.
3. 커밋 그래프는 최대한 단순하게 가져간다.
    1. rebase를 기본 merge 방식으로 채택하는 것을 의미한다. merge에는 다양한 방식이 있는데, 본 프로젝트에서는 단순하게, rebase를 의식적으로 사용하기만 하면 된다. rebase의 일반적인 수행 방식에 대해서는 [다음](https://www.notion.so/Git-7f00769187ad43a385564d46c8a14cc0?pvs=21)을 참고한다.
4. 서로 공유하는 브랜치의 커밋 그래프는 함부로 변경하지 않는다.
    1. 한 번 원격에 공유된 branch에 force push를 수행하거나, squash 작업 등을 수행하지 않는 것을 의미한다.
5. 리뷰어에게 꼭 리뷰를 받는다.
    1. pr 정책이 도입된 이후 해당 지시사항을 따른다.
6. 자신의 Pull Request는 스스로 merge 한다.
    1. pr 정책이 도입되기 전에는 local branch를 base remote repository에 직접 merge하면 된다. squash → rebase → merge 를 기본으로 한다.

### Git-flow 전략 간단하게 살펴보기

본 프로젝트에서 branch의 종류는 다음 다섯 가지이다.

- main : 현재 출시된 버전과 동일한 branch
    - 출시 시점마다 release/{버전명}의 형태로 tag를 생성한다.
- dev : 다음 출시될 버전까지의 코드를 공유하는 branch
    - main branch로부터 생성한다.
    - 생성된 release branch의 배포 버전보다 한 단계 다음 버전까지의 개발 완료된 내용만이 공유되어야 한다.
- feature : 각종 기능을 개발하는 branch
    - dev 혹은 release branch로부터 생성한다.
    - {feature type}/{기능명} 형태로 생성한다. ex) feature/home-ui-refactor
        - {feature type}에 해당하는 option은 다음과 같다.
            - feature : 일반 기능
            - fix : 버그 및 오류 수정 사항
            - refactor : 소스 혹은 UI/UX 상 개선 사항
            - etc : 기타 사항
    - 기능 개발이 완료되는 시점에, 각 base branch(dev, release)에 병합이 가능한 상황일 경우 병합한다.
- release : 각 출시 버전의 완성본을 준비하는 branch
    - dev branch로부터 생성한다.
    - release/{버전명} 형태로 생성한다. ex) release/1.0.3
    - qa가 완료되어 출시가 진행되는 시점에 dev와 main branch에 각각 병합하고 제거한다.
- hotfix : 현재 출시된 버전에서의 긴급 수정이 필요한 버그를 수정하는 branch
    - main branch로부터 생성한다.
    - hotfix/{버전명}/{기능명} 형태로 생성한다. ex) hotfix/1.0.3/home-api
    - 수정이 완료될 경우 release branch와 동일한 프로세스를 수행한다.

위 다섯 가지 branch 종류 중 main과 dev는 단일 branch로 유지하고, 나머지는 복수의 branch가 생겼다가 없어질 수 있다.

## Git 관련 참고 사항

### Commit Message

앞으로 git commit은 소스트리 등 visual tool을 사용하지 않고, cli를 사용해 공유된 template에 필요 내용을 작성하는 것을 원칙으로 한다.

#### Template 적용 방법

프로젝트 폴더의 .gitmessage.txt를 참고한다.

다만, 해당 내용 중, Jira에 관한 내용은 무시한다.

### 일반적인 Rebase 수행 시나리오

#### (PR 없음)dev에서 feature branch를 생성하여 작업하는 시나리오

remote branch와 연결된 local branch를 base로 하여 별도의 local branch를 생성하고, pr 없이 base branch로 병합하는 시나리오는 모두 해당 과정을 따르면 된다.

1. dev branch를 최신화한다.
    
    ```jsx
    git checkout dev
    git fetch -a // 아래 커맨드로 최신화할 경우에는 수행하지 않아도 됨
    git pull --rebase // 최신화의 경우에도 rebase를 기본 전략으로
    ```
    
2. dev branch에서 feature branch를 생성한다.
    
    ```jsx
    dev$ git checkout -b feature/something // 다른 branch 생성 커맨드를 사용해도 됨
    ```
    
3. 작업을 완료하고 commit을 수행한다.
    
    ```jsx
    feature/something$ git add . // 특정 파일 및 폴더만 add해도 괜찮으나, 이후 프로세스를 실행하기 전에 stash를 수행해야 한다.
    feature/something$ git commit // template을 사용해 message를 입력한다.
    ```
    
4. 병합 프로세스로 진행하기 전에 가능하면 commit을 하나로 squash한다.
    1. squash는 소스트리를 사용한다.
    2. rebase시 conflict가 발생할 경우, 커밋 하나 당 한 번의 conflict resolve 과정을 수행해야 하므로, squash가 권장된다.
5. 병합 전에 dev branch를 최신화한다.
6. feature branch에서 dev branch를 rebase한다.
    
    ```jsx
    dev$ git checkout feature/something
    feature/something$ git rebase dev
    ... // conflict 발생시 conflict resolve 과정 수행.
    ```
    
7. **(주의) 정상 실행을 확인한다.**
    1. 문제가 발생했을 경우, 추가 수정 작업을 진행 후, [3번 항목](https://www.notion.so/Git-7f00769187ad43a385564d46c8a14cc0?pvs=21)부터 다시 진행한다.
8. dev branch에서 feature branch를 merge한다.
    1. 해당 과정에서 문제가 발생했을 경우, [다음](https://www.notion.so/Git-7f00769187ad43a385564d46c8a14cc0?pvs=21)에 따라 상황에 맞게 대처한다.
    
    ```jsx
    feature/something$ git checkout dev
    dev$ git merge feature/something
    
    ```
    
9. remote dev repository에 upload한다.
    
    ```jsx
    dev$ git push
    ```
    
10. feature branch의 히스토리 관리가 필요하지 않게 되는 시점에 해당 branch를 제거한다.
    
    ```jsx
    git branch -d feature/something
    ```
    

### Squash(여러 커밋 병합)

- 방법
    
    [git squash - 여러개의 커밋로그를 하나로 묶기 : NHN Cloud Meetup](https://meetup.nhncloud.com/posts/39)
    
- 주의
    - 이미 원격에 push된 브랜치에서는 Squash를 수행하지 않는다.

### Amend(커밋 로그 수정)

```markdown
git commit —-amend
```

### 원격 브랜치 제거

```ruby
git push origin --delete <branch_name>
```

## Troubleshooting

### rebase 시 문제 상황

#### [해당 시나리오에서 문제가 발생한 경우](https://www.notion.so/Git-7f00769187ad43a385564d46c8a14cc0?pvs=21)

1. 8번 과정에서 문제가 발생한 경우
2. 9번 과정에서 문제가 발생한 경우