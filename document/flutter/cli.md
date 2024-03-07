# CLI

flutter의 명령어에 대해 설명한다.

### 1. flutter create

#### app project 생성

flutter create --org {조직명} --project-name {프로젝트명} --platforms {플랫폼} -e {상대경로}

##### 예시

```
flutter create --org carbonic --project-name sort_demo --platforms android,ios -e sort_demo
```

#### pub package 생성

flutter create --org {조직명} --project-name {패키지명} -t package {상대경로}

##### 예시

```
flutter create --org carbonic --project-name carbonic_korea_region_code -t package korea-region-code
```
