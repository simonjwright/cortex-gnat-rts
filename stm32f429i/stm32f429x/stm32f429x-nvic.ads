pragma Ada_2012;
pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32F429x.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package STM32F429x.NVIC is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ICTR_INTLINESNUM_Field is STM32F429x.UInt4;

   --  Interrupt Controller Type Register
   type ICTR_Register is record
      --  Read-only. Total number of interrupt lines in groups
      INTLINESNUM   : ICTR_INTLINESNUM_Field;
      --  unspecified
      Reserved_4_31 : STM32F429x.UInt28;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for ICTR_Register use record
      INTLINESNUM   at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  IPR_IPR_N array element
   subtype IPR_IPR_N_Element is STM32F429x.Byte;

   --  IPR_IPR_N array
   type IPR_IPR_N_Field_Array is array (0 .. 3) of IPR_IPR_N_Element
     with Component_Size => 8, Size => 32;

   --  Interrupt Priority Register
   type IPR_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  IPR_N as a value
            Val : STM32F429x.UInt32;
         when True =>
            --  IPR_N as an array
            Arr : IPR_IPR_N_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IPR_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   subtype STIR_INTID_Field is STM32F429x.UInt9;

   --  Software Triggered Interrupt Register
   type STIR_Register is record
      --  Write-only. interrupt to be triggered
      INTID         : STIR_INTID_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : STM32F429x.UInt23 := 16#0#;
   end record
     with Object_Size => 32, Bit_Order => System.Low_Order_First;

   for STIR_Register use record
      INTID         at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Nested Vectored Interrupt Controller
   type NVIC_Peripheral is record
      --  Interrupt Controller Type Register
      ICTR  : aliased ICTR_Register;
      pragma Volatile_Full_Access (ICTR);
      --  Interrupt Set-Enable Register
      ISER0 : aliased STM32F429x.UInt32;
      --  Interrupt Set-Enable Register
      ISER1 : aliased STM32F429x.UInt32;
      --  Interrupt Set-Enable Register
      ISER2 : aliased STM32F429x.UInt32;
      --  Interrupt Clear-Enable Register
      ICER0 : aliased STM32F429x.UInt32;
      --  Interrupt Clear-Enable Register
      ICER1 : aliased STM32F429x.UInt32;
      --  Interrupt Clear-Enable Register
      ICER2 : aliased STM32F429x.UInt32;
      --  Interrupt Set-Pending Register
      ISPR0 : aliased STM32F429x.UInt32;
      --  Interrupt Set-Pending Register
      ISPR1 : aliased STM32F429x.UInt32;
      --  Interrupt Set-Pending Register
      ISPR2 : aliased STM32F429x.UInt32;
      --  Interrupt Clear-Pending Register
      ICPR0 : aliased STM32F429x.UInt32;
      --  Interrupt Clear-Pending Register
      ICPR1 : aliased STM32F429x.UInt32;
      --  Interrupt Clear-Pending Register
      ICPR2 : aliased STM32F429x.UInt32;
      --  Interrupt Active Bit Register
      IABR0 : aliased STM32F429x.UInt32;
      --  Interrupt Active Bit Register
      IABR1 : aliased STM32F429x.UInt32;
      --  Interrupt Active Bit Register
      IABR2 : aliased STM32F429x.UInt32;
      --  Interrupt Priority Register
      IPR0  : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR0);
      --  Interrupt Priority Register
      IPR1  : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR1);
      --  Interrupt Priority Register
      IPR2  : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR2);
      --  Interrupt Priority Register
      IPR3  : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR3);
      --  Interrupt Priority Register
      IPR4  : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR4);
      --  Interrupt Priority Register
      IPR5  : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR5);
      --  Interrupt Priority Register
      IPR6  : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR6);
      --  Interrupt Priority Register
      IPR7  : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR7);
      --  Interrupt Priority Register
      IPR8  : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR8);
      --  Interrupt Priority Register
      IPR9  : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR9);
      --  Interrupt Priority Register
      IPR10 : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR10);
      --  Interrupt Priority Register
      IPR11 : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR11);
      --  Interrupt Priority Register
      IPR12 : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR12);
      --  Interrupt Priority Register
      IPR13 : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR13);
      --  Interrupt Priority Register
      IPR14 : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR14);
      --  Interrupt Priority Register
      IPR15 : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR15);
      --  Interrupt Priority Register
      IPR16 : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR16);
      --  Interrupt Priority Register
      IPR17 : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR17);
      --  Interrupt Priority Register
      IPR18 : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR18);
      --  Interrupt Priority Register
      IPR19 : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR19);
      --  Interrupt Priority Register
      IPR20 : aliased IPR_Register;
      pragma Volatile_Full_Access (IPR20);
      --  Software Triggered Interrupt Register
      STIR  : aliased STIR_Register;
      pragma Volatile_Full_Access (STIR);
   end record
     with Volatile;

   for NVIC_Peripheral use record
      ICTR  at 16#4# range 0 .. 31;
      ISER0 at 16#100# range 0 .. 31;
      ISER1 at 16#104# range 0 .. 31;
      ISER2 at 16#108# range 0 .. 31;
      ICER0 at 16#180# range 0 .. 31;
      ICER1 at 16#184# range 0 .. 31;
      ICER2 at 16#188# range 0 .. 31;
      ISPR0 at 16#200# range 0 .. 31;
      ISPR1 at 16#204# range 0 .. 31;
      ISPR2 at 16#208# range 0 .. 31;
      ICPR0 at 16#280# range 0 .. 31;
      ICPR1 at 16#284# range 0 .. 31;
      ICPR2 at 16#288# range 0 .. 31;
      IABR0 at 16#300# range 0 .. 31;
      IABR1 at 16#304# range 0 .. 31;
      IABR2 at 16#308# range 0 .. 31;
      IPR0  at 16#400# range 0 .. 31;
      IPR1  at 16#404# range 0 .. 31;
      IPR2  at 16#408# range 0 .. 31;
      IPR3  at 16#40C# range 0 .. 31;
      IPR4  at 16#410# range 0 .. 31;
      IPR5  at 16#414# range 0 .. 31;
      IPR6  at 16#418# range 0 .. 31;
      IPR7  at 16#41C# range 0 .. 31;
      IPR8  at 16#420# range 0 .. 31;
      IPR9  at 16#424# range 0 .. 31;
      IPR10 at 16#428# range 0 .. 31;
      IPR11 at 16#42C# range 0 .. 31;
      IPR12 at 16#430# range 0 .. 31;
      IPR13 at 16#434# range 0 .. 31;
      IPR14 at 16#438# range 0 .. 31;
      IPR15 at 16#43C# range 0 .. 31;
      IPR16 at 16#440# range 0 .. 31;
      IPR17 at 16#444# range 0 .. 31;
      IPR18 at 16#448# range 0 .. 31;
      IPR19 at 16#44C# range 0 .. 31;
      IPR20 at 16#450# range 0 .. 31;
      STIR  at 16#F00# range 0 .. 31;
   end record;

   --  Nested Vectored Interrupt Controller
   NVIC_Periph : aliased NVIC_Peripheral
     with Import, Address => NVIC_Base;

end STM32F429x.NVIC;
