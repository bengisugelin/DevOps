
   # Bounce Service
   echo "##########################################"
   echo "Restarting HTTPD Service"
   echo "##########################################"
   sudo systemctl restart $SVC
   echo

   # Clean up
   echo "##########################################"
   echo "Removing Temporary files"
   echo "##########################################"
   rm -rf $TEMPDIR
   echo

   sudo systemctl status $SVC
   ls /var/www/html/

else
  #Set variables for Ubuntu
   PACKAGE="apache2 wget unzip"
   SVC="apache2"
   echo "Running setup on Ubuntu"

   # Installing Dependencies
   echo "##########################################"
   echo "Installing packages."
   echo "##########################################"
   sudo apt update
   sudo apt install $PACKAGE -y > /dev/null
   echo


   # Start & Enable Service
   echo "##########################################"
   echo "Start & Enable HTTPD Service"
   echo "##########################################"
   sudo systemctl start $SVC
   sudo systemctl enable $SVC
   echo

   # Creating Temp Directory
   echo "##########################################"
   echo "Starting Artifact Deployment"
   echo "##########################################"
   mkdir -p $TEMPDIR
   cd $TEMPDIR
   echo

   wget $URL > /dev/null
   unzip $ART_NAME.zip > /dev/null
   sudo cp -r $ART_NAME/* /var/www/html/

   # Bounce Service
   echo "##########################################"
   echo "Restarting HTTPD Service"
   echo "##########################################"
   sudo systemctl restart $SVC
   echo

   # Clean up
   echo "##########################################"
   echo "Removing Temporary files"
   echo "##########################################"
   rm -rf $TEMPDIR
   echo

   sudo systemctl status $SVC
   ls /var/www/html/
fi
                                      