wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh -O anaconda.sh

bash anaconda.sh -b -p $HOME/opt/anaconda3

#$HOME/opt/anaconda3/bin/pip install -Ur requirements.txt
$HOME/opt/anaconda3/bin/pip install -Ur pudb black bpython jupyter
#ln -s flake8 $HOME/.config/flake8

rm anaconda.sh
