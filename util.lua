local util = {}

function util.cloneTable(table)
    local output = {}
    for k, v in pairs(table) do
        output[k] = v
    end
    return output
end

function util.mergeTableLeft(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
    end
    return t1
end

return util
