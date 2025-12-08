

# 検知エンティティ 21a7163d-5fc5-411b-a466-6800627c9da0
execute unless entity 21a7163d-5fc5-411b-a466-6800627c9da0 run summon wandering_trader 0.0 -100.0 0.0 {NoAI:true,Silent:true,DespawnDelay:2,UUID:[I; 564598333, 1606762779, -1536792576, 1652333984]}
$summon arrow 0.0 -98.0 0.0 {Motion:[0d,-1d,0d],SoundEvent:intentionally_empty,weapon:{components:{"minecraft:enchantments":{"p_motion:detect_entity":1,"p_motion:x":$(x1),"p_motion:y":$(y1),"p_motion:z":$(z1)}},count:1,id:"minecraft:bow"},Tags:["$(signx)","$(signy)","$(signz)"],Owner:$(UUID)}
$summon arrow 0.0 -98.0 0.0 {Motion:[0d,-1d,0d],SoundEvent:intentionally_empty,weapon:{components:{"minecraft:enchantments":{"p_motion:detect_entity":1,"p_motion:x":$(x2),"p_motion:y":$(y2),"p_motion:z":$(z2)}},count:1,id:"minecraft:bow"},Tags:["$(signx)","$(signy)","$(signz)"],Owner:$(UUID)}
$summon arrow 0.0 -98.0 0.0 {Motion:[0d,-1d,0d],SoundEvent:intentionally_empty,weapon:{components:{"minecraft:enchantments":{"p_motion:detect_entity":1,"p_motion:x":$(x3),"p_motion:y":$(y3),"p_motion:z":$(z3)}},count:1,id:"minecraft:bow"},Tags:["$(signx)","$(signy)","$(signz)"],Owner:$(UUID)}