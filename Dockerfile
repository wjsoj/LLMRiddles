# 使用官方 Python 3.12 镜像
FROM python:3.12

# 设置工作目录
WORKDIR /app

# 复制
COPY app.py .
COPY requirements.txt .
COPY llmriddles/ ./llmriddles/

# 安装依赖
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# 设置环境变量
ENV QUESTION_LANG=cn
ENV QUESTION_LLM='chatglm'

# 暴露端口
EXPOSE 7860

# 运行应用
CMD ["python", "-u", "app.py"]

