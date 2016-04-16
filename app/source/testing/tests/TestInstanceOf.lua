require("testing.asserts")
require("ObjectBase")

local A = subclass("A", Object)
local B = subclass("B", Object)

local Asub = subclass("Asub", A)
local Bsub = subclass("Bsub", B)

local iso = Object.instanceof
local te = test.expect

return {
NormalInstance = function ()
    te{true, iso(Object:new(), Object), "Base case (Obj)"}
    te{true, iso(A:new(), A), "Base case (A)"}
    te{true, iso(B:new(), B), "Base case (B)"}
    te{true, iso(Asub:new(), Asub), "Base case (Asub)"}
    te{true, iso(Bsub:new(), Bsub), "Base case (Bsub)"}
end,
SubclassInstance = function ()
    te{true, iso(A:new(), Object), "A is Obj"}
    te{true, iso(B:new(), Object), "B is Obj"}
    te{true, iso(Asub:new(), Object), "Asub is Obj"}
    te{true, iso(Bsub:new(), Object), "Bsub is Obj"}
    te{true, iso(Asub:new(), A), "Asub is A"}
    te{true, iso(Bsub:new(), B), "Bsub is B"}
end,
NotGeneric = function ()
    te{false, iso(Object:new(), A), "Obj is not A"}
    te{false, iso(Object:new(), B), "Obj is not B"}
    te{false, iso(Object:new(), Asub), "Obj is not Asub"}
    te{false, iso(Object:new(), Bsub), "Obj is not Bsub"}
end,
Directional = function ()
    te{false, iso(A:new(), Asub), "A is not Asub"}
    te{false, iso(B:new(), Bsub), "B is not Bsub"}
end,
Siblings = function ()
    te{false, iso(A:new(), B), "A is not B"}
    te{false, iso(B:new(), A), "B is not A"}
    te{false, iso(Asub:new(), Bsub), "Asub is not Bsub"}
    te{false, iso(Bsub:new(), Asub), "Bsub is not Asub"}
    te{false, iso(Asub:new(), B), "Asub is not B"}
    te{false, iso(Bsub:new(), A), "Bsub is not A"}
end
}
