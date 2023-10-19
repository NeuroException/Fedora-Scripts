# Check for sudo
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run with sudo privileges!" 
   exit 1
fi 

# Set max parallel downloads to 15
echo "max_parallel_downloads=15" >> /etc/dnf/dnf.conf

# Set fastest mirror to True
echo "fastestmirror=True" >> /etc/dnf/dnf.conf

# Refresh dnf
dnf upgrade --refresh
