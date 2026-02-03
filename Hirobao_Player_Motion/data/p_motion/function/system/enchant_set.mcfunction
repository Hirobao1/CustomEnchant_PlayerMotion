
# bodyアイテムがない場合
execute unless items entity @s armor.body *[equippable={"slot": "body",equip_sound:intentionally_empty}] run item replace entity @s armor.body with stone[equippable={slot:body,equip_sound:intentionally_empty},enchantments={binding_curse:1,vanishing_curse:1}]

# エンチャントセット
$item modify entity @s armor.body [{function:set_custom_data,tag:{signf:"$(signf)",signu:"$(signu)",signl:"$(signl)"}},{function:set_enchantments,enchantments:{"p_motion:forward_1":$(f1),"p_motion:forward_2":$(f2),"p_motion:forward_3":$(f3),"p_motion:up_1":$(u1),"p_motion:up_2":$(u2),"p_motion:up_3":$(u3),"p_motion:left_1":$(l1),"p_motion:left_2":$(l2),"p_motion:left_3":$(l3)}}]
