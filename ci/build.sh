docker build \
  --progress plain \
  --tag jehoshua02/longvinter-linux-server:$(git rev-parse HEAD) \
  --tag jehoshua02/longvinter-linux-server:latest \
  .
