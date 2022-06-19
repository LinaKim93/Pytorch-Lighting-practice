# Pytorch-Lighting

## Docker start

1. docker build -t \<Image Name> .
2. docker run -d -it --gpus all -v \<local path>:\<docker path> -w \<docker path> --name \<container name> \<image name> /bin/bash
3. docker exec -it -d \<container name> /bin/bash
4. python lightning.py

## Result
```
$ python lightning.py
```

|Test metric|DataLoader 0|
|---|---|
|test_acc|0.9366999864578247|
|test_loss|0.20906415581703186|