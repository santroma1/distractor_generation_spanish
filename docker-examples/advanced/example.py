import torch
import time
from tqdm import tqdm


print("Is Cuda Available: ", torch.cuda.is_available())
print("Num GPUs Avalailable: ", torch.cuda.device_count())


x = torch.rand(16, 30)
y = torch.rand(16, 30)

print("x: ", x.shape)
print("y: ", y.shape)
print("y+x ", (y + x).shape)

print("Loop")
for i in tqdm(range(10), desc="An Amazing Loop"):
    time.sleep(0.4)

print("Done!")