
--[[

Constructs an advanced function

advanced functions support default values,
positional and named arguments

precedence: named > positional > default

advanced functions can be called like this:
    f{1, 2, 3, named="lol"}
    
usage:
    fnc(posmap, defaults, function)
    
example:
    func = fnc(
        {"par1", "par2"},
        {par1=5, par2="lol"},
        function (t)
            print(t.par1, tpar2)
        end
    )
    func{1, par2="hey"}

]]
function fnc(posmap, defaults, f)
    return function (t)
        -- load defaults
        local params = defaults
        
        -- set positional argument values
        for i,v in ipairs(posmap) do
            if t[i] ~= nil then
                params[v] = t[i]
            end
        end
        
        -- set named argument values
        for k,v in pairs(t) do
            params[k] = v
        end
        
        -- check required positional args
        for i,v in ipairs(posmap) do
            if params[v] == nil then
                assert("Missing positional argument '"..v.."'!")
            end
        end
        
        return f(params)
    end
end
