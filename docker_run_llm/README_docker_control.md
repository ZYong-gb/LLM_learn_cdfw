

# 进入容器
docker exec -it c9cd47a218f6 bash
docker exec -it c9cd47a218f6 /bin/sh


# 查看容器中的build.txt 文件
root@c9cd47a218f6:/vllm-workspace/requirements# cat build.txt 
## Should be mirrored in pyproject.toml
cmake>=3.26
ninja
packaging
setuptools>=61
setuptools-scm>=8
torch==2.6.0
wheel
jinja2>=3.1.6

