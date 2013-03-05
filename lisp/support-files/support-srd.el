;;; support-srd.el --- support file for 『ランダムハウス英語辞典』
;; Copyright (C) 1999 Lookup Development Team <lookup@ring.gr.jp>

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software Foundation,
;; Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

;;; Code:

(defvar ipaface 'default)

(let
    ((encoded-srd-gaiji-table
       '(("G0-2f" "/")
	 ("G0-3a" ":")
	 ("G0-3d" "=")
	 ("G0-75" "u")
	 ("G0-83" "ƒ") ; 関数記号のf
	 ("G0-85" "…")
	 ("G0-8a" "Š")
	 ("G0-8c" "Œ")
	 ("G0-93" "“")
	 ("G0-94" "”")
	 ("G0-9c" "œ")
	 ("G0-a3" "£")
	 ("G0-a9" "©")
	 ("G0-ae" "®")
	 ("G0-b0" "°")
	 ("G0-b4" "´")
	 ("G0-b5" "µ")
	 ("G0-b7" "·")
	 ("G0-b8" "¸")
	 ("G0-bc" "¼")
	 ("G0-bd" "½")
	 ("G0-be" "¾")
	 ("G0-bf" "¿")
	 ("G0-c0" "À")
	 ("G0-c1" "Á")
	 ("G0-c2" "Â")
	 ("G0-c4" "Ä")
	 ("G0-c5" "Å")
	 ("G0-c6" "Æ")
	 ("G0-c7" "Ç")
	 ("G0-c8" "È")
	 ("G0-c9" "É")
	 ("G0-ca" "Ê")
	 ("G0-cc" "Ì")
	 ("G0-cd" "Í")
	 ("G0-ce" "Î")
	 ("G0-d0" "Ð")
	 ("G0-d2" "Ò")
	 ("G0-d3" "Ó")
	 ("G0-d6" "Ö")
	 ("G0-d9" "Ù")
	 ("G0-da" "Ú")
	 ("G0-dc" "Ü")
	 ("G0-dd" "Ý")
	 ("G0-df" "ß")
	 ("G0-e0" "à")
	 ("G0-e1" "á")
	 ("G0-e2" "â")
	 ("G0-e3" "ã")
	 ("G0-e4" "ä")
	 ("G0-e5" "å")
	 ("G0-e6" "æ")
	 ("G0-e7" "ç")
	 ("G0-e8" "è")
	 ("G0-e9" "é")
	 ("G0-ea" "ê")
	 ("G0-eb" "ë")
	 ("G0-ec" "ì")
	 ("G0-ed" "í")
	 ("G0-ee" "î")
	 ("G0-ef" "ï")
	 ("G0-f0" "ð")
	 ("G0-f1" "ñ")
	 ("G0-f2" "ò")
	 ("G0-f3" "ó")
	 ("G0-f4" "ô")
	 ("G0-f5" "õ")
	 ("G0-f6" "ö")
	 ("G0-f9" "ù")
	 ("G0-fa" "ú")
	 ("G0-fb" "û")
	 ("G0-fc" "ü")
	 ("G0-fd" "ý")
	 ("G0-fe" "þ")
	 ("G0-ff" "ÿ")
	 ("G1-41" "ɑ")
	 ("G1-42" "ɔ")
	 ("G1-43" "ʌ́")
	 ("G1-4a" "ǽ")
	 ("G1-4b" "æ̀")
	 ("G1-4c" "ə́")
	 ("G1-4d" "ə̀")
	 ("G1-4e" "ɑ́")
	 ("G1-4f" "ɑ̀")
	 ("G1-50" "ʃ")
	 ("G1-51" "ɔ́")
	 ("G1-52" "ɔ̀")
	 ("G1-53" "ɛ́")
	 ("G1-54" "ɛ̀")
	 ("G1-57" "ǣ")
	 ("G1-58" "ē")
	 ("G1-59" "ī")
	 ("G1-5a" "ū")
	 ("G1-5b" "ō")
	 ("G1-5c" "ā")
	 ("G1-5d" "Ā")
	 ("G1-5e" "ȳ")
	 ("G1-5f" "N̄")
	 ("G1-60" "r̄")
	 ("G1-61" "ɒ")
	 ("G1-62" "ɨ́")
	 ("G1-63" "ɨ")
	 ("G1-64" "đ")
	 ("G1-65" "ɑ̃")
	 ("G1-66" "Ō")
	 ("G1-67" "ñ")
	 ("G1-68" "Ū")
	 ("G1-6a" "θ")
	 ("G1-71" "θ́")
	 ("G1-72" "θ̀")
	 ("G1-73" "ʒ")
	 ("G1-76" "ŋ")
	 ("G1-78" "r̀")
	 ("G1-7a" "ỳ")
	 ("G1-7d" "ǿ")
	 ("G1-7e" "ø̀")
	 ("G1-80" "Ē")
	 ("G1-81" "Ī")
	 ("G1-86" "ɛ")
	 ("G1-88" "Ỳ")
	 ("G1-89" "ɲ")
	 ("G1-8a" "ā")
	 ("G1-8b" "B̀")
	 ("G1-8c" "Ć")
	 ("G1-92" "ĩ")
	 ("G1-93" "î")
	 ("G1-94" "Ô")
	 ("G1-95" "ă")
	 ("G1-96" "ğ")
	 ("G1-97" "ĭ")
	 ("G1-98" "ĕ")
	 ("G1-99" "ŭ")
	 ("G1-9a" "ŏ")
	 ("G1-9b" "s̆")
	 ("G1-9c" "c̆")
	 ("G1-9d" "ŷ")
	 ("G1-9e" "ĝ")
	 ("G1-9f" "ɑ̃")
	 ("G1-a0" "p̄")
	 ("G1-a3" "ŵ")
	 ("G1-a5" "w̄")
	 ("G1-a6" "x̃")
	 ("G1-a7" "X́")
	 ("G1-a8" "c̃")
	 ("G1-a9" "ɐ")
	 ("G1-ac" "ŭ")
	 ("G1-ad" "[タイ]") ; 上に開いた円弧,「‿」が上にある形。
	 ("G1-ae" "ă")
	 ("G1-b4" "v̥")
	 ("G1-b6" "ż")
	 ("G1-b7" "ȧ")
	 ("G1-b8" "-") ; [発音] 同上記号-
	 ("G1-b9" "ḏ")
	 ("G1-ba" "ṟ")
	 ("G1-bc" "ɨ") ; iに斜線
	 ("G1-c1" "ũ")
	 ("G1-c3" "ʎ")
	 ("G1-c4" "ṁ")
	 ("G1-c5" "ṅ")
	 ("G1-c6" "ė")
	 ("G1-c7" "Ẓ")
	 ("G1-cd" "l̤")
	 ("G1-ce" "r̤")
	 ("G1-cf" "ř")
	 ("G1-d0" "ǰ")
	 ("G1-d2" "ě")
	 ("G1-d3" "š")
	 ("G1-d4" "ǎ")
	 ("G1-d5" "č")
	 ("G1-d6" "Ǐ")
	 ("G1-d7" "Č")
	 ("G1-d8" "ň")
	 ("G1-e0" "ṓ")
	 ("G1-e1" "(タブー)") ; タブー記号(上付きのoにxの重ね字)
	 ("G1-e5" "ḗ")
	 ("G1-e6" "▾")
	 ("G1-eb" "ś")
	 ("G1-ec" "í˙") ; i´の右肩に.
	 ("G1-ed" "ǫ")
	 ("G1-ee" "ŕ")
	 ("G1-ef" "ḱ")
	 ("G1-f2" "ṣ")
	 ("G1-f4" "ɑ̄́")
	 ("G1-f5" "ī́")
	 ("G1-f6" "ḗ")
	 ("G1-f7" "ū́")
	 ("G1-fc" "ṍ")
	 ("G2-40" "Ł")
	 ("G2-43" "ł")
	 ("G2-44" "ɫ")
	 ("G2-48" "ɳ")
	 ("G2-49" "ɶ́")
	 ("G2-4a" "ɶ̀")
	 ("G2-4b" "ɨ") ; iに斜線
	 ("G2-52" "a͞a")
	 ("G2-54" "ᴍ") ; Mの形の小文字
	 ("G2-55" "ş")
	 ("G2-5f" "ţ")
	 ("G2-62" "Ḥ")
	 ("G2-63" "ḥ")
	 ("G2-64" "☧")
	 ("G2-65" "ǒ")
	 ("G2-66" "ṭ")
	 ("G2-67" "⁀")
	 ("G2-75" "ɑ̈")
	 ("G2-79" "ḍ")
	 ("G2-7a" "s̥")
	 ("G2-7c" "Ḍ")
	 ("G2-7d" "ǿ")
	 ("G2-81" "𝄉")
	 ("G2-8a" "ą")
	 ("G2-8d" "𝄪")
	 ("G2-95" "E|") ; 丸いEの上下にヒゲ
	 ("G2-97" "ħ")
	 ("G2-98" "d̥")
	 ("G2-9e" "𝄐")
	 ("G2-9f" "𝄑")
	 ("G2-a1" "[→]")
	 ("G2-ab" "ʁ")
	 ("G2-af" "[10^10^100]")
	 ("G2-b4" "ʁ")
	 ("G2-b5" "ɟ")
	 ("G2-b8" "ˇ")
	 ("G2-bd" "m̥")
	 ("G2-be" "o˙") ; oの右肩に.
	 ("G2-c2" "ḯ")
	 ("G2-c6" "z̀")
	 ("G2-c8" "Q̀")
	 ("G2-c9" "♪")
	 ("G2-cb" "ü")
	 ("G2-cc" "ˈ")
	 ("G2-cd" "[ルート-1]")
	 ("G2-ce" "Ṭ")
	 ("G2-cf" "[n乗根]")
	 ("G2-d0" "‽")
	 ("G2-e1" "ʌ̀")
	 ("G2-e4" "▼")
	 ("G2-e9" "ź")
	 ("G2-eb" "m̀")
	 ("G2-f0" "m̀")
	 ("G2-f0" "p̀")
	 ("G2-f1" "#12")
	 ("G2-f9" "℧")
	 ("G2-fb" "M̄")
	 ("G3-40" "w̃")
	 ("G3-41" "ẓ")
	 ("G3-44" "♮")
	 ("G3-45" "ė́")
	 ("G3-46" "i/´")
	 ("G3-4f" "↗")
	 ("G3-50" "↘")
	 ("G3-52" "(P)")
	 ("G3-5f" "ɐ̃́")
	 ("G3-63" "ḕ")
	 ("G3-66" "ǅ")
	 ("G3-67" "ẽ́")
	 ("G3-69" "ī́")
	 ("G3-75" "Ś")
	 ("G3-76" "ɔ̃́")
	 ("G3-77" "ʌ")
	 ("G3-79" "Ṣ")
	 ("G3-84" "[a+b￣]")
	 ("G3-88" "ï")
	 ("G3-89" "ệ")
	 ("G3-8a" "〓")
	 ("G3-8c" "ǧ")
	 ("G3-8d" "[ルート2Rr]")
	 ("G3-91" "ḷ")
	 ("G3-9a" "Я")
	 ("G3-9b" "ʇ")
	 ("G3-9c" "ī")
	 ("G3-9d" "ʌ̃́")
	 ("G3-9f" "ʉ́")
	 ("G3-a0" "∀")
	 ("G3-a3" "ộ")
	 ("G3-a4" "ɑ̣̂")
	 ("G3-a8" "ó")
	 ("G3-aa" "#ye1")
	 ("G3-ab" "#ye2")
	 ("G3-b9" "ə")
	 ("G3-ba" "↔")
	 ("G3-bc" "α´")
	 ("G3-bd" "ṇ")
	 ("G3-be" "ṛ")
	 ("G3-bf" "p˙")
	 ("G3-c1" "ɛ̃")
	 ("G3-c2" "ḅ")
	 ("G3-c3" "k˙") ; kの右肩に.
	 ("G3-c4" "ć")
	 ("G3-c5" "ṃ")
	 ("G3-c6" "e˙")
	 ("G3-ca" "D́")
	 ("G3-cb" "T́")
	 ("G3-cc" "P̀")
	 ("G3-cd" "Ŕ")
	 ("G3-ce" "Ǹ")
	 ("G3-cf" "ɑ̄́")
	 ("G3-d3" "ǵ")
	 ("G3-d4" "Q́")
	 ("G3-d5" "S̄́")
	 ("G3-d6" "M̀")
	 ("G3-d7" "Ṕ")
	 ("G3-d8" "ȳ́")
	 ("G3-d9" "V́")
	 ("G3-da" "Ń")
	 ("G3-db" "B́")
	 ("G3-dc" "H́")
	 ("G3-dd" "J́")
	 ("G3-de" "Ḿ")
	 ("G3-e1" "ɐ́")
	 ("G3-e5" "ḳ")
	 ("G3-e6" "ɑ˙")
	 ("G3-e7" "2̀")
	 ("G3-e8" "1́")
	 ("G3-e9" "F́")
	 ("G3-ea" "Ḱ")
	 ("G3-eb" "7́")
	 ("G3-ec" "Ĺ")
	 ("G3-ed" "Ẃ")
	 ("G3-ee" "ó˙")
	 ("G3-ef" "2́")
	 ("G3-f0" "3́")
	 ("G3-f1" "9́")
	 ("G3-f3" "4́")
	 ("G3-f4" "ɑ́˙")
	 ("G3-f6" "6́")
	 ("G3-f7" "8́")
	 ("G3-f9" "t́")
	 ("G3-fa" "x́")
	 ("G3-fb" "ḿ")
	 ("G4-0f" "《")
	 ("G4-40" "q̀")
	 ("G4-41" "x̀")
	 ("G4-42" "C̀")
	 ("G4-43" "Z̀")
	 ("G4-44" "Ž")
	 ("G4-45" "V̀")
	 ("G4-46" "T̀")
	 ("G4-47" "G̀")
	 ("G4-48" "J̀")
	 ("G4-49" "k̀")
	 ("G4-4a" "F̀")
	 ("G4-4b" "Ì")
	 ("G4-4c" "Ź")
	 ("G4-4d" "L̀")
	 ("G4-4e" "ṕ")
	 ("G4-4f" "D̀")
	 ("G4-50" "S̀")
	 ("G4-51" "R̀")
	 ("G4-52" "b́")
	 ("G4-53" "H̀")
	 ("G4-54" "Ẁ")
	 ("G4-56" "ǝ̈")
	 ("G4-57" "Ǵ")
	 ("G4-59" "ń")
	 ("G4-5b" "d́")
	 ("G4-5c" "ɔ̃")
	 ("G4-5e" "ɐ̃")
	 ("G4-5f" "f́")
	 ("G4-60" "i")
	 ("G4-61" "œ̃")
	 ("G4-62" "æ̃")
	 ("G4-64" "Cg~")
	 ("G4-66" "ĥ")
	 ("G4-67" "µ˙")
	 ("G4-6c" "√")
	 ("G4-6f" "kʷ") ; kの右肩にw
	 ("G4-72" "[s(s-a)(s-b)(s-c)の平方根]")
	 ("G4-77" "ː")
	 ("G4-79" "ı˙")
	 ("G4-88" "⇀")
	 ("G4-89" "→")
	 ("G4-8a" "[ルート2]")
	 ("G4-8b" "[Etc]") ; ; エトセトラの飾り文字
	 ("G4-8e" "⅓")
	 ("G4-90" "⅛")
	 ("G4-91" "⅜")
	 ("G4-92" "⅝")
	 ("G4-93" "⅞")
	 ("G4-95" "3/16")
	 ("G4-96" "7/16")
	 ("G4-97" "5/10")
	 ("G4-98" "11/32")
	 ("G4-99" "⅖")
	 ("G4-9a" "⅔")
	 ("G4-9b" "←")
	 ("G4-9d" "→")
	 ("G4-9f" "《")
	 ("G4-a0" "》")
	 ("G4-a1" "〔")
	 ("G4-a2" "〕")
	 ("G5-49" "ɪ")
	 ("G5-52" "ʀ")
	 ("G5-53" "S")
	 ("G5-54" "T")
	 ("G5-55" "U")
	 ("G5-56" "V")
	 ("G5-58" "X")
	 ("G5-59" "Y")
	 ("G5-5d" "Ø")
	 ("G5-60" "À")
	 ("G5-61" "Â")
	 ("G5-6a" "E")
	 ("G5-70" "Í")
	 ("G5-75" "Ñ")
	 ("G5-76" "Ö")
	 ("G5-80" "Ü")
	 ("G5-81" "Ú")
	 ("G5-83" "Ù")
	 ("G5-84" "Û")
	 ("G5-85" "Ū")
	 ("G5-88" "Ž")
	 ("G5-89" "Č")
	 ("G5-8a" "Ć")
	 ("G6-40" "楣")
	 ("G6-41" "痤")
	 ("G6-42" "癭")
	 ("G6-43" "炻")
	 ("G6-44" "梣")
	 ("G6-45" "⿱艹市")
	 ("G6-46" "垜")
	 ("G6-47" "枘")
	 ("G6-48" "榍")
	 ("G6-49" "皶")
	 ("G6-4a" "桛")
	 ("G6-4b" "埵")
	 ("G6-4c" "癤")
	 ("G6-4d" "煆")
	 ("G6-4e" "跗")
	 ("G6-4f" "塼")
	 ("G6-50" "魞")
	 ("G6-51" "滇")
	 ("G6-52" "翮")
	 ("G6-53" "蔲")
	 ("G6-54" "骶")
	 ("G6-55" "窠")
	 ("G6-56" "髁")
	 ("G6-57" "⿸尸夏") ; 厦の誤字か
	 ("G6-58" "絇")
	 ("G6-59" "荽")
	 ("G6-5a" "嗉")
	 ("G6-5b" "笯")
	 ("G6-5c" "齰")
	 ("G6-5d" "瘙")
	 ("G6-5e" "鄧")
	 ("G6-5f" "瑋")
	 ("G6-60" "剗")
	 ("G6-61" "划")
	 ("G6-62" "𨫤")
	 ("G6-63" "噶")
	 ("G6-64" "螠")
	 ("G6-65" "丢")
	 ("G6-66" "瘭")
	 ("G6-67" "虁")
	 ("G6-68" "鮸")
	 ("G6-69" "鬐")
	 ("G6-6a" "閩")
	 ("G6-6b" "鄴")
	 ("G6-6c" "帮")
	 ("G6-6d" "硨")
	 ("G6-6e" "磲")
	 ("G6-6f" "晷")
	 ("G6-70" "旈")
	 ("G6-71" "嘎")
	 ("G6-72" "犛")
	 ("G6-73" "墩")
	 ("G6-74" "鴲")
	 ("G6-75" "瑇")
	 ("G6-76" "駃")
	 ("G6-77" "騠")
	 ("G6-78" "瓤")
	 ("G6-79" "汴")
	 ("G6-7a" "炕")
	 ("G6-7b" "訢")
	 ("G6-7c" "紽")
	 ("G6-7d" "簎")
	 ("G6-7e" "厴")
	 ("G6-80" "躕")
	 ("G6-81" "漳")
	 ("G6-82" "雞")
	 ("G6-83" "鈹")
	 ("G6-84" "玢")
	 ("G6-85" "蘑")
	 ("G6-86" "邕")
	 ("G6-87" "媧")
	 ("G6-88" "唵")
	 ("G6-89" "鮞")
	 ("G6-8a" "蚜")
	 ("G6-8b" "跑")
	 ("G6-8c" "拼")
	 ("G6-8d" "稃")
	 ("G6-8e" "麬")
	 ("G6-8f" "⿰審阝")
	 ("G6-90" "鷴")
	 ("G6-91" "翨")
	 ("G6-92" "㮶")
	 ("G6-93" "鍱")
	 ("G6-94" "褲")
	 ("G6-95" "苆")
	 ("G6-96" "跆")
	 ("G6-97" "濰")
	 ("G6-98" "癮")
	 ("G6-99" "鄞")
	 ("G6-9a" "沅")
	 ("G6-9b" "犎")
	 ("G6-9c" "漳")
	 ("G6-9d" "淄")
	 ("G6-9e" "殭")
	 ("G6-9f" "[ハ・]")
         ;; 見出し用外字
	 ("G9-23" "#") 
	 ("G9-2f" "/")
	 ("G9-3c" "<")
	 ("G9-3d" "‘")
	 ("G9-3e" ">")
	 ("G9-5c" "[aa￣]")
	 ("G9-5e" "Č")
	 ("G9-5f" "Ḥ")
	 ("G9-60" "Ł")
	 ("G9-7b" "Я")
	 ("G9-7c" "Ṭ")
	 ("G9-7d" "Ẑ")
	 ("G9-7e" "ā")
	 ("G9-82" "ă")
	 ("G9-83" "ą")
	 ("G9-85" "…")
	 ("G9-86" "c")
	 ("G9-87" "d")
	 ("G9-88" "ē")
	 ("G9-89" "ě")
	 ("G9-8a" "ę")
	 ("G9-8b" "ǧ")
	 ("G9-8c" "ğ")
	 ("G9-91" "ḥ")
	 ("G9-92" "ī")
	 ("G9-93" "“")
	 ("G9-94" "”")
	 ("G9-95" "ĩ")
	 ("G9-96" "ł")
	 ("G9-97" "ň")
	 ("G9-98" "ǒ")
	 ("G9-99" "ō")
	 ("G9-9a" "ø")
	 ("G9-9b" "ř")
	 ("G9-9c" "š")
	 ("G9-9f" "ş")
	 ("G9-a1" "ṣ")
	 ("G9-a2" "ţ")
	 ("G9-a3" "£")
	 ("G9-a4" "ṭ")
	 ("G9-a6" "ũ")
	 ("G9-a7" "ū")
	 ("G9-a8" "ŭ")
	 ("G9-a9" "ů")
	 ("G9-aa" "ū́")
	 ("G9-ab" "ẓ")
	 ("G9-ac" "ǅ")
	 ("G9-ad" "-")
	 ("G9-ae" "°")
	 ("G9-af" "″")
	 ("G9-b0" "θ")
	 ("G9-b1" "χ")
	 ("G9-b2" "ǐ")
	 ("G9-b7" "￥")
	 ("G9-bd" "Û")
	 ("G9-be" "Š")
	 ("G9-bf" "¿")
	 ("G9-c0" "À")
	 ("G9-c1" "Á")
	 ("G9-c5" "Å")
	 ("G9-c6" "Æ")
	 ("G9-c7" "Ç")
	 ("G9-c8" "È")
	 ("G9-c9" "É")
	 ("G9-cc" "Ì")
	 ("G9-cd" "Í")
	 ("G9-ce" "Î")
	 ("G9-d2" "Ò")
	 ("G9-d3" "Ó")
	 ("G9-d6" "Ö")
	 ("G9-d7" "×")
	 ("G9-d9" "Ù")
	 ("G9-da" "Ú")
	 ("G9-dc" "Ü")
	 ("G9-dd" "Ý")
	 ("G9-df" "ß")
	 ("G9-e0" "à")
	 ("G9-e1" "á")
	 ("G9-e2" "â")
	 ("G9-e3" "ã") 
	 ("G9-e4" "ä")
	 ("G9-e5" "å")
	 ("G9-e6" "æ")
	 ("G9-e7" "ç")
	 ("G9-e8" "è")
	 ("G9-e9" "é")
	 ("G9-ea" "ê")
	 ("G9-eb" "ë")
	 ("G9-ec" "ì")
	 ("G9-ed" "í")
	 ("G9-ee" "î")
	 ("G9-ef" "ï")
	 ("G9-f1" "ñ")
	 ("G9-f2" "ò")
	 ("G9-f3" "ó")
	 ("G9-f4" "ô")
	 ("G9-f5" "õ")
	 ("G9-f6" "ö")
	 ("G9-f9" "ù")
	 ("G9-fa" "ú")
	 ("G9-fb" "û")
	 ("G9-fc" "ü")
	 ("G9-fd" "ý")
	 ("G9-ff" "ÿ"))))

  (defconst srd-gaiji-table
    (lookup-new-gaiji-table
     encoded-srd-gaiji-table)))

(defun srd-arrange-structure (entry)
  (goto-char (point-min))
  (if (looking-at "□ ")
      (delete-region (match-beginning 0) (match-end 0)))
  (if (looking-at "[^\[\n]*")
      (lookup-make-region-heading (match-beginning 0) (match-end 0) 1))

  (goto-char (point-min))
  (while (re-search-forward "\\[[^]]*\\]" nil t)
    (put-text-property (match-beginning 0)
		       (match-end 0) 'face ipaface))

  (goto-char (point-min))
  (while (re-search-forward "^[ ■].*\n" nil t)
    (lookup-make-region-heading (match-beginning 0) (match-end 0)
				(if (eq (char-after (match-beginning 0)) ? )
				    6 2)))
  )

(setq lookup-support-options
      (list :arranges '((structure srd-arrange-structure))
	    :gaiji-regexp  "<\\(G[0-9]-[0-9a-f][0-9a-f]\\)>"
	    :gaiji-table   srd-gaiji-table
            :query-filter 'lookup-query-filter-stem-english))

;;; srd.el ends here