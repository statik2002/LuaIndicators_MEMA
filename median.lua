Settings = {
    Name = "MEMA",
    period = 30
}

function Init()
    Data = {}
    CurrentBar = 0
    return 1
end

function OnCalculate(index)
    if CurrentBar ~= index then
        CurrentBar = index
        local median = Repaint(index)
        return median
    else
        return nil
    end
end

function Repaint(index)
    if index < Settings.period then
        return nil
    else
        local median = 0
        Data = {}
        local middle = 0
        for i = index-Settings.period+1, index do
            table.insert(Data, C(i))
        end
        table.sort(Data)
        if Settings.period % 2 == 0 then
            -- Четный размер выборки
            middle = Settings.period / 2 + 1
            median = (Data[middle] + Data[middle+1]) / 2
        else    
            -- Нечетный размер выборки
            middle = math.ceil(Settings.period / 2) + 1
            median = Data[middle]
        end

        return median
    end
end