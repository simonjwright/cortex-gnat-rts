This package includes GNAT Ada Run Time Systems (RTSs) based on [FreeRTOS](http://www.freertos.org) and targeted at boards with Cortex-M0, -M3, -M4, -M4F MCUs (respectively [BBC micro:bit](http://microbit.org), [Arduino Due](https://www.arduino.cc), and the STM32F4-series evaluation boards from [STMicroelectronics](https://www.st.com)). For discussions, visit the dedicated [Google Group](https://groups.google.com/forum/#!forum/cortex-gnat-rts).

The RTSs are all Ravenscar-based, with additional restrictions `No_Exception_Propagation` and `No_Finalization`. `No_Exception_Propagation` means that exceptions can't be caught except in their immediate scope; instead, a `Last_Chance_Handler` is called.

In each case, the board support for the RTS (configuration for size and location of Flash, RAM; clock initialization; interrupt naming) is in `$RTS/adainclude`. Support for the on-chip peripherals is also included, in Ada spec files generated by [SVD2Ada](https://github.com/AdaCore/svd2ada).

The Ada source is either original or based on FSF GCC (mainly 4.9.1, some later releases too).

The boards supported are

* `microbit` for the BBC micro:bit.
  * See `microbit/COPYING*` for licensing terms.
  * On-chip peripheral support in `nrf51/`.
  * Tests in `test-microbit/`.

* `arduino-due` for the Arduino Due.
  * See `arduino-due/COPYING*` for licensing terms.
  * On-chip peripheral support in `atsam3x8e/`.
  * Tests in `test-arduino-due/`.

* `stm32f4` for the STM32F4-DISC* board (and also the Crazyflie).
  * See `stm32f4/COPYING*` for licensing terms.
  * On-chip peripheral support in `stm32f40x/`.
  * Tests in `test-stm32f4/`.

* `stm32f429i` for the STM32F429I-DISC* board.
  * See `stm32f429i/COPYING*` for licensing terms.
  * On-chip peripheral support in `stm32f429x/`.
  * Tests in `test-stm32f429i/`.

The standard packages included (there are more, implementation-specific, ones) for all RTSs are:

    Ada
    Ada.Characters
    Ada.Characters.Latin_1
    Ada.Containers
    Ada.Containers.Bounded_Hashed_Maps
    Ada.Containers.Bounded_Vectors
    Ada.Exceptions
    Ada.IO_Exceptions
    Ada.Interrupts
    Ada.Interrupts.Names
    Ada.Iterator_Interfaces
    Ada.Numerics.* (except random numbers)
    Ada.Real_Time
    Ada.Real_Time.Timing_Events
    Ada.Streams
    Ada.Strings
    Ada.Strings.Bounded
    Ada.Strings.Maps
    Ada.Synchronous_Task_Control
    Ada.Tags
    Ada.Task_Identification
    Interfaces
    Interfaces.C
    Interfaces.C.Extensions
    Interfaces.C.Strings
    System
    System.Assertions
    System.Address_To_Access_Conversions
    System.Machine_Code
    System.Storage_Elements
    GNAT
    GNAT.CRC32
    GNAT.Source_Info

For installation, see the [instructions](INSTALL.md).
