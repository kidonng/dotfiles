" https://github.com/pangloss/vim-javascript/blob/585ad542834fd3d9e47e0ef59abafd69c696c80d/syntax/javascript.vim#L30
syntax    match tsFuncCall              /\<\K\k*\ze\s*(/ containedin=typescriptIdentifierName,typescriptProp

highlight link  tsFuncCall              jsFuncCall
" These are mistakenly (?) linked to Function
highlight link  typescriptInterfaceName Special
highlight link  typescriptMember 	    Special

" string collect 'highlight link '(rg --only-matching --no-filename 'typescript\w+Method' | uniq)' tsFuncCall'
highlight link typescriptDOMEventTargetMethod tsFuncCall
highlight link typescriptDOMEventMethod tsFuncCall
highlight link typescriptStringStaticMethod tsFuncCall
highlight link typescriptStringMethod tsFuncCall
highlight link typescriptBOMWindowMethod tsFuncCall
highlight link typescriptDOMFormMethod tsFuncCall
highlight link typescriptObjectStaticMethod tsFuncCall
highlight link typescriptObjectMethod tsFuncCall
highlight link typescriptGeolocationMethod tsFuncCall
highlight link typescriptGlobalMethod tsFuncCall
highlight link typescriptDOMStorageMethod tsFuncCall
highlight link typescriptJSONStaticMethod tsFuncCall
highlight link typescriptBOMLocationMethod tsFuncCall
highlight link typescriptReflectMethod tsFuncCall
highlight link typescriptSymbolStaticMethod tsFuncCall
highlight link typescriptBOMNavigatorMethod tsFuncCall
highlight link typescriptServiceWorkerMethod tsFuncCall
highlight link typescriptConsoleMethod tsFuncCall
highlight link typescriptES6SetMethod tsFuncCall
highlight link typescriptPromiseStaticMethod tsFuncCall
highlight link typescriptPromiseMethod tsFuncCall
highlight link typescriptDOMNodeMethod tsFuncCall
highlight link typescriptSubtleCryptoMethod tsFuncCall
highlight link typescriptCryptoMethod tsFuncCall
highlight link typescriptDOMDocMethod tsFuncCall
highlight link typescriptPaymentMethod tsFuncCall
highlight link typescriptPaymentResponseMethod tsFuncCall
highlight link typescriptRegExpMethod tsFuncCall
highlight link typescriptBOMHistoryMethod tsFuncCall
highlight link typescriptIntlMethod tsFuncCall
highlight link typescriptES6MapMethod tsFuncCall
highlight link typescriptNumberStaticMethod tsFuncCall
highlight link typescriptNumberMethod tsFuncCall
highlight link typescriptGlobalMethod tsFuncCall
highlight link typescriptHeadersMethod tsFuncCall
highlight link typescriptRequestMethod tsFuncCall
highlight link typescriptResponseMethod tsFuncCall
highlight link typescriptFunctionMethod tsFuncCall
highlight link typescriptDateStaticMethod tsFuncCall
highlight link typescriptDateMethod tsFuncCall
highlight link typescriptXHRMethod tsFuncCall
highlight link typescriptEncodingMethod tsFuncCall
highlight link typescriptMathStaticMethod tsFuncCall
highlight link typescriptURLStaticMethod tsFuncCall
highlight link typescriptFileMethod tsFuncCall
highlight link typescriptFileReaderMethod tsFuncCall
highlight link typescriptFileListMethod tsFuncCall
highlight link typescriptBlobMethod tsFuncCall
highlight link typescriptURLStaticMethod tsFuncCall
highlight link typescriptArrayStaticMethod tsFuncCall
highlight link typescriptArrayMethod tsFuncCall
highlight link typescriptServiceWorkerMethod tsFuncCall
highlight link typescriptCacheMethod tsFuncCall
