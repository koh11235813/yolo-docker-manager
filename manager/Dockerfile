# manager/Dockerfile

# 軽量なAlpine Linuxをベースイメージとして使用
FROM alpine:latest

# docker-cliとdocker-composeをインストール
RUN apk add --no-cache docker-cli-compose

# スクリプトをコンテナにコピー
COPY start_yolo.sh /usr/local/bin/start_yolo.sh

# スクリプトを実行可能にする
RUN chmod +x /usr/local/bin/start_yolo.sh

# コンテナ起動時にスクリプトを実行
CMD ["start_yolo.sh"]
