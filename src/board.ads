with HAL; use HAL;
with Circular_Queue;

package Board is
    -- Clock is incremented by SysTick every 1ms, wraps around after 24.855 days
    type Time is new Natural;
    Clock : Time := Time'First;
    pragma Volatile (Clock);

    type Pins is
       (LED_1, LED_2, MISO, MOSI, SCK, RX, TX, SCL, SDA, USB_DP, USB_DM,
        D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13,
        A0, A1, A2, A3, A4, A5);

    type Pin_Modes is (Input, Output, Alternate);
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
         State : Boolean);
    procedure Digital_Read
        (Pin   : Pins;
         State : out Boolean);

    --procedure Analog_Write
    --    (Pin   : Pins;
    --     Value : Analog_Value);
    --procedure Analog_Read
    --    (Pin   : Pins;
    --     Value : out Analog_Value);
    --procedure Analog_Reference
    --    (Ref : Analog_References);

    package Byte_Queue is new Circular_Queue
       (Element_Type => UInt8,
        Size         => 512);
    use Byte_Queue;
    Serial_Buffer : Byte_Queue.Queue;

    type Serial_Status is (No_Data, Ok);
    procedure Serial_Write
       (Data : UInt8_Array);
    function Serial_Get
       return UInt8;
    function Serial_Get_Line
       (S : String := "")
       return String;

    procedure SPI_Begin;
    procedure SPI_Transfer
       (Data : in out HAL.UInt8);
    procedure SPI_End;

    subtype Unique_Id_Type is HAL.UInt32_Array (1 .. 4);
    function Unique_Id
       return Unique_Id_Type;

    --procedure Pulse_In
    --    (Pin     : in Pins;
    --     State   : in Boolean;
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

    subtype External_Interrupt_Numbers is Integer range 0 .. 15;
    type Interrupt_Procedure is access procedure;
    type Interrupt_Triggers is (Rising_Edge, Falling_Edge, Both_Edges, High_Level, Low_Level);
    procedure Attach_Interrupt
        (Interrupt : External_Interrupt_Numbers;
         Handler   : Interrupt_Procedure;
         Trigger   : Interrupt_Triggers);
    procedure Detach_Interrupt
        (Interrupt : External_Interrupt_Numbers);

    procedure Set_RTC (Hour, Minute, Second : Natural);
    procedure Get_RTC (Hour, Minute, Second : out Natural);

    subtype Interrupt_Number is Natural range 0 .. 27;
    procedure Enable_Interrupt
       (IRQn : Interrupt_Number);
    procedure Disable_Interrupt
       (IRQn : Interrupt_Number);

 private

    subtype Hertz is Natural;
    System_Clock_Frequency : Hertz := 1_000_000;
    pragma Volatile (System_Clock_Frequency);

    Interrupt_Handlers : array (External_Interrupt_Numbers) of Interrupt_Procedure := (others => null);


    procedure SysTick_Handler;
    pragma Export (C, SysTick_Handler, "SysTick_Handler");
    pragma Linker_Section (SysTick_Handler, ".text");
    procedure WDT_Handler;
    pragma Export (C, WDT_Handler, "WDT_Handler");
    pragma Linker_Section (WDT_Handler, ".text");
    procedure EIC_Handler;
    pragma Export (C, EIC_Handler, "EIC_Handler");
    pragma Linker_Section (EIC_Handler, ".text");
    procedure SERCOM2_Handler;
    pragma Export (C, SERCOM2_Handler, "SERCOM2_Handler");
    pragma Linker_Section (SERCOM2_Handler, ".text");
    procedure RTC_Handler;
    pragma Export (C, RTC_Handler, "RTC_Handler");
    pragma Linker_Section (RTC_Handler, ".text");
end Board;
