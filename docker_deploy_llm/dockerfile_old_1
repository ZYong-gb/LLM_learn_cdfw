# 使用包含 CUDA 开发工具的基础镜像
FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

# 设置环境变量防止交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 安装 Python 3.11 和相关工具
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.11 \
    python3.11-dev \
    python3.11-venv \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 创建 Python 虚拟环境
ENV VIRTUAL_ENV=/opt/venv
RUN python3.11 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# 优先安装兼容的 NumPy 版本
RUN pip install --no-cache-dir numpy==1.26.4

# 安装 PyTorch (CUDA 12.2 兼容版本)
RUN pip install --no-cache-dir torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 \
    --index-url https://download.pytorch.org/whl/cu121

# 设置工作目录并复制依赖文件
WORKDIR /app
COPY requirements.txt /app/

# 安装依赖项（使用清华镜像加速）
RUN pip install --no-cache-dir -r requirements.txt \
    -i https://pypi.tuna.tsinghua.edu.cn/simple

# 设置模型路径并创建目录
ENV MODEL_PATH=/app/model
RUN mkdir -p ${MODEL_PATH}

# 复制应用程序文件
COPY . /app/

# 清理构建工具（减小镜像大小）
RUN apt-get remove -y build-essential python3.11-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# 设置非 root 用户以增强安全性
RUN groupadd -r appuser && useradd -r -g appuser appuser \
    && chown -R appuser:appuser /app \
    && chown -R appuser:appuser /opt/venv
USER appuser

# 设置启动脚本权限
RUN chmod +x vllm_serve_qwen3_32b.sh

# 容器启动命令
CMD ["./vllm_serve_qwen3_32b.sh"]