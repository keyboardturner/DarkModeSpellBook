local _, L = ...; -- Let's use the private table passed to every .lua 

local function defaultFunc(L, key)
 -- If this function was called, we have no localization for this key.
 -- We could complain loudly to allow localizers to see the error of their ways, 
 -- but, for now, just return the key as its own localization. This allows you to—avoid writing the default localization out explicitly.
 return key;
end
setmetatable(L, {__index=defaultFunc});

local LOCALE = GetLocale()

if LOCALE == "enUS" then
	-- The EU English game client also
	-- uses the US English locale code.
	L["Name"] = "Spell Text"
	L["NameTT"] = "Change the color of the spell text."
	L["Text"] = "Large Text"
	L["TextTT"] = "Change the color of the large text that contains the Class and Specialization."
	L["SubName"] = "Sub-Text"
	L["SubNameTT"] = "Change the color of the smaller text below the spell text that indicates a spell being passive or other certain conditions."
	L["Backplate_OnEnter"] = "Backplate Highlight"
	L["Backplate_OnEnterTT"] = "Change the color of the image textures behind spells and large text specifically when highlighted."
	L["Backplate_OnLeave"] = "Backplate Normal"
	L["Backplate_OnLeaveTT"] = "Change the color of the image textures behind spells and large text."
	L["Background"] = "Background"
	L["BackgroundTT"] = "Change the color of the background image texture."
	L["Bookmark"] = "Bookmark"
	L["BookmarkTT"] = "Change the color of the bookmark image texture."
	L["Border"] = "Separators"
	L["BorderTT"] = "Change the color of the separators image textures."
	L["PageText"] = "Page Number Text"
	L["PageTextTT"] = "Change the color of the page number text."
	L["FadeFrame"] = "Fade Spellbook When Moving"
	L["FadeFrameTT"] = "Toggles the fading functionality of the spellbook frame (this includes the Specialization and Talents frame)."
	L["HideButton"] = "Hide Spellbook Colors Button"
	L["HideButtonTT"] = "Hide the Spellbook Colors button. This can be toggled in the AddOn Compartment Frame on the minimap."

return end

if LOCALE == "esES" or LOCALE == "esMX" then
	-- Spanish translations go here

	L["Name"] = "Texto de Hechizo"
	L["NameTT"] = "Cambiar el color del texto del hechizo."
	L["Text"] = "Texto Grande"
	L["TextTT"] = "Cambiar el color del texto grande que contiene la Clase y Especialización."
	L["SubName"] = "Subtexto"
	L["SubNameTT"] = "Cambiar el color del texto más pequeño debajo del texto del hechizo que indica que un hechizo es pasivo o ciertas otras condiciones."
	L["Backplate_OnEnter"] = "Resaltado del Fondo"
	L["Backplate_OnEnterTT"] = "Cambiar el color de las texturas de imagen detrás de los hechizos y el texto grande específicamente cuando se resalta."
	L["Backplate_OnLeave"] = "Fondo Normal"
	L["Backplate_OnLeaveTT"] = "Cambiar el color de las texturas de imagen detrás de los hechizos y el texto grande."
	L["Background"] = "Fondo"
	L["BackgroundTT"] = "Cambiar el color de la textura de la imagen de fondo."
	L["Bookmark"] = "Marcador"
	L["BookmarkTT"] = "Cambiar el color de la textura de la imagen del marcador."
	L["Border"] = "Separadores"
	L["BorderTT"] = "Cambiar el color de las texturas de imagen de los separadores."
	L["PageText"] = "Texto del Número de Página"
	L["PageTextTT"] = "Cambiar el color del texto del número de página."
	L["FadeFrame"] = "Desvanecer el Libro de Hechizos al Moverse"
	L["FadeFrameTT"] = "Alterna la funcionalidad de desvanecimiento del marco del libro de hechizos (esto incluye el marco de Especialización y Talentos)."
	L["HideButton"] = "Ocultar Botón de Colores del Libro de Hechizos"
	L["HideButtonTT"] = "Ocultar el botón de Colores del Libro de Hechizos. Esto se puede alternar en el marco del compartimento del AddOn en el minimapa."

return end

if LOCALE == "deDE" then
	-- German translations go here

	L["Name"] = "Zaubertext"
	L["NameTT"] = "Ändere die Farbe des Zaubertexts."
	L["Text"] = "Großer Text"
	L["TextTT"] = "Ändere die Farbe des großen Texts, der die Klasse und Spezialisierung enthält."
	L["SubName"] = "Untertext"
	L["SubNameTT"] = "Ändere die Farbe des kleineren Texts unter dem Zaubertext, der anzeigt, ob ein Zauber passiv ist oder bestimmte andere Bedingungen erfüllt."
	L["Backplate_OnEnter"] = "Hervorhebung des Hintergrunds"
	L["Backplate_OnEnterTT"] = "Ändere die Farbe der Bildtexturen hinter den Zaubern und dem großen Text speziell bei Hervorhebung."
	L["Backplate_OnLeave"] = "Normaler Hintergrund"
	L["Backplate_OnLeaveTT"] = "Ändere die Farbe der Bildtexturen hinter den Zaubern und dem großen Text."
	L["Background"] = "Hintergrund"
	L["BackgroundTT"] = "Ändere die Farbe der Hintergrundbildtextur."
	L["Bookmark"] = "Lesezeichen"
	L["BookmarkTT"] = "Ändere die Farbe der Bildtextur des Lesezeichens."
	L["Border"] = "Trennlinien"
	L["BorderTT"] = "Ändere die Farbe der Bildtexturen der Trennlinien."
	L["PageText"] = "Seitennummertext"
	L["PageTextTT"] = "Ändere die Farbe des Seitennummertextes."
	L["FadeFrame"] = "Zauberbuch beim Bewegen ausblenden"
	L["FadeFrameTT"] = "Schaltet die Ausblendfunktion des Zauberbuchs ein/aus (einschließlich des Rahmens für Spezialisierungen und Talente)."
	L["HideButton"] = "Zauberbuchfarben-Button ausblenden"
	L["HideButtonTT"] = "Blendet den Button für Zauberbuchfarben aus. Dies kann im AddOn-Fachrahmen auf der Minikarte umgeschaltet werden."

return end

if LOCALE == "frFR" then
	-- French translations go here

	L["Name"] = "Texte du Sort"
	L["NameTT"] = "Changer la couleur du texte du sort."
	L["Text"] = "Texte Large"
	L["TextTT"] = "Changer la couleur du texte large qui contient la Classe et la Spécialisation."
	L["SubName"] = "Sous-Texte"
	L["SubNameTT"] = "Changer la couleur du texte plus petit sous le texte du sort qui indique si un sort est passif ou d'autres conditions spécifiques."
	L["Backplate_OnEnter"] = "Surlignage de Fond"
	L["Backplate_OnEnterTT"] = "Changer la couleur des textures d'image derrière les sorts et le texte large spécifiquement lors du surlignage."
	L["Backplate_OnLeave"] = "Fond Normal"
	L["Backplate_OnLeaveTT"] = "Changer la couleur des textures d'image derrière les sorts et le texte large."
	L["Background"] = "Arrière-plan"
	L["BackgroundTT"] = "Changer la couleur de la texture de l'image de fond."
	L["Bookmark"] = "Signet"
	L["BookmarkTT"] = "Changer la couleur de la texture de l'image du signet."
	L["Border"] = "Séparateurs"
	L["BorderTT"] = "Changer la couleur des textures d'image des séparateurs."
	L["PageText"] = "Texte du Numéro de Page"
	L["PageTextTT"] = "Changer la couleur du texte du numéro de page."
	L["FadeFrame"] = "Estomper le Grimoire en Déplaçant"
	L["FadeFrameTT"] = "Active/désactive la fonctionnalité d'estompage du cadre du grimoire (cela inclut le cadre des Spécialisations et Talents)."
	L["HideButton"] = "Cacher le Bouton des Couleurs du Grimoire"
	L["HideButtonTT"] = "Cacher le bouton des Couleurs du Grimoire. Cela peut être activé/désactivé dans le cadre du compartiment AddOn sur la minimap."

