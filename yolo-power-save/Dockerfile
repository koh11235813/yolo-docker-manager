# yolo-power-save/Dockerfile

FROM python:3.10-slim

WORKDIR /app

# aarch64 (ARM64) 向けのCPU版PyTorchをインストール
# pipがアーキテクチャを自動判別して適切なものをインストールします
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# 必要なライブラリやTD-yoloのリポジトリをクローン
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/ultralytics/ultralytics.git .
RUN pip install -e .

# コンテナ起動時に実行するコマンド (CPUで実行)
CMD [ "python", "-c", "from ultralytics import YOLO; YOLO('yolov8n.pt').predict(source='0', show=True)" ]
