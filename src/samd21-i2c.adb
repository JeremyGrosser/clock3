with SAMD21_SVD.SERCOM; use SAMD21_SVD.SERCOM;

package body SAMD21.I2C is
   procedure Enable
      (This : in out I2C_Port)
   is
   begin
      This.Periph.SERCOM_I2CM.CTRLA.SWRST := True;
      while This.Periph.SERCOM_I2CM.SYNCBUSY.SWRST loop
         null;
      end loop;

      This.Periph.SERCOM_I2CM.CTRLA :=
         (MODE    => I2C_MASTER,
          SDAHOLD => 1, -- 75ns
          SPEED   => 0,
          SCLSM   => True,
          others  => <>);
      This.Periph.SERCOM_I2CM.CTRLB :=
         (SMEN   => False,
          QCEN   => False,
          others => <>);
      This.Periph.SERCOM_I2CM.BAUD :=
         (BAUDLOW => 58,
          BAUD    => 24,
          others  => <>);
      while This.Periph.SERCOM_I2CM.SYNCBUSY.SYSOP loop
         null;
      end loop;

      This.Periph.SERCOM_I2CM.CTRLA.ENABLE := True;
      while This.Periph.SERCOM_I2CM.SYNCBUSY.ENABLE loop
         null;
      end loop;

      This.Periph.SERCOM_I2CM.STATUS.BUSSTATE := 1; -- IDLE
      while This.Periph.SERCOM_I2CM.SYNCBUSY.SYSOP loop
         null;
      end loop;
   end Enable;

   function Enabled
      (This : in out I2C_Port)
      return Boolean
   is (This.Periph.SERCOM_I2CM.CTRLA.ENABLE);

   overriding
   procedure Master_Transmit
     (This    : in out I2C_Port;
      Addr    : I2C_Address;
      Data    : I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000)
   is
   begin
      -- Setup
      if This.Periph.SERCOM_I2CM.STATUS.BUSSTATE /= 1 then
         Status := Err_Error;
         return;
      end if;

      -- Send address
      This.Periph.SERCOM_I2CM.ADDR.ADDR := SERCOM_ADDR_SERCOM_I2CM_ADDR_Field (Shift_Left (UInt16 (Addr), 1));
      while This.Periph.SERCOM_I2CM.SYNCBUSY.SYSOP or else
            not This.Periph.SERCOM_I2CM.INTFLAG.MB loop
         null;
      end loop;
      if This.Periph.SERCOM_I2CM.STATUS.RXNACK then
         -- STOP
         This.Periph.SERCOM_I2CM.INTFLAG.MB := True;
         This.Periph.SERCOM_I2CM.CTRLB.CMD := 3;
         This.Periph.SERCOM_I2CM.DATA := 0;
         while This.Periph.SERCOM_I2CM.SYNCBUSY.SYSOP loop
            null;
         end loop;
         Status := Err_Error;
         return;
      end if;

      for I in Data'Range loop
         while not This.Periph.SERCOM_I2CM.INTFLAG.MB loop
            null;
         end loop;
         This.Periph.SERCOM_I2CM.INTFLAG.MB := True;

         This.Periph.SERCOM_I2CM.DATA := Data (I);
         while This.Periph.SERCOM_I2CM.SYNCBUSY.SYSOP loop
            null;
         end loop;
      end loop;

      while not This.Periph.SERCOM_I2CM.INTFLAG.MB loop
         null;
      end loop;

      -- STOP
      This.Periph.SERCOM_I2CM.INTFLAG.MB := True;
      This.Periph.SERCOM_I2CM.CTRLB.CMD := 3;
      This.Periph.SERCOM_I2CM.DATA := 0;
      while This.Periph.SERCOM_I2CM.SYNCBUSY.SYSOP or else
            This.Periph.SERCOM_I2CM.STATUS.BUSSTATE /= 1 loop
         null;
      end loop;

      Status := Ok;
   end Master_Transmit;

   overriding
   procedure Master_Receive
     (This    : in out I2C_Port;
      Addr    : I2C_Address;
      Data    : out I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000)
   is
   begin
      Status := Err_Error;
   end Master_Receive;

   overriding
   procedure Mem_Write
     (This          : in out I2C_Port;
      Addr          : I2C_Address;
      Mem_Addr      : UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000)
   is
   begin
      Status := Err_Error;
   end Mem_Write;

   overriding
   procedure Mem_Read
     (This          : in out I2C_Port;
      Addr          : I2C_Address;
      Mem_Addr      : UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : out I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000)
   is
   begin
      Status := Err_Error;
   end Mem_Read;
end SAMD21.I2C;
