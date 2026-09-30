# PlayerMotion
このデータパックは、エンチャントの`apply_impulse`を使用したプレイヤーのMotionを操作するライブラリです。<br>

## 対応バージョン
Minecraft JE 26.3<br><br>
26.2 以前のバージョン向けのデータパックは<br>
[Releases](https://github.com/Hirobao1/CustomEnchant_PlayerMotion/releases)からダウンロードしてください。

## 使い方
### 実行時の向きにMotionを加える
```
scoreboard players set $strength hb.Motion 12345
execute rotated 45 20 run function #p_motion:looking
```
- `$strength`には、実行者に**実行時の向き**へ加えるMotionの値を指定します。
- 値は**10000倍スケール**で指定します。（ 範囲: -250000～250000 。範囲外の値は端の値にします ）<br>例: `$strength`が12345の場合、視線方向に1.2345ブロック/tickのMotionが加わります。

### XYZの方向にMotionを加える
```
scoreboard players set $x hb.Motion 1500
scoreboard players set $y hb.Motion 10000
scoreboard players set $z hb.Motion -2800
function #p_motion:xyz
```
- `$x`, `$y`, `$z`には、実行者にそれぞれ **x / y / z方向**へ加えるMotionの値を指定します。
- 値は**10000倍スケール**で指定します。（ 範囲: -250000～250000 。範囲外の値は端の値にします ）

## Motionが加わるタイミング
- function を実行したあと、実行者の tick の処理の中で加わります。<br>プレイヤーの場合、`#minecraft:tick` の function や、クリックなどの操作で発火する進捗から実行すると、その tick のうちに加わります。`using_item` など、プレイヤー自身の tick の中で発火する進捗から実行すると、次の tick に加わります。
- 加わる前に同じ実行者へ何度実行しても、値を合計して1回で加えます。合計は、前後・上下・左右のそれぞれで -250000～250000 に収めます。

## 注意事項
- スペクテイターのとき、乗り物に乗っているとき、飛行中（クリエイティブの飛行）は、何もしません。
- カスタムエンチャントは**実験的機能**のため、シングルの場合ワールド参加時に警告が表示されます。
- データパックを導入・更新した場合は、**ワールドを再読み込み**してください。`reload`コマンドでは更新できません。
- エンチャントは、**実行者の body スロットに付与されたエンチャント**を利用してMotionを制御しています。<br>function実行後、Motionが加わる前に`clear`コマンドなどで該当アイテムを削除した場合、Motion が加わらないことがあります。
- 旧バージョンから更新した場合、旧バージョンで使っていたスコアボード `hb.Queue_x` `hb.Queue_y` `hb.Queue_z` は、ワールドの読み込み時に削除されます。

## 連絡先
https://Twitter.com/Hirobao1
