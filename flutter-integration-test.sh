#!/bin/bash

flutter emulators --launch $FLUTTER_EMULATOR_NAME

started=0
while [ $started -eq 0 ] 
do 
  sleep 1
  started=$(flutter devices | grep emulator | wc -l)
done


sleep 5
flutter drive --driver=test_driver/integration_test_driver.dart --target=integration_test/app_test.dart  --android-emulator

/bin/bash /usr/local/bin/chown.sh

exit
