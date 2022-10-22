with MMA8653;
with MicroBit.I2C;
with LEDs;
with Ada.Real_Time;

procedure Accelerometer is
   Acc : MMA8653.MMA8653_Accelerometer (MicroBit.I2C.Controller);
begin
   if not MicroBit.I2C.Initialized then
      MicroBit.I2C.Initialize;
   end if;
   if not Acc.Check_Device_Id then
      raise Program_Error with "didn't find correct device";
   end if;
   Acc.Configure (MMA8653.Two_G,
                  MMA8653.High_Resolution,
                  MMA8653.High_Resolution);

   loop
      declare
         Data : constant MMA8653.All_Axes_Data := Acc.Read_Data;
         use type MMA8653.Axis_Data;
         use type Ada.Real_Time.Time;
      begin
         LEDs.Clear_All_LEDs;
         if Data.X > 150 then
            LEDs.Set_One_LED (3, 1);
         elsif Data.X < -150 then
            LEDs.Set_One_LED (3, 5);
         elsif Data.Y > 150 then
            LEDs.Set_One_LED (1, 3);
         elsif Data.Y < -150 then
            LEDs.Set_One_LED (5, 3);
         else
            LEDs.Set_One_LED (3, 3);
         end if;
         delay until Ada.Real_Time.Clock + Ada.Real_Time.Milliseconds (100);
      end;
   end loop;
end Accelerometer;
