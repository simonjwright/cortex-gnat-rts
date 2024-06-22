with Interfaces.C;
with System.Storage_Elements;

package body Bug is

   procedure Program_Initialization
   with
     Export,
     Convention => Ada,
     External_Name => "program_initialization";

   procedure Program_Initialization is
      use System.Storage_Elements;

      Sdata : Storage_Element
        with Import, Convention => Asm, External_Name => "_sdata";
      Edata : Storage_Element
        with Import, Convention => Asm, External_Name => "_edata";

      Data_Size : constant Storage_Offset := Edata'Address - Sdata'Address;

      --  Index from 1 so as to avoid subtracting 1 from the size
      subtype Data_Storage_Array is Storage_Array (1 .. Data_Size);

      Data_In_Flash : constant Data_Storage_Array
        with Import, Convention => Asm, External_Name => "_sidata";

      Data_In_Sram : Data_Storage_Array
        with Import, Convention => Asm, External_Name => "_sdata";

      procedure Memcpy (Dst : Data_Storage_Array;
                        Src : Data_Storage_Array;
                        N : Interfaces.C.size_t)
      with Import,
        Convention => C,
        External_Name => "_memcpy";
   begin
      Memcpy (Dst => Data_In_Sram,
              Src => Data_In_Flash,
              N   => Data_Storage_Array'Length);
      --  This is more like the real code, and fails similarly.
      --  for J in Data_In_Flash'Range loop
      --     Data_In_Sram (J) := Data_In_Flash (J);
      --  end loop;
   end Program_Initialization;

end Bug;
