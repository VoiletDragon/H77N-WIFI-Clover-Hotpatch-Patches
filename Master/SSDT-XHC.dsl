//DefinitionBlock ("", "SSDT", 2, "hack", "XHC", 0x00000000)
//{
    If (CondRefOf (_SB.PCI0.XHC))
    {
        Method (_SB.PCI0.XHC._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LNot (Arg2))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Return (Package (0x18)
            {
                "AAPL,slot-name", 
                "Built In", 
                "name", 
                "Intel XHCI Controller", 
                "model", 
                Buffer (0x37)
                {
                    "Intel 7 Series Chipset Family USB xHCI Host Controller"
                }, 

                "device_type", 
                Buffer (0x0F)
                {
                    "USB Controller"
                }, 

                "AAPL,current-available", 
                Buffer (0x04)
                {
                     0x34, 0x08, 0x00, 0x00                         
                }, 

                "AAPL,current-extra", 
                Buffer (0x04)
                {
                     0x99, 0x08, 0x00, 0x00                         
                }, 

                "AAPL,current-in-sleep", 
                Buffer (0x04)
                {
                     0x40, 0x06, 0x00, 0x00                         
                }, 

                "AAPL,current-extra-in-sleep", 
                Buffer (0x04)
                {
                     0x40, 0x06, 0x00, 0x00                         
                }, 

                "AAPL,max-port-current-in-sleep", 
                Buffer (0x04)
                {
                     0x34, 0x08, 0x00, 0x00                         
                }, 

                "AAPL,device-internal", 
                Buffer (0x04)
                {
                     0x02, 0x00, 0x00, 0x00                         
                }, 

                "subsystem-id", 
                Buffer (0x04)
                {
                     0x70, 0x72, 0x00, 0x00                         
                }, 

                "subsystem-vendor-id", 
                Buffer (0x04)
                {
                     0x86, 0x80, 0x00, 0x00                         
                }
            })
        }
    }
//}

