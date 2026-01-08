# PlayerMotion
このデータパックは、エンチャントの`apply_impulse`を使用したプレイヤーのMotionを操作するライブラリです。<br>

## 対応バージョン
Minecraft JE 1.21.11<br><br>
過去バージョン向けのデータパックは<br>
[Releases](https://github.com/Hirobao1/CustomEnchant_PlayerMotion/releases)からダウンロードしてください。

## 使い方
### 実行時の向きでMotionを代入する
```
scoreboard players set $strength hb.Motion 12345
execute rotated 45 20 run function #p_motion:looking
```
- `$strength`には、実行者に**実行時の向き**にかかるMotionの値を指定します。
- 値は**10000倍スケール**で指定します。（ 範囲: -250000～250000 ）<br>例: `$strength`が12345の場合、視線方向に1.2345ブロック/tickのMotionがかかります。

### XYZの方向でMotionを代入する
```
scoreboard players set $x hb.Motion 1500
scoreboard players set $y hb.Motion 10000
scoreboard players set $z hb.Motion -2800
function #p_motion:xyz
```
- `$x`, `$y`, `$z`には、実行者にそれぞれ **x / y / z方向**にかかるMotionの値を指定します。
- 値は**10000倍スケール**で指定します。（ 範囲: -250000～250000 ）

## 注意事項
- カスタムエンチャントは**実験的機能**のため、シングルの場合ワールド参加時に警告が表示されます。
- データパックを導入・更新した場合は、**ワールドを再読み込み**してください。`reload`コマンドでは更新できません。
- エンチャントは、**プレイヤーの body スロットに付与されたエンチャント**を利用してMotionを制御しています。<br>function実行後に`clear`コマンドなどで該当アイテムを削除した場合、Motion が付与されないことがあります。

## 連絡先
https://Twitter.com/Hirobao1