return end

if LOCALE == "itIT" then
	-- French translations go here

	L["Name"] = "Testo Incantesimo"
	L["NameTT"] = "Cambia il colore del testo dell'incantesimo."
	L["Text"] = "Testo Grande"
	L["TextTT"] = "Cambia il colore del testo grande che contiene la Classe e la Specializzazione."
	L["SubName"] = "Sotto-Text"
	L["SubNameTT"] = "Cambia il colore del testo più piccolo sotto il testo dell'incantesimo che indica se un incantesimo è passivo o altre determinate condizioni."
	L["Backplate_OnEnter"] = "Evidenziazione dello Sfondo"
	L["Backplate_OnEnterTT"] = "Cambia il colore delle texture dell'immagine dietro gli incantesimi e il testo grande specificamente quando evidenziato."
	L["Backplate_OnLeave"] = "Sfondo Normale"
	L["Backplate_OnLeaveTT"] = "Cambia il colore delle texture dell'immagine dietro gli incantesimi e il testo grande."
	L["Background"] = "Sfondo"
	L["BackgroundTT"] = "Cambia il colore della texture dell'immagine di sfondo."
	L["Bookmark"] = "Segnalibro"
	L["BookmarkTT"] = "Cambia il colore della texture dell'immagine del segnalibro."
	L["Border"] = "Separatori"
	L["BorderTT"] = "Cambia il colore delle texture dell'immagine dei separatori."
	L["PageText"] = "Testo del Numero di Pagina"
	L["PageTextTT"] = "Cambia il colore del testo del numero di pagina."
	L["FadeFrame"] = "Sfuma il Libro degli Incantesimi durante lo Spostamento"
	L["FadeFrameTT"] = "Attiva/disattiva la funzionalità di sfumatura del frame del libro degli incantesimi (questo include il frame di Specializzazione e Talenti)."
	L["HideButton"] = "Nascondi il Pulsante Colori del Libro degli Incantesimi"
	L["HideButtonTT"] = "Nascondi il pulsante Colori del Libro degli Incantesimi. Questo può essere attivato/disattivato nel frame del compartimento AddOn sulla minimappa."

return end

if LOCALE == "ptBR" then
	-- Brazilian Portuguese translations go here

	L["Name"] = "Texto do Feitiço"
	L["NameTT"] = "Altere a cor do texto do feitiço."
	L["Text"] = "Texto Grande"
	L["TextTT"] = "Altere a cor do texto grande que contém a Classe e a Especialização."
	L["SubName"] = "Subtexto"
	L["SubNameTT"] = "Altere a cor do texto menor abaixo do texto do feitiço que indica se um feitiço é passivo ou outras condições específicas."
	L["Backplate_OnEnter"] = "Destaque de Fundo"
	L["Backplate_OnEnterTT"] = "Altere a cor das texturas de imagem atrás dos feitiços e do texto grande especificamente quando destacado."
	L["Backplate_OnLeave"] = "Fundo Normal"
	L["Backplate_OnLeaveTT"] = "Altere a cor das texturas de imagem atrás dos feitiços e do texto grande."
	L["Background"] = "Fundo"
	L["BackgroundTT"] = "Altere a cor da textura da imagem de fundo."
	L["Bookmark"] = "Marcador"
	L["BookmarkTT"] = "Altere a cor da textura da imagem do marcador."
	L["Border"] = "Separadores"
	L["BorderTT"] = "Altere a cor das texturas de imagem dos separadores."
	L["PageText"] = "Texto do Número da Página"
	L["PageTextTT"] = "Altere a cor do texto do número da página."
	L["FadeFrame"] = "Esmaecer Grimório ao Mover-se"
	L["FadeFrameTT"] = "Alterna a funcionalidade de esmaecimento do quadro do grimório (isso inclui o quadro de Especialização e Talentos)."
	L["HideButton"] = "Ocultar Botão de Cores do Grimório"
	L["HideButtonTT"] = "Ocultar o botão de Cores do Grimório. Isso pode ser alternado no Quadro de Compartimento de AddOn no minimapa."

-- Note that the EU Portuguese WoW client also
-- uses the Brazilian Portuguese locale code.
return end

if LOCALE == "ruRU" then
	-- Russian translations go here

	L["Name"] = "Текст Заклинания"
	L["NameTT"] = "Изменить цвет текста заклинания."
	L["Text"] = "Большой Текст"
	L["TextTT"] = "Изменить цвет большого текста, содержащего Класс и Специализацию."
	L["SubName"] = "Подтекст"
	L["SubNameTT"] = "Изменить цвет меньшего текста под текстом заклинания, который указывает на пассивность заклинания или другие условия."
	L["Backplate_OnEnter"] = "Подсветка Фона"
	L["Backplate_OnEnterTT"] = "Изменить цвет текстур изображения за заклинаниями и большим текстом при их подсветке."
	L["Backplate_OnLeave"] = "Нормальный Фон"
	L["Backplate_OnLeaveTT"] = "Изменить цвет текстур изображения за заклинаниями и большим текстом."
	L["Background"] = "Фон"
	L["BackgroundTT"] = "Изменить цвет текстуры фонового изображения."
	L["Bookmark"] = "Закладка"
	L["BookmarkTT"] = "Изменить цвет текстуры изображения закладки."
	L["Border"] = "Разделители"
	L["BorderTT"] = "Изменить цвет текстур изображения разделителей."
	L["PageText"] = "Текст Номера Страницы"
	L["PageTextTT"] = "Изменить цвет текста номера страницы."
	L["FadeFrame"] = "Затухание Книги Заклинаний при Движении"
	L["FadeFrameTT"] = "Переключение функции затухания рамки книги заклинаний (включая рамку Специализаций и Талантов)."
	L["HideButton"] = "Скрыть Кнопку Цветов Книги Заклинаний"
	L["HideButtonTT"] = "Скрыть кнопку Цветов Книги Заклинаний. Это можно переключить в рамке раздела AddOn на миникарте."

return end

if LOCALE == "koKR" then
	-- Korean translations go here

	L["Name"] = "주문 텍스트"
	L["NameTT"] = "주문 텍스트의 색상을 변경합니다."
	L["Text"] = "큰 텍스트"
	L["TextTT"] = "직업 및 전문화가 포함된 큰 텍스트의 색상을 변경합니다."
	L["SubName"] = "부가 텍스트"
	L["SubNameTT"] = "주문 텍스트 아래에 있는 작은 텍스트의 색상을 변경하여 주문이 패시브 상태이거나 다른 특정 조건을 나타냅니다."
	L["Backplate_OnEnter"] = "배경 강조"
	L["Backplate_OnEnterTT"] = "강조될 때 주문 및 큰 텍스트 뒤의 이미지 텍스처의 색상을 변경합니다."
	L["Backplate_OnLeave"] = "일반 배경"
	L["Backplate_OnLeaveTT"] = "주문 및 큰 텍스트 뒤의 이미지 텍스처의 색상을 변경합니다."
	L["Background"] = "배경"
	L["BackgroundTT"] = "배경 이미지 텍스처의 색상을 변경합니다."
	L["Bookmark"] = "북마크"
	L["BookmarkTT"] = "북마크 이미지 텍스처의 색상을 변경합니다."
	L["Border"] = "구분선"
	L["BorderTT"] = "구분선 이미지 텍스처의 색상을 변경합니다."
	L["PageText"] = "페이지 번호 텍스트"
	L["PageTextTT"] = "페이지 번호 텍스트의 색상을 변경합니다."
	L["FadeFrame"] = "이동 시 주문서 창 사라짐"
	L["FadeFrameTT"] = "주문서 창(전문화 및 특성 창 포함)의 페이딩 기능을 켜거나 끕니다."
	L["HideButton"] = "주문서 색상 버튼 숨기기"
	L["HideButtonTT"] = "주문서 색상 버튼을 숨깁니다. 이것은 미니맵의 애드온 컴파트먼트 프레임에서 전환할 수 있습니다."

return end

if LOCALE == "zhCN" then
	-- Simplified Chinese translations go here

	L["Name"] = "法術文本"
	L["NameTT"] = "更改法術文本的顏色。"
	L["Text"] = "大文本"
	L["TextTT"] = "更改包含職業和專精的大文本的顏色。"
	L["SubName"] = "子文本"
	L["SubNameTT"] = "更改法術文本下方的較小文本的顏色，指示法術為被動或其他特定條件。"
	L["Backplate_OnEnter"] = "背景高亮"
	L["Backplate_OnEnterTT"] = "更改高亮時法術和大文本後面的圖像紋理顏色。"
	L["Backplate_OnLeave"] = "背景正常"
	L["Backplate_OnLeaveTT"] = "更改法術和大文本後面的圖像紋理顏色。"
	L["Background"] = "背景"
	L["BackgroundTT"] = "更改背景圖像紋理的顏色。"
	L["Bookmark"] = "書籤"
	L["BookmarkTT"] = "更改書籤圖像紋理的顏色。"
	L["Border"] = "分隔符"
	L["BorderTT"] = "更改分隔符圖像紋理的顏色。"
	L["PageText"] = "頁碼文本"
	L["PageTextTT"] = "更改頁碼文本的顏色。"
	L["FadeFrame"] = "移動時淡出法術書"
	L["FadeFrameTT"] = "切換法術書框架的淡出功能（包括專精和天賦框架）。"
	L["HideButton"] = "隱藏法術書顏色按鈕"
	L["HideButtonTT"] = "隱藏法術書顏色按鈕。可以在小地圖上的插件面板框架中切換。"

return end

if LOCALE == "zhTW" then
	-- Traditional Chinese translations go here

	L["Name"] = "法術文本"
	L["NameTT"] = "更改法術文本的顏色。"
	L["Text"] = "大文本"
	L["TextTT"] = "更改包含職業和專精的大文本的顏色。"
	L["SubName"] = "子文本"
	L["SubNameTT"] = "更改法術文本下方的較小文本的顏色，指示法術為被動或其他特定條件。"
	L["Backplate_OnEnter"] = "背景高亮"
	L["Backplate_OnEnterTT"] = "更改高亮時法術和大文本後面的圖像紋理顏色。"
	L["Backplate_OnLeave"] = "背景正常"
	L["Backplate_OnLeaveTT"] = "更改法術和大文本後面的圖像紋理顏色。"
	L["Background"] = "背景"
	L["BackgroundTT"] = "更改背景圖像紋理的顏色。"
	L["Bookmark"] = "書籤"
	L["BookmarkTT"] = "更改書籤圖像紋理的顏色。"
	L["Border"] = "分隔符"
	L["BorderTT"] = "更改分隔符圖像紋理的顏色。"
	L["PageText"] = "頁碼文本"
	L["PageTextTT"] = "更改頁碼文本的顏色。"
	L["FadeFrame"] = "移動時淡出法術書"
	L["FadeFrameTT"] = "切換法術書框架的淡出功能（包括專精和天賦框架）。"
	L["HideButton"] = "隱藏法術書顏色按鈕"
	L["HideButtonTT"] = "隱藏法術書顏色按鈕。可以在小地圖上的插件面板框架中切換。"

return end
