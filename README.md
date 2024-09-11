# PlayerMotion
このデータパックは、エンチャントの爆発のknockbackを使用したプレイヤーのMotionを操作するライブラリです。<br>

## 対応バージョン
Minecraft JE 1.21

## 使い方
### Rotationの方向でMotionを代入する
```
scoreboard players set $strength hb.Motion 12345
function #p_motion:looking
```
- `$strength`には、実行者に実行時のRotationの方向にかかるMotionの値を指定します。
- 値は10000倍で指定します。（ 範囲: -1000000～1000000 ）<br>例: `$strength`が12345の場合、視線方向に1.2345ブロック/tickのMotionがかかります。

### XYZの方向でMotionを代入する
```
scoreboard players set $x hb.Motion 1500
scoreboard players set $y hb.Motion 10000
scoreboard players set $z hb.Motion -2800
function #p_motion:xyz
```
- `$x`, `$y`, `$z`には、実行者にそれぞれ x, y, z方向にかかるMotionの値を指定します。
- 値は10000倍で指定します。（ 範囲: -1000000～1000000 ）

## 注意事項
実行者の半径0.0003ブロック以内のエンティティは影響を受ける場合があります。<br>
カスタムエンチャントは実験的機能のため、シングルの場合ワールド参加時に警告がでます。<br>
シングル、バニラサーバー以外では検証していません。

## 連絡先
https://Twitter.com/Hirobao1
