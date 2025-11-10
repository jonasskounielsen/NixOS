{ pkgs, ... }:
/* kdl */ ''
output "Sharp Corporation 0x149A Unknown" {
    mode "1920x1080@59.999"

    focus-at-startup

    position x=0 y=0

    /-layout {
        
    }
}

output "Acer Technologies VG240Y S 0x11013D54Acer Technologies VG240Y S 0x11013D54" {
    mode "1920x1080@143.855"

    //position x=0 y=0
}

output "Samsung Electric Company S27E650 H4ZH901842" {
    mode "1920x1080@60.000"
    
    //position x=0 y=1080
}

output "PNP(OEM) 22W_LCD_TV Unknown" {
    mode "1920x1080@59.939"

    scale 1.0

    //position x=0 y=2160
}
''
