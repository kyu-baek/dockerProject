# FROM
# 베이스 이미지 지정 명령

# LABEL
# LABEL은 = 형식으로 메타 데이터를 넣을 수 있는 기능이다.
# 보통 저자, 버전, 설명, 작성일자 등 각각 key, 오른쪽은 설명값.

# CMD
# 해당 dockerfile로 만든 이미지를 기반으로 컨테이너를 만들었을 때,
# 해당 컨테이너가 실행될때 가장 먼저 실행될 프로그램을 기술
# CMD는 하나의 Dockerfile에서 한 가지만 설정된다

# RUN
# 도커 명령어의 run(이미지로 컨테이너 만들고 실행할 때)와 다른 명령어이다.
# docker는 이미지를 생성 할 때, 하나의 layer만 쓰는 것이 아니라,
# 여러 단계의 layer를 층층이 쌓아 작성한다.
# RUN 명령은 이미지 생성시, 일종의 layer를 만들 수 있는 단계로,
# 보통 베이스 이미지에 패키지(프로그램)을 추가로 설치하여 새로운 이미지를 만들 때 사용한다.
# 이렇게 한다면 특정 단계를 변경 할 때, 전체 이미지를 다시 다운로드 받는 번거로움을 해결할 수 있다

# ENTRYPOINT
# 만약 Dockerfile로 이미지를 만든 다음 컨테이너를 
# docker run으로 생성/실행하면서 명령문을 같이 적으며 실행한다면,
# 기존 이미지에 있던 CMD 명령이 터미널 명령으로 덮어씌워진다.
# 하지만, 이미지에 Entrypoint 항목이 있다면,
# docker run으로 명령을 실행 하더라도 Entrypoint의 명령에 영향을 끼치지 못하고,
# Entrypoint의 명령 뒤에 쭉 인자로 나열을 하게 된다.

#설명 출처: https://velog.io/@tjdwns2243/dockerfile-문법-작성법

FROM debian:buster

RUN apt-get update
RUN apt-get install nginx -y


CMD ["nginx", "-g", "daemon off;"]