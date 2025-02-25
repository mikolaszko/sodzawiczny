module Data.CtagsReact exposing (content)

import Html exposing (Html, a, article, br, code, div, em, h1, h2, img, li, ol, p, span, strong, text)
import Html.Attributes exposing (alt, attribute, class, href, id, rel, src, target)


content : Html msg
content =
    article [ class "flex flex-col items-start justify-center w-full max-w-2xl mx-auto mb-16" ]
        [ h1 [ class "mb-4 text-3xl font-bold tracking-tight text-black md:text-5xl dark:text-white" ]
            [ text "Productive component navigation in Neovim" ]
        , div [ class "flex flex-col items-start justify-between w-full mt-2 md:flex-row md:items-center" ]
            [ div [ class "flex items-center" ]
                [ img [ alt "Mikołaj Sodzawiczny", class "rounded-full", attribute "data-darkreader-inline-color" "", attribute "data-nimg" "1", attribute "decoding" "async", attribute "height" "24", attribute "loading" "lazy", attribute "sizes" "20vw", src "/_next/image?url=%2Favatar.png&w=3840&q=75", attribute "srcset" "/_next/image?url=%2Favatar.png&w=128&q=75 128w, /_next/image?url=%2Favatar.png&w=256&q=75 256w, /_next/image?url=%2Favatar.png&w=384&q=75 384w, /_next/image?url=%2Favatar.png&w=640&q=75 640w, /_next/image?url=%2Favatar.png&w=750&q=75 750w, /_next/image?url=%2Favatar.png&w=828&q=75 828w, /_next/image?url=%2Favatar.png&w=1080&q=75 1080w, /_next/image?url=%2Favatar.png&w=1200&q=75 1200w, /_next/image?url=%2Favatar.png&w=1920&q=75 1920w, /_next/image?url=%2Favatar.png&w=2048&q=75 2048w, /_next/image?url=%2Favatar.png&w=3840&q=75 3840w", attribute "style" "color: transparent; --darkreader-inline-color: transparent;", attribute "width" "24" ]
                    []
                , p [ class "ml-2 text-sm text-gray-700 dark:text-gray-300" ]
                    [ text "Mikołaj Sodzawiczny / January 23, 2023" ]
                ]
            , p [ class "mt-2 text-sm text-gray-600 dark:text-green-leaf min-w-32 md:mt-0" ]
                [ text "3 min read" ]
            ]
        , div [ class "w-full mt-4 prose dark:prose-dark max-w-none" ]
            [ p []
                [ text "Neovim is definitely the hottest PDE (personal development environment) out there. We are living through screen-based text editor renaissance so there's a lot of buzz around editors like Neovim and Helix (build in Rust!!1!). Heck, even many non-technical people are starting to use neovim as their note taking app of choice."
                , br []
                    []
                , text "In this blog post I'll talk about the issue that really bothered me when using React and nvim - going to jsx components "
                , strong []
                    [ text "fast" ]
                ]
            , p []
                [ img [ alt "screenshot of telescope helptags", src "https://neovim.io/images/showcase/telescope_helptags.png" ]
                    []
                ]
            , h2 [ id "what-was-the-issue" ]
                [ a [ class "anchor", href "/blog/component-navigation-nvim#what-was-the-issue" ]
                    [ span [ class "icon icon-link" ]
                        []
                    ]
                , text "What was the issue?"
                ]
            , p []
                [ text "As a somebody who used to work/works (depending on the project) in vscode I must admit that I like some of its functionality. Like my beloved Ctrl + Left-Click - really simple and to the point. It will bring you to the function/variable/method definition but in React it also serves a purpose of redirecting you to a JSX component. It makes debugging and navigation without search tools great. I usually work in codebases with thousands of components so it's really handy."
                , br []
                    []
                , text "This approach even works in Neovim "
                , strong []
                    [ text "BUT" ]
                , text "I didn't want to rely on my mouse no more. You can do a hacky way and do a shortcut that will do the mentioned Ctrl + Left-Click but it seemed like swimming against the current and it would sometimes not work properly."
                ]
            , h2 [ id "solution-generating-tag-files-for-source-code" ]
                [ a [ class "anchor", href "/blog/component-navigation-nvim#solution-generating-tag-files-for-source-code" ]
                    [ span [ class "icon icon-link" ]
                        []
                    ]
                , text "Solution? Generating tag files for source code"
                ]
            , p []
                [ text "I am not planning to go into great detail about file tags because I am not an "
                , a [ href "https://en.wikipedia.org/wiki/Ken_Arnold", rel "noopener noreferrer", target "_blank" ]
                    [ text "expert" ]
                , text "but drawing on my limited knowledge I can only say that index (or tag) files are a computer file with an index that allows easy access to records. (usually methods, objects, function etc.)."
                , br []
                    []
                , text "So to solve my component navigation problem I used "
                , a [ href "https://ctags.io/", rel "noopener noreferrer", target "_blank" ]
                    [ text "ctags" ]
                , text ". Easy to use CLI tool that will generate tag files for source code."
                ]
            , h2 [ id "steps-i-took" ]
                [ a [ class "anchor", href "/blog/component-navigation-nvim#steps-i-took" ]
                    [ span [ class "icon icon-link" ]
                        []
                    ]
                , text "Steps I took"
                ]
            , ol []
                [ li []
                    [ text "I installed universal-ctags (maintained version of ctags) from snap (I know, gross) using"
                    , br []
                        []
                    , code []
                        [ text "sudo snap install universal-ctags" ]
                    ]
                , li []
                    [ text "I run this command in the project's frontend directory (you can run it wherever but in the relevent directory/file). NOTE: -R stands for recursive - for directories"
                    , br []
                        []
                    , code []
                        [ text "ctags -R <source_file>" ]
                    ]
                , li []
                    [ text "Started moving "
                    , em []
                        [ strong []
                            [ text "blazingly" ]
                        ]
                    , text "fast using "
                    , code []
                        [ text "Ctrl + ]" ]
                    ]
                ]
            , p []
                [ text "My initial thought was that I didn't want to push tags file to the org's repo but it actually got ignored automatically. If it doesn't do it for you you can probably set up a workaround with git config." ]
            , h2 [ id "summary" ]
                [ a [ class "anchor", href "/blog/component-navigation-nvim#summary" ]
                    [ span [ class "icon icon-link" ]
                        []
                    ]
                , text "Summary"
                ]
            , p []
                [ text "It's my first tutorial-ish post so I don't know if it was concise enough but well, hope it helped someone :)" ]
            ]
        , div [ class "mt-8 text-sm text-gray-700 dark:text-gray-300" ]
            [ a [ href "https://fosstodon.org/@mikolaszko", rel "me noopener noreferrer", target "_blank" ]
                [ text "Discuss on Mastodon" ]
            ]
        ]
