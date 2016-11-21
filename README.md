# Deep Learning for Speech Recognition

**The model is using Connectionist Temporal Classification implementation from Baidu Search.**

**install-deepspeech-torch.sh** is a step by step walkthrough to install the required componants for training the deepspeech.torch model from Sean Naren (https://github.com/SeanNaren/deepspeech.torch)

**A first run** on an AWS EC2 g2.8xlarge (2 CNNs, 7 RNNs with 1760 units) has been performed on a 50 minutes clean dataset with the folowwing error rates:
- Average WER = 3
- Average CER = 1.10

**TODO:** train the model on LibriSpeech dataset (100 hours, 500 hours, 1000h of speech)
