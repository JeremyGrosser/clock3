with HAL;

package Board is
    -- Clock is incremented by SysTick every 1ms, wraps around after 24.855 days
    type Time is new Natural;
    Clock : Time := Time'First;
    pragma Volatile (Clock);

    type Pins is
       (LED_1, LED_2, MISO, MOSI, SCK, RX, TX, SCL, SDA,
        D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13,
        A0, A1, A2, A3, A4, A5);

    type Pin_Modes is (Input, Output, Alternate);
    type Pin_States is (Low, High);
    subtype Analog_Value is Integer range 0 .. 1000;
    type Analog_References is (Internal, External);

    Pin_Type_Error : exception;

    procedure Initialize;

    -- Wait for a number of milliseconds. It is up to you to make sure the
    -- watchdog is disabled. Don't call this before Initialize
    procedure Wait (Milliseconds : Time);

    procedure Watchdog_Enable;
    procedure Watchdog_Reload;
    procedure Watchdog_Disable;

    procedure Pin_Mode
        (Pin  : Pins;
         Mode : Pin_Modes);

    procedure Digital_Write
        (Pin   : Pins;
         State : Pin_States);
    procedure Digital_Read
        (Pin   : Pins;
         State : out Pin_States);

    --procedure Analog_Write
    --    (Pin   : Pins;
    --     Value : Analog_Value);
    --procedure Analog_Read
    --    (Pin   : Pins;
    --     Value : out Analog_Value);
    --procedure Analog_Reference
    --    (Ref : Analog_References);

    procedure Serial_Write
       (Data : String);
    procedure Serial_Read
       (Data : out String);

    procedure SPI_Begin;
    procedure SPI_Transfer
       (Data : in out HAL.UInt8);
    procedure SPI_End;

    subtype I2C_Address is HAL.UInt7;
    function I2C_Read
       (Address : I2C_Address)
       return HAL.UInt8;
    procedure I2C_Read
       (Address : I2C_Address;
        Data    : out HAL.UInt8_Array);
    procedure I2C_Write
       (Address : I2C_Address;
        Data    : HAL.UInt8);
    procedure I2C_Write
       (Address : I2C_Address;
        Data    : HAL.UInt8_Array);

    subtype Unique_Id_Type is HAL.UInt32_Array (1 .. 4);
    function Unique_Id
       return Unique_Id_Type;

    --procedure Pulse_In
    --    (Pin     : in Pins;
    --     State   : in Pin_States;
    --     Timeout : Ada.Real_Time.Time_Span := Ada.Real_Time.Milliseconds (1000));
    --
    --type Bit_Orders is (MSB_First, LSB_First);
    --procedure Shift_In
    --    (Data_Pin  : in Pins;
    --     Clock_Pin : in Pins;
    --     Bit_Order : in Bit_Orders;
    --     Value     : out Interfaces.Unsigned_8);
    --procedure Shift_Out
    --    (Data_Pin  : in Pins;
    --     Clock_Pin : in Pins;
    --     Bit_Order : in Bit_Orders;
    --     Value     : in Interfaces.Unsigned_8);
    --
    procedure Wait_For_Interrupt;

    subtype Interrupt_Numbers is Integer range 0 .. 15;
    type Interrupt_Procedure is access procedure;
    type Interrupt_Triggers is (Rising_Edge, Falling_Edge, Both_Edges, High_Level, Low_Level);
    procedure Attach_Interrupt
        (Interrupt : Interrupt_Numbers;
         Handler   : Interrupt_Procedure;
         Trigger   : Interrupt_Triggers);
    procedure Detach_Interrupt
        (Interrupt : Interrupt_Numbers);

private

    subtype Hertz is Natural;
    System_Clock_Frequency : Hertz := 1_000_000;
    pragma Volatile (System_Clock_Frequency);

    Interrupt_Handlers : array (Interrupt_Numbers) of Interrupt_Procedure := (others => null);

    procedure SysTick_Handler;
    pragma Export (C, SysTick_Handler, "SysTick_Handler");
    pragma Linker_Section (SysTick_Handler, ".text");
    procedure WDT_Handler;
    pragma Export (C, WDT_Handler, "WDT_Handler");
    pragma Linker_Section (WDT_Handler, ".text");
    procedure EIC_Handler;
    pragma Export (C, EIC_Handler, "EIC_Handler");
    pragma Linker_Section (EIC_Handler, ".text");
end Board;
