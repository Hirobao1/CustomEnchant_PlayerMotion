#> p_motion:system/apply
# ワールドの軸の値（world）を実行者の向き基準に直し、同じ tick に呼ばれた分と合わせてエンチャントに載せる
# 押すのは実行者の tick のエンチャント効果。押したあと enchant/enchant_del で消える

# 実行者の向き基準の値
execute in overworld positioned 0.0 0.0 0.0 rotated as @s summon marker run function p_motion:system/to_local

# まだ押していない分に足す（範囲外は端に寄せる）
scoreboard players operation @s hb.Motion_forward += #local_f hb.Motion
scoreboard players operation @s hb.Motion_up += #local_u hb.Motion
scoreboard players operation @s hb.Motion_left += #local_l hb.Motion
execute store result score @s hb.Motion_forward run compute default integer {type:"max",inputs:[-250000,{type:"min",inputs:[250000,{type:"score",target:"this",score:"hb.Motion_forward"}]}]}
execute store result score @s hb.Motion_up run compute default integer {type:"max",inputs:[-250000,{type:"min",inputs:[250000,{type:"score",target:"this",score:"hb.Motion_up"}]}]}
execute store result score @s hb.Motion_left run compute default integer {type:"max",inputs:[-250000,{type:"min",inputs:[250000,{type:"score",target:"this",score:"hb.Motion_left"}]}]}

# 符号
data modify storage hb:motion macro set value {signf:"+forward",signu:"+up",signl:"+left"}
execute if score @s hb.Motion_forward matches ..-1 run data modify storage hb:motion macro.signf set value "-forward"
execute if score @s hb.Motion_up matches ..-1 run data modify storage hb:motion macro.signu set value "-up"
execute if score @s hb.Motion_left matches ..-1 run data modify storage hb:motion macro.signl set value "-left"

# 桁（1:1/10000 の位 2:1/100 の位 3:1 の位。どれもエンチャントのレベル）
execute store result storage hb:motion macro.f1 int 1 run compute default integer {type:"mod",left:{type:"abs",input:{type:"score",target:"this",score:"hb.Motion_forward"}},right:100}
execute store result storage hb:motion macro.f2 int 1 run compute default integer {type:"div",left:{type:"mod",left:{type:"abs",input:{type:"score",target:"this",score:"hb.Motion_forward"}},right:10000},right:100}
execute store result storage hb:motion macro.f3 int 1 run compute default integer {type:"div",left:{type:"abs",input:{type:"score",target:"this",score:"hb.Motion_forward"}},right:10000}
execute store result storage hb:motion macro.u1 int 1 run compute default integer {type:"mod",left:{type:"abs",input:{type:"score",target:"this",score:"hb.Motion_up"}},right:100}
execute store result storage hb:motion macro.u2 int 1 run compute default integer {type:"div",left:{type:"mod",left:{type:"abs",input:{type:"score",target:"this",score:"hb.Motion_up"}},right:10000},right:100}
execute store result storage hb:motion macro.u3 int 1 run compute default integer {type:"div",left:{type:"abs",input:{type:"score",target:"this",score:"hb.Motion_up"}},right:10000}
execute store result storage hb:motion macro.l1 int 1 run compute default integer {type:"mod",left:{type:"abs",input:{type:"score",target:"this",score:"hb.Motion_left"}},right:100}
execute store result storage hb:motion macro.l2 int 1 run compute default integer {type:"div",left:{type:"mod",left:{type:"abs",input:{type:"score",target:"this",score:"hb.Motion_left"}},right:10000},right:100}
execute store result storage hb:motion macro.l3 int 1 run compute default integer {type:"div",left:{type:"abs",input:{type:"score",target:"this",score:"hb.Motion_left"}},right:10000}

# 消す処理は forward_1 に載っているので、1/10000 の位が 0 でも付ける（251 は lookup の範囲外で 0 として押す）
execute if data storage hb:motion macro{f1:0} run data modify storage hb:motion macro.f1 set value 251

# エンチャントセット
function p_motion:system/enchant_set with storage hb:motion macro
