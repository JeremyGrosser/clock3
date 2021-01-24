with HAL.I2C; use HAL.I2C;
with HAL; use HAL;
with SAMD21_SVD.SERCOM;

package SAMD21.I2C is
   type I2C_Port (Periph : not null access SAMD21_SVD.SERCOM.SERCOM_Peripheral) is
      new HAL.I2C.I2C_Port with private;

   procedure Enable
      (This : in out I2C_Port);

   function Enabled
      (This : in out I2C_Port)
      return Boolean;

   overriding
   procedure Master_Transmit
     (This    : in out I2C_Port;
      Addr    : I2C_Address;
      Data    : I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000)
      with Pre => Enabled (This);

   overriding
   procedure Master_Receive
     (This    : in out I2C_Port;
      Addr    : I2C_Address;
      Data    : out I2C_Data;
      Status  : out I2C_Status;
      Timeout : Natural := 1000)
      with Pre => Enabled (This);

   overriding
   procedure Mem_Write
     (This          : in out I2C_Port;
      Addr          : I2C_Address;
      Mem_Addr      : UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000)
      with Pre => Enabled (This);

   overriding
   procedure Mem_Read
     (This          : in out I2C_Port;
      Addr          : I2C_Address;
      Mem_Addr      : UInt16;
      Mem_Addr_Size : I2C_Memory_Address_Size;
      Data          : out I2C_Data;
      Status        : out I2C_Status;
      Timeout       : Natural := 1000)
      with Pre => Enabled (This);

private
   type I2C_Port (Periph : not null access SAMD21_SVD.SERCOM.SERCOM_Peripheral) is
      new HAL.I2C.I2C_Port with null record;
end SAMD21.I2C;
