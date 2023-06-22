from __future__ import print_function
import argparse
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from torchvision import datasets, transforms

from tqdm import tqdm
from tensorboardX import SummaryWriter

class Net(nn.Module):
    ...

def train(args, model, device, train_loader, optimizer, writer, epoch):
    ...

def test(args, model, device, test_loader, writer, epoch):
    ...

def main():
    ...
    
if __name__ == "__main__":
    main()