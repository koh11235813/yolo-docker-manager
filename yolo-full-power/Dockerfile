# yolo-full-power/Dockerfile

# NVIDIA公式のJetson用PyTorchイメージ (L4T R36.2 / JetPack 6.0対応) を使用
# PyTorch v2.1, Python 3.10
FROM nvcr.io/nvidia/l4t-pytorch:r36.2.0-pth2.1-py3

# 作業ディレクトリを設定
WORKDIR /app

# 必要なライブラリやTD-yoloのリポジトリをクローン
# (ultralytics/yolov8はarm64アーキテクチャに対応しています)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/ultralytics/ultralytics.git .
RUN pip install -e .

# コンテナ起動時に実行するコマンド (例)
# このコマンドはコンテナ内でGPU(CUDA)を使用して実行されます
CMD [ "python", "-c", "from ultralytics import YOLO; YOLO('yolov8n.pt').predict(source='0', show=True)" ]
