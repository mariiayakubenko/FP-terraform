variable "region" {
  default = ""
}

variable "project" {
  default = ""
}


variable "latest_ami_id" {
  default = ""
}

variable "ireland_control_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDlDK2kAmDEl8ELqsL0+o3trMK0nFGGGyPPSAR+Ay4zV32AWHwaR+hZ7qEALihOa+sg+907Ww898oxVNoHxnG8eaz7uXxg+elthM5Vy2eciw6E/eNDK8NDWNQiZOOyMOlxu1z+ZrUuUTxxskyR1zu4mQITakYEVB3qcX7Fr6Jo6DsMdhGoMno12WU7cXgEPd3h8+1ueKR1c4U8XLnFw2O7ar45WO1LaVZaM/nRAIMb1xQ7Wv3EDzLsrcreZbmnH1/vkwoAppifKjvg1l9GfVSLtngRtBNM3UalWBDbAwL0JmMM9Bbp/31G/sMuhazh7qsMKLmgiZkb8zZIViJKyE3GoCkF6E1j1qdpy3dJTghc2x1GSVKfleu0SRV4g60HziD3MHS7Xvr/kmp6i6PBAnt2lZGcG6nPRf30IW83vkR8sI2btB/E9LcSlC/R645lSZWFm4iz+La3k8tFuvxuIJsG0Ddb/narkC1pY1poq0z526yv6G8j9iV0GZidTBKjjdVRBPSlT4jKrsupJmgC6l3r6Tg30D9B8Ch143iGPbBHvbmq/blxY5b8wWnfTfy+wA0bjkU9t9pZJoMKboMsjJrxh4m9LIibiRuwcwRNeTtMOlN5peb77M3wfGp+AtFMb9++9KHb13/75f7e9z1RRL5cm+V/AzgZWPmUv1axmhjBAkw== Mariia_Yakubenko@gmail.com"
}

variable "ireland_managed_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUL3/k0Z+naoO2427QyQNCBjdZLqhlMVOniaaqZyIJRWUhyplnU9ohEU/nYEeaObsKgWtnCReO0IG+SeqRFY1iQj1tMOMgum4w1kw2lPyF+S+roQWySNKoYyXVGv+4fyI0ggAMwBEHi3Ebkvu+9rx318DhUoRSpsFyu4YACwUPXFXDlp9iUusddPiHLB3S1rveTDYXrUmRFguIPkgQDmMKJMFqteBP4Az+1mrH59/jRiIEw7o7L5OVcVcOxqcFkp1dCVHjsOr1Flb1fqAc1hEDEJqYD3D/B3PXiMo6YQl/9Mc7aYSunIXbaIDucUq4pTdJ50pTLsE7jehUkc2TlPwamS+hMuURoBngQJmqqH+ydgdsSBaY6FB1ypVWF/rC5dvHlCZki22MwfZ7zdahlUR5t9zlmxViu6uHCaSSxIee5O2KeX2YMIC0O6vY5HcBhFJ00UGYJO/+EbZEyP3fFFULFbRx5KozfOo/yWQtJm+8qlosONRTxdw0xg/csM7N382KxDEUMh7mdp833aTQgJpygZTKTCgIZOWHjabD2vNDl2N2Paa5csXh8eBz/IyU7fcSTpz0haXNzz7iquUFOXgxK98BcBEK0NXt2DKmU47IsWrJOW2sIUHIQgttFDZgxmucKjJIcTZPKwEtpjvP2II4VnMF0bt4UPUwkwy3N+dbiQ== Mariia_Yakubenko@gmail.com"
}

variable "public_subnet_id" {
  default = ""
}

variable "security_group_id" {
  type    = string
  default = ""
}

//not in use
#variable "account_id" {
#  default = ""
#}
