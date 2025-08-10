构建镜像：
docker build -t 镜像名称 构建镜像的dockerfile目录
例子：docker build -t d1 .

运行容器：build
docker run 镜像名称

运行镜像并进入容器：
docker run -it 镜像名称 bash
docker run -it 镜像名称 /bin/sh

进入已运行的容器：
docker exec -it 容器名称/容器ID 

停止运行的容器：
docker stop 容器名称/容器ID

删除已停止运行的容器：
docker rm 容器名称/容器ID

删除镜像：
docker rmi 镜像名称
例子：docker rmi d1


卷：volume
创建卷：docker volume create 卷名
查看已有卷：docker volume ls
删除卷（删除之前必须清除所有挂载此卷的容器）：docker volume rm 卷名
挂载卷：
docker run -d -p 宿主机端口:容器端口 -v 宿主机路径:容器路径 镜像名称
例子：docker run -d -p 5001:5000 -v ./docs_volume:/app/docs d1


