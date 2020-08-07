
#!/bin/bash

#sleep 30;
ntpdate -b -s -u pool.ntp.org
hwclock -w
hwclock -w -f /dev/rtc1
