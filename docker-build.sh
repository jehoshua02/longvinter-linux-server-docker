docker build \
  --progress plain \
  --tag jehoshua02/longvinter-linux-server:9bbb56df7821df3df7ed57cb6855ee4a474e7be1 \
  --tag jehoshua02/longvinter-linux-server:latest \
  .

docker push jehoshua02/longvinter-linux-server:9bbb56df7821df3df7ed57cb6855ee4a474e7be1
docker push jehoshua02/longvinter-linux-server:latest