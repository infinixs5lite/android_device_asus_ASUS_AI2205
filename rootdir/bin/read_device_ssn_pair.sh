#!/vendor/bin/sh

ssn="$1"

deviceid=$(getprop vendor.asus.get.deviceid.num)
ssn=${ssn//\"}


query_ssn() {
  local ssn="$1"



  if [ -n "$deviceid" ]; then
      setprop vendor.asus.start.key.reinstall 1
      echo "[rkp_reinstall]DeviceID already exist"> /proc/asusevtlog
      echo "[rkp_reinstall]DeviceID stored as 'vendor.asus.get.deviceid.num'." > /proc/asusevtlog
      return 0
  else
    while IFS=' ' read -r key value; do
      
      key=${key//\"}
      value=${value//\"}
      echo "[rkp_reinstall]get SSN:$ssn"   > /proc/asusevtlog

          if [ "$key" = "$ssn" ]; then
            echo "[rkp_reinstall]SSN: $key, DeviceID: $value"   > /proc/asusevtlog
            setprop vendor.asus.get.deviceid.num "$value" 
            echo "[rkp_reinstall]DeviceID stored as 'vendor.asus.get.deviceid.num'." > /proc/asusevtlog
            sleep 2
            setprop vendor.asus.start.key.reinstall 1
            return 0
            
          fi
    
  done < /vendor/bin/test.csv

 fi
  echo "[rkp_reinstall]SSN '$ssn' not found." > /proc/asusevtlog
}


query_ssn "$ssn"
