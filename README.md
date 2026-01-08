# PlayerMotion
このデータパックは、エンチャントの`apply_impulse`を使用したプレイヤーのMotionを操作するライブラリです。<br>

## 対応バージョン
Minecraft JE 1.21.11<br><br>
過去バージョン向けのデータパックは<br>
[Releases](https://github.com/Hirobao1/CustomEnchant_PlayerMotion/releases)からダウンロードしてください。

## 使い方
### Rotationの方向でMotionを代入する
```
scoreboard players set $strength hb.Motion 12345
execute rotated 45 20 run function #p_motion:looking
```
- `$strength`には、実行者に実行時の向きにかかるMotionの値を指定します。
- 値は10000倍で指定します。（ 範囲: -250000～250000 ）<br>例: `$strength`が12345の場合、視線方向に1.2345ブロック/tickのMotionがかかります。

### XYZの方向でMotionを代入する
```
scoreboard players set $x hb.Motion 1500
scoreboard players set $y hb.Motion 10000
scoreboard players set $z hb.Motion -2800
function #p_motion:xyz
```
- `$x`, `$y`, `$z`には、実行者にそれぞれ x, y, z方向にかかるMotionの値を指定します。
- 値は10000倍で指定します。（ 範囲: -250000～250000 ）

## 注意事項
- カスタムエンチャントは実験的機能のため、シングルの場合ワールド参加時に警告がでます。
- データパックを導入した際は、ワールドを再読み込みしてください。`reload`コマンドでは更新できません。
- エンチャントはプレイヤーのbodyスロットによって操作しているため、functionを実行した後にclearコマンドなどでアイテムを消去した場合、Motionが付与されない場合があります。

## 連絡先
https://Twitter.com/Hirobao1
