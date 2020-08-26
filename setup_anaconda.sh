wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh -O anaconda.sh

bash anaconda.sh -b -p $HOME/anaconda3
$HOME/anaconda3/bin/pip install -Ur requirements.txt

rm anaconda.sh
