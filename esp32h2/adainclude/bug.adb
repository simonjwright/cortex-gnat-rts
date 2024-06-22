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
      Data_In_Flash : constant Storage_Array (1 .. Data_Size)
        with Import, Convention => Asm, External_Name => "_sidata";

      Data_In_Sram : Storage_Array (1 .. Data_Size)
        with Volatile, Import, Convention => Asm, External_Name => "_sdata";

   begin
      Data_In_Sram (1) := Data_In_Flash (1);

      --  This is more like the real code, and fails similarly.
      --  for J in Data_In_Flash'Range loop
      --     Data_In_Sram (J) := Data_In_Flash (J);
      --  end loop;
   end Program_Initialization;

end Bug;
