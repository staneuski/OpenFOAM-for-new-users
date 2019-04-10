# OpenFOAM-for-new-users
Portable OpenFOAM description for new users and some valuable scripts 

**To install VirtualBox Guest Additions** (if you run Ubuntu there)

```bash
sudo apt install build-essential dkms linux-headers-$(uname -r)
```



**To install ubuntu science package with OpenFOAM 6**

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/toIntstall/ubuntuSciencePackage.sh)"
bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/toIntstall/6Install.sh)"
```

**To install ubuntu science package with OpenFOAM-extend-4.0**
```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/toIntstall/ubuntuSciencePackage.sh)"
bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/toIntstall/ext-4Install.sh)"
```
