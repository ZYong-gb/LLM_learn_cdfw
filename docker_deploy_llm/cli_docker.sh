#构建镜像
# docker build -t d_vllm .

# 启动容器
# docker run --name d_vllm_container3 --gpus all -d -p 5001:5000 -v ./docs_volume:/app/docs d_vllm

# 删除容器
# docker rm 462d7eb14896
# docker rm b090aa68c62e
# docker rm 22ad933fa196
# docker rm 568e1111d89f

# 删除镜像
# docker rmi qwen3-32b-server
# docker rmi d_vllm
# docker rmi qwen3-32b-server-zy
# docker rmi 4b51b8337fd0
# docker rmi e24bb2956f45