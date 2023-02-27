using KD232
using Test
using Latexify, LaTeXStrings, Weave

@testset "Weave" begin
    set_chunk_defaults!(:echo => false)

    weave(normpath(@__DIR__, "..", "src", "KD232_nomenclature.jl"); doctype = "md2pdf", out_path = normpath(@__DIR__, "..", "KD232_nomenclature.pdf"))
    rm(normpath(@__DIR__, "..", "KD232_nomenclature.aux"))
    rm(normpath(@__DIR__, "..", "KD232_nomenclature.log"))
    rm(normpath(@__DIR__, "..", "KD232_nomenclature.out"))
    rm(normpath(@__DIR__, "..", "KD232_nomenclature.tex"))
    @test isfile(normpath(@__DIR__, "..", "KD232_nomenclature.pdf"))

    weave(normpath(@__DIR__, "..", "src", "KD232_equations.jl"); doctype = "md2pdf", out_path = normpath(@__DIR__, "..", "KD232_equations.pdf"))
    rm(normpath(@__DIR__, "..", "KD232_equations.aux"))
    rm(normpath(@__DIR__, "..", "KD232_equations.log"))
    rm(normpath(@__DIR__, "..", "KD232_equations.out"))
    rm(normpath(@__DIR__, "..", "KD232_equations.tex"))
    @test isfile(normpath(@__DIR__, "..", "KD232_equations.pdf"))
end
