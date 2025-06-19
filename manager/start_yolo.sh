#!/bin/sh

# ホストからマウントされた電源状態のファイルパス
# ノートPCによってACアダプタのデバイス名が異なる場合があるため、
# `ls /sys/class/power_supply/` で確認して `AC` や `ADP1` など適切なものに変更してください。
POWER_SUPPLY_FILE="/sys/class/power_supply/AC/online"

# 実行中のYOLOコンテナがあれば停止する
echo "Stopping existing YOLO containers..."
docker-compose stop yolo-full-power yolo-power-save > /dev/null 2>&1

echo "Checking power status..."

# 電源状態ファイルが存在し、内容が '1' (AC電源接続) かどうかをチェック
if [ -f "$POWER_SUPPLY_FILE" ] && [ "$(cat $POWER_SUPPLY_FILE)" = "1" ]; then
  echo "AC power detected. Starting FULL POWER container..."
  # フルパワー用のコンテナを起動
  docker-compose up -d --no-deps yolo-full-power
else
  echo "On battery. Starting POWER SAVE container..."
  # 省電力用のコンテナを起動
  docker-compose up -d --no-deps yolo-power-save
fi

echo "Script finished."
