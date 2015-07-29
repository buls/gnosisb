#!/bin/sh
#===========================Python configuration=================================
echo ""
echo "===========================Python configuration============================"
case "$(python --version 2>&1)" in
    *" 2."*)
        #echo "Fine"
        cont='Fine'
        ;;
    *)
        #echo "Wrong Python version" 
        cont='Wrong Python version'
        ;;
esac
python --version
if [ "$cont" = "Wrong Python version" ] 
then
    echo "Need to install new version"
else
    echo "Do the necessary things here"
fi
#========================Git configuration======================================
echo ""
echo "========================Git configuration=================================="
case "$(git --version 2>&1)" in 
    *" 0."*)
        git --version
        echo "Upgdate this version..."
        ;;
    *" 1."*)
        git --version
        echo "Upgdate this version..."
        ;;
    *" 2."*)
        echo "Good version..."
        ;;
    *" 3."*)
        echo "Good version..."
        ;;
    *)
        echo "git is not installed"
        ;;
esac

#==========================M2crypto configuration================================
echo ""
echo "========================M2crypto configuration============================="
echo "copying files ...."
echo "Enter bluefox password..."
scp bluefox@172.16.3.203:/home/bluefox/kalite-repo/M2Crypto-0.22.3.tar.gz /home/houzibe/kalite-local-repo
scp bluefox@172.16.3.203:/home/bluefox/kalite-repo/gcc-5.2.0.tar.gz /home/houzibe/kalite-local-repo
cd /home/houzibe/kalite-local-repo/
tar zxvf gcc-5.2.0.tar.gz
echo "installing c compiler..."
#tar xzvf /home/M2crypto/M2Crypto-0.22.3.tar.gz
#cd /home/M2crypto/M2Crypto-0.22.3/
#sudo python setup.py install
#===========================KA Lite configuration================================
#echo ""
#echo "========================KA Lite configuration============================="
#scp bluefox@172.16.3.203:/home/kalite-repo/ka-lite-master.zip /home/M2crypto/
#cd /home/M2crypto/
#unzip /home/M2crypto/ka-lite-master.zipgzip: stdin: unexpected end of file
