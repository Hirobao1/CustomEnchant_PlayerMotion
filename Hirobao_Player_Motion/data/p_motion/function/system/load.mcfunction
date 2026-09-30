#> p_motion:system/load
# 一度だけ実行

# 使用するスコアボード
scoreboard objectives add hb.Motion dummy
scoreboard objectives add hb.Motion_forward dummy
scoreboard objectives add hb.Motion_up dummy
scoreboard objectives add hb.Motion_left dummy

# 使用するストレージ
data merge storage hb:motion {macro:{f1:0,f2:0,f3:0,u1:0,u2:0,u3:0,l1:0,l2:0,l3:0,signf:"+forward",signu:"+up",signl:"+left"}}

# 向きの計算に使う marker を置くチャンク
execute in overworld run forceload add 0 0