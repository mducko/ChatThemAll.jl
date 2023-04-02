using ChatThemAll
using Documenter

DocMeta.setdocmeta!(ChatThemAll, :DocTestSetup, :(using ChatThemAll); recursive=true)

makedocs(;
    modules=[ChatThemAll],
    authors="azzaare <jf@baffier.fr> and contributors",
    repo="https://github.com/Azzaare/ChatThemAll.jl/blob/{commit}{path}#{line}",
    sitename="ChatThemAll.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Azzaare.github.io/ChatThemAll.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Azzaare/ChatThemAll.jl",
    devbranch="main",
)
