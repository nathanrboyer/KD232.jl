using Pkg
Pkg.activate(normpath(joinpath(@__FILE__, "..")))
using Pluto
Pluto.run(notebook=normpath(joinpath(@__FILE__, "..", "..", "src","KD232_notebook.jl")))
