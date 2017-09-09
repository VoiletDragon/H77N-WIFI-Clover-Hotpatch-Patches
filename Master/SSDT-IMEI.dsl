//DefinitionBlock ("", "SSDT", 2, "hack", "IMEI", 0x00000000)
//{
    External (_SB_.PCI0.IGPU.GDID, FieldUnitObj)    // (from opcode)

    Device (_SB.PCI0.IMEI)
    {
        Name (_ADR, 0x00160000)  // _ADR: Address
    }

    Scope (_SB.PCI0.IMEI)
    {
        OperationRegion (RMP1, PCI_Config, 0x02, 0x02)
        Field (RMP1, AnyAcc, NoLock, Preserve)
        {
            MDID,   16
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LNot (Arg2))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Store (^^IGPU.GDID, Local1)
            Store (MDID, Local2)
            If (LAnd (LEqual (0x1C3A, Local2), LEqual (0x0166, Local1)))
            {
                Return (Package (0x02)
                {
                    "device-id", 
                    Buffer (0x04)
                    {
                         0x3A, 0x1E, 0x00, 0x00                         
                    }
                })
            }

            Return (Package (0x00) {})
        }
    }
//}

