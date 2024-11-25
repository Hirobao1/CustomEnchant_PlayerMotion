#> p_motion:system/summon
# Motion付与用エンティティ召喚

# 一時的にTPしたエンティティを戻す
summon armor_stand ~ ~ ~ {Marker:1b,Small:1b,Invisible:1b,Silent:1b,ArmorItems:[{},{id:"stone",components:{enchantments:{"p_motion:tp":1}}},{},{}],Tags:["tp_after","hb.enc_stand"]}

# Y軸
$summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Small:1b,Invisible:1b,Silent:1b,ArmorItems:[{id:"stone",components:{enchantments:{levels:{"p_motion:vertical1":$(y1),"p_motion:vertical2":$(y2),"p_motion:vertical3":$(y3)}}}},{},{},{}],Tags:["hb.enc_stand",$(signy),"v1_$(y1)","v2_$(y2)","v3_$(y3)"]}

# X軸
$execute if data storage hb:motion signs{X:1} run summon minecraft:armor_stand ~-0.0001 ~ ~ {Marker:1b,Small:1b,Invisible:1b,Silent:1b,ArmorItems:[{id:"stone",components:{enchantments:{levels:{"p_motion:horizon1":$(x1),"p_motion:horizon2":$(x2),"p_motion:horizon3":$(x3)}}}},{},{},{}],Tags:["hb.enc_stand","+","h1_$(x1)","h2_$(x2)","h3_$(x3)"]}
$execute if data storage hb:motion signs{X:1} run summon minecraft:armor_stand ~0.0001 ~ ~ {Marker:1b,Small:1b,Invisible:1b,Silent:1b,ArmorItems:[{id:"stone",components:{enchantments:{levels:{"p_motion:horizon1":$(x1),"p_motion:horizon2":$(x2),"p_motion:horizon3":$(x3)}}}},{},{},{}],Tags:["hb.enc_stand","-","h1_$(x1)","h2_$(x2)","h3_$(x3)"]}
$execute if data storage hb:motion signs{X:-1} run summon minecraft:armor_stand ~0.0001 ~ ~ {Marker:1b,Small:1b,Invisible:1b,Silent:1b,ArmorItems:[{id:"stone",components:{enchantments:{levels:{"p_motion:horizon1":$(x1),"p_motion:horizon2":$(x2),"p_motion:horizon3":$(x3)}}}},{},{},{}],Tags:["hb.enc_stand","+","h1_$(x1)","h2_$(x2)","h3_$(x3)"]}
$execute if data storage hb:motion signs{X:-1} run summon minecraft:armor_stand ~-0.0001 ~ ~ {Marker:1b,Small:1b,Invisible:1b,Silent:1b,ArmorItems:[{id:"stone",components:{enchantments:{levels:{"p_motion:horizon1":$(x1),"p_motion:horizon2":$(x2),"p_motion:horizon3":$(x3)}}}},{},{},{}],Tags:["hb.enc_stand","-","h1_$(x1)","h2_$(x2)","h3_$(x3)"]}

# Z軸
$execute if data storage hb:motion signs{Z:1} run summon minecraft:armor_stand ~ ~ ~-0.0001 {Marker:1b,Small:1b,Invisible:1b,Silent:1b,ArmorItems:[{id:"stone",components:{enchantments:{levels:{"p_motion:horizon1":$(z1),"p_motion:horizon2":$(z2),"p_motion:horizon3":$(z3)}}}},{},{},{}],Tags:["hb.enc_stand","+","h1_$(z1)","h2_$(z2)","h3_$(z3)"]}
$execute if data storage hb:motion signs{Z:1} run summon minecraft:armor_stand ~ ~ ~0.0001 {Marker:1b,Small:1b,Invisible:1b,Silent:1b,ArmorItems:[{id:"stone",components:{enchantments:{levels:{"p_motion:horizon1":$(z1),"p_motion:horizon2":$(z2),"p_motion:horizon3":$(z3)}}}},{},{},{}],Tags:["hb.enc_stand","-","h1_$(z1)","h2_$(z2)","h3_$(z3)"]}
$execute if data storage hb:motion signs{Z:-1} run summon minecraft:armor_stand ~ ~ ~0.0001 {Marker:1b,Small:1b,Invisible:1b,Silent:1b,ArmorItems:[{id:"stone",components:{enchantments:{levels:{"p_motion:horizon1":$(z1),"p_motion:horizon2":$(z2),"p_motion:horizon3":$(z3)}}}},{},{},{}],Tags:["hb.enc_stand","+","h1_$(z1)","h2_$(z2)","h3_$(z3)"]}
$execute if data storage hb:motion signs{Z:-1} run summon minecraft:armor_stand ~ ~ ~-0.0001 {Marker:1b,Small:1b,Invisible:1b,Silent:1b,ArmorItems:[{id:"stone",components:{enchantments:{levels:{"p_motion:horizon1":$(z1),"p_motion:horizon2":$(z2),"p_motion:horizon3":$(z3)}}}},{},{},{}],Tags:["hb.enc_stand","-","h1_$(z1)","h2_$(z2)","h3_$(z3)"]}

# 同じ位置のエンティティを一時的にTP
summon armor_stand ~ ~ ~ {Marker:1b,Small:1b,Invisible:1b,Silent:1b,ArmorItems:[{id:"stone",components:{enchantments:{"p_motion:tp":1}}},{},{},{}],Tags:["tp_before","hb.enc_stand"]}