Settings = {
    Name = "MEMA",
    period = 10
}

function Init()
    return 1
end

function OnCalculate(index)
    if index < Settings.period then
        return nil
    else
        local summ = 0
        local median = 0
        local data = {}
        local middle = 0
        for i = index-Settings.period+1, index do
            summ = summ + C(i)
            table.insert(data, C(i))
        end
        table.sort(data)
        if Settings.period % 2 == 0 then
            -- Четный размер выборки
            middle = Settings.period / 2 + 1
            median = (data[middle] + data[middle+1]) / 2
        else    
            -- Нечетный размер выборки
            middle = math.ceil(Settings.period / 2) + 1
            median = data[middle]
        end

        return median
    end
end