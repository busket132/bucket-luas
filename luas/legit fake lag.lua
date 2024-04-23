FakeLagInterval = 250  -- time between fake lag enables
FakeLagTime = 500  -- time that allow fake lag to be enabled
InfoPrintEnabled = 0
InfoPrintInterval = 100
InfoPrinted = 0
Randomnes = 0
local FakeLagIntervalTime = 0  -- time that fake lag enabled
local FakeLagTimeOn = 0  -- time that fake lag enabled
Random1 = 0
Random2 = 0

engine.Notification('Fake lag timer info', 'To print info write lua InfoPrintEnabled = 1, to disable set 0 \nTo change time between info is printed write lua InfoPrintInterval = YOUR VALUE \nTo change time between fake lag enable write lua FakeLagInterval = YOUR VALUE \nTo change time that fake lag enabled write lua FakeLagTime = YOUR VALUE \nTo add a bit random write lua Randomnes = 1 \nFor your value 100 = 1 second')

callbacks.Register("CreateMove", function ()
    if FakeLagInterval + Random1 <= FakeLagIntervalTime then
        FakeLagTimeOn = FakeLagTimeOn + 1
        if FakeLagTime  >= FakeLagTimeOn then
            gui.SetValue('Fake Lag', 1)
        elseif FakeLagTime + Random2 <= FakeLagTimeOn then
            FakeLagTimeOn = 0
            FakeLagIntervalTime = 0
            if Randomnes == 1 then
                Random1 = math.random(FakeLagInterval*-1 + 15, 0)
                Random2 = math.random(FakeLagTime*-1 + 15, 0)
            else
                Random1 = 0
                Random2 = 0
            end
        end
    else
        gui.SetValue('Fake Lag', 0)
        FakeLagIntervalTime = FakeLagIntervalTime + 1
    end
    if InfoPrintEnabled == 1 then
        if InfoPrintInterval == InfoPrinted then
        --print('Fake',FakeLagIntervalTime)
        --print(FakeLagTimeOn)
        print('Fake Lag Interval =', FakeLagInterval + Random1)
        print('Fake Lag Time =' ,FakeLagTime + Random2)
        print('Randomnes =', Randomnes)
        InfoPrinted = 0
        elseif InfoPrinted < InfoPrintInterval then
            InfoPrinted = InfoPrinted + 1
        elseif InfoPrinted > InfoPrintInterval then
            InfoPrinted = 0
        end
    else
    end
    --gui.SetValue('Fake Lag value (ms)', 120)
end)
