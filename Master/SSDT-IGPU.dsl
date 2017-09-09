//DefinitionBlock ("", "SSDT", 2, "hack", "igpu", 0x00000000)
//{
    External (_SB_.PCI0.IGPU, DeviceObj)    // (from opcode)

    Scope (_SB.PCI0.IGPU)
    {
        OperationRegion (IGD4, PCI_Config, Zero, 0x14)
        Field (IGD4, AnyAcc, NoLock, Preserve)
        {
            Offset (0x02), 
            GDID,   16, 
            Offset (0x10), 
            BAR1,   32
        }

        Name (GIDL, Package (0x03)
        {
            0x0162, 
            Zero, 
            Package (0x06)
            {
                "AAPL,ig-platform-id", 
                Buffer (0x04)
                {
                     0x0A, 0x00, 0x66, 0x01                         
                }, 

                "model", 
                Buffer (0x17)
                {
                    "Intel HD Graphics 4000"
                }, 

                "hda-gfx", 
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            }
        })
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LNot (Arg2))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Store (Match (GIDL, MEQ, GDID, MTR, Zero, Zero), Local0)
            If (LNotEqual (Ones, Local0))
            {
                Store (Match (GIDL, MEQ, Zero, MTR, Zero, Add (Local0, One)), Local0)
                Return (DerefOf (Index (GIDL, Add (Local0, One))))
            }

            Return (Package (0x00) {})
        }
    }
//}

