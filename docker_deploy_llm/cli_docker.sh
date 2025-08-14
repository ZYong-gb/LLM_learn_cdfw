#构建镜像
# docker build -t d_vllm .

# 启动容器
# docker run --name d_vllm_container3 --gpus all -d -p 5001:5000 -v ./docs_volume:/app/docs d_vllm

# 停止容器
# docker stop c9cd47a218f6


# 删除容器
# docker rm c9cd47a218f6
# docker rm b099814ad5d0
# docker rm ef7435d781b5
# docker rm a7d22767da8f
# docker rm 32971463d804

# 删除镜像
# docker rmi qwen3-32b-server
# docker rmi d_vllm
# docker rmi qwen3-32b-server-zy
# docker rmi 4b51b8337fd0
# docker rmi e24bb2956f45

# 创建 Dockerfile 和 vllm_serve_qwen3_32b.sh 后执行
docker build -t vllm-server-test .