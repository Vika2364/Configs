require("ee-gpr-alias")
apiRequest(0.1) -- request version 0.1 API. Calling apiRequest() is mandatory.

-- This game uses an old kernel which has a bug on _TerminateThread.
-- It is necessary to check the target thread is already in readyqueue or not.

iopObj = getIOPObject()
iopInsnReplace(0x0000C5C0, 0x0C004430, 0) -- jal 0x000110C0 // unlink_element (in TerminateThread)
iopInsnReplace(0x0000C6EC, 0x0C004430, 0) -- jal 0x000110C0 // unlink_element (in iTerminateThread)
local fix_TerminateThread = function()
local TCB = iopObj.GetGpr(gpr.s0)
local TCB_status = iopObj.ReadMem8(TCB + 0xc)
local TCB_h_l = TCB
if TCB_status == 0x2 then
-- the target thread is on ready.
local TCB_h_l_prev = iopObj.ReadMem32(TCB_h_l + 0)
local TCB_h_l_next = iopObj.ReadMem32(TCB_h_l + 4)
if TCB_h_l_prev == TCB_h_l_next then -- last_one_element(&tcb->h.l)
-- we need to maintain threadManCB.readymap.
-- print("WE NEED TO MAINTAIN threadManCB.readymap!")
local s0 = iopObj.ReadMem16(TCB + 0xe) -- prio
local s1 = TCB
local a0 = s0 >> 5
a0 = a0 << 2
local v1 = s0 & 0x1f
local v0 = 1 << v1
v1 = 0x10000 + a0
v1 = iopObj.ReadMem32(v1 + 0x1a08)
v0 = ~v0
v1 = v1 & v0
local at = 0x10000+a0
iopObj.WriteMem32(at+0x1a08, v1)

-- 0000B798 00102142 srl a0,s0,5
-- 0000B79C 00042080 sll a0,a0,2
-- 0000B7A0 3203001F andi v1,s0,0x1F
-- 0000B7A4 24020001 li v0,0x1
-- 0000B7A8 00621004 sllv v0,v0,v1
-- 0000B7AC 3C030001 lui v1,0x1
-- 0000B7B0 00641821 addu v1,v1,a0
-- 0000B7B4 8C631A08 lw v1,0x1A08(v1)
-- 0000B7B8 00021027 nor v0,zero,v0
-- 0000B7BC 00621824 and v1,v1,v0
-- 0000B7C0 3C010001 lui at,0x1
-- 0000B7C4 00240821 addu at,at,a0
-- 0000B7C8 AC231A08 sw v1,0x1A08(at)

end
end
-- do unlink_element
local v1 = iopObj.ReadMem32(TCB_h_l+0) -- element->prev
local v0 = iopObj.ReadMem32(TCB_h_l+4) -- element->next
iopObj.WriteMem32(v1 + 4, v0) -- element->prev->next = element->next
iopObj.WriteMem32(v0 + 0, v1)
end
iopObj.AddHook(0x0000C5C4, 0x02002021, fix_TerminateThread) -- move a0,s0
iopObj.AddHook(0x0000C6F0, 0x02002021, fix_TerminateThread) -- move a0,s0

-- _waitIpuIdle64 spin perf down problem. Bug#8289
-- NOTE: new libarary also loops just 500dec around. 0x1389 is too much.
eeInsnReplace(0x0020CF80, 0x28421389, 0x28420200) -- slti v0,v0,0x1389