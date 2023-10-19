# Lock the root user
sudo passwd -l root

# Install and setup UFW
sudo dnf install -y ufw
sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Install and setup Fail2Ban
sudo dnf install -y fail2ban
sudo cp ./assets/fail2ban/jail.local /etc/fail2ban/jail.local
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Install and setup ClamAV
sudo dnf install -y clamav clamav-freshclam clamd
sudo freshclam -d # run daemon

# Enable automatic updates
sudo dnf install -y dnf-automatic
sudo systemctl enable dnf-automatic.timer
sudo systemctl start dnf-automatic.timer

# Disable bluetooth & cups
sudo systemctl stop bluetooth
sudo systemctl stop cups
sudo systemctl disable bluetooth
sudo systemctl disable cups

# Install and setup usbguard
sudo dnf install -y usbguard
sudo usbguard generate-policy > rules.conf
sudo systemctl restart usbguard

# Install lynis (system auditing tool)
sudo dnf install -y lynis
sudo lynis audit system
