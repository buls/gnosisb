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
#echo ""
#echo "========================M2crypto configuration============================="
#echo "copying files ...."
#echo "Enter bluefox password..."
#scp bluefox@172.16.3.203:/home/bluefox/kalite-repo/M2Crypto-0.22.3.tar.gz /home/houzibe/kalite-local-repo
#scp bluefox@172.16.3.203:/home/bluefox/kalite-repo/gcc-5.2.0.tar.gz /home/houzibe/kalite-local-repo
#echo "installing c compiler..."
#cd /home/houzibe/kalite-local-repo/gcc-5.2.0
#mkdir gcc-build                                   &&
#cd    gcc-build                                   &&

#../configure                                        \
#   --prefix=/usr                                    \
#    --disable-multilib                               \
#   --with-system-zlib                               \
#    --enable-languages=c,c++                         &&
#make
#ulimit -s 32768 &&
#make -k check


#make install &&
#/home/houzibe/kalite-local-repo/gcc-5.2.0
#mkdir -pv /usr/share/gdb/auto-load/usr/lib              &&
#mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib &&

#chown -v -R root:root \
# /usr/lib/gcc/*linux-gnu/5.2.0/include{,-fixed}
 
#tar zxvf gcc-5.2.0.tar.gz
#tar xzvf /home/M2crypto/M2Crypto-0.22.3.tar.gz
#cd /home/M2crypto/M2Crypto-0.22.3/
#sudo python setup.py install
#===========================KA Lite configuration================================
#echo ""
#echo "========================KA Lite configuration============================="
#scp bluefox@172.16.3.203:/home/kalite-repo/ka-lite-master.zip /home/M2crypto/
#cd /home/M2crypto/
#unzip /home/M2crypto/ka-lite-master.zipgzip: stdin: unexpected end of file
echo "========================kalite configuration============================="
echo "Enter Server Username:"
read username
echo "Enter Server Hostname or IP Address:"
read hostname
echo "copying files from server........"
scp $username@$hostname:/home/$username/kalite-repo/ka-lite-master.zip ka-lite-config-pi-master.zip .
unzip ka-lite-master.zip
unzip ka-lite-config-pi-master.zip
cd ka-lite-master
echo "running KA Lite installation........."
./setup_unix.sh
ka-lite-master/bin/kalite start
cd ka-lite-config-pi-master
#installing and configuring the access point
echo "installing and configuring the access point..."
./configure.sh
echo "installing the USB adaptor software..."
./use_wipi.sh
echo "Completing the access point configuration..."
python ./configure_network_interfaces.py
insserv hostapd
echo "Your system will shortly reboot."
echo "A Wireless network named Kalite should be available and connect to it."
echo "If KA Lite server is started, browse to 1.1.1.1"
echo ""
echo "system rebooting..."
echo "Enter your password..."
sudo reboot