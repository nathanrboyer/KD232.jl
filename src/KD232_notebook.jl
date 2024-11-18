### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# ╔═╡ 2e6b3627-77ab-4758-bf45-324d9adb8868
# ╠═╡ skip_as_script = true
#=╠═╡
begin
	import Pkg
	Pkg.activate(Base.current_project(@__DIR__))
	Pkg.instantiate()
	Text("Project environment is active.")
end
  ╠═╡ =#

# ╔═╡ a268a8f0-a394-11ef-247d-2994c2d46cce
using Latexify, LaTeXStrings

# ╔═╡ 71449ab9-4daf-40b1-8972-15aa685adf43
md"""
### Verification
These equations last checked to ASME BPVC **2023 Edition**.  \
*Nathan Boyer -- 11/18/2024*
"""

# ╔═╡ 6c1243b4-3693-4e12-a0ee-00d7087776f9
md"# KD-232 Equations"

# ╔═╡ daf0d138-f63c-4ee7-ac27-5177abddff0f
md"### KD-232.1"

# ╔═╡ 8e5b6daa-dce6-424f-9d65-3881991a6944
md"### KD-232.2"

# ╔═╡ 22ac1256-f7f2-409d-a122-530f05b44eed
md"### KD-232.3"

# ╔═╡ 7673211f-024e-419d-8408-22c7be0fa219
md"### KD-232.4"

# ╔═╡ a43cd49c-a389-4595-a8b8-ee7137d61296
md"### KD-232.5"

# ╔═╡ e76a9574-08c6-49b9-8f1b-4b3f7890dd89
md"### KD-232.6"

# ╔═╡ eeffaf6f-45ad-4161-b9d9-9b9cdead1c51
md"### Unlabeled Equations"

# ╔═╡ 8a9e035c-e722-42d7-be79-d963bdb86698
md"# KD-232 Nomenclature"

# ╔═╡ 97481830-55a3-4368-93a3-434a0cdf911a
md"""
``ϵ_{peq}`` = total equivalent plastic strain

``e`` = 2.7183, approximate value of the base of the natural logarithm

``El`` = minimum specified elongation, %

``ϵ_{Lk}`` = maximum permitted local total equivalent plastic strain at any point at the kth load increment

``ϵ_{Lu}`` = maximum of ``m_2``, ``m_3``, and ``m_4``

``m_2`` = value calculated from Table KM-620

``m_3`` = value calculated from Table KM-620

``m_4`` = value calculated from Table KM-620

``m_5`` = value listed in Table KM-620

``R`` = ``Sy/Su``

``RA`` = minimum specified reduction of area, %

``σ_{1k}`` = principal stress in the "1" direction at the point of interest for the kth load increment

``σ_{2k}`` = principal stress in the "2" direction at the point of interest for the kth load increment

``σ_{3k}`` = principal stress in the "3" direction at the point of interest for the kth load increment

``σ_{ek}`` = equivalent stress at the point of interest

``S_y`` = yield strength at the analysis temperature (see Section II, Part D, Subpart 1, Table Y-1)

``S_u`` = tensile strength at the analysis temperature (see Section II, Part D, Subpart 1, Table U)

``D_{ϵk}`` = strain limit damage for the kth loading condition

``Δϵ_{peqk}`` = equivalent plastic strain range for the kth loading condition or cycle

``Δϵ_{p11k}`` = plastic strain range in the "11" direction for the kth loading condition or cycle

``Δϵ_{p22k}`` = plastic strain range in the "22" direction for the kth loading condition or cycle

``Δϵ_{p33k}`` = plastic strain range in the "33" direction for the kth loading condition or cycle

``Δϵ_{p12k}`` = plastic strain range in the "12" direction for the kth loading condition or cycle

``Δϵ_{p23k}`` = plastic strain range in the "23" direction for the kth loading condition or cycle

``Δϵ_{p31k}`` = plastic strain range in the "31" direction for the kth loading condition or cycle

``D_{ϵform}`` = damage occurring during forming at the location in the component under consideration

``ϵ_{cf}`` = forming strain at the location in the component under consideration

"""

# ╔═╡ a6e742f1-6869-4770-a299-8a2d16f404f4
md"# Appendix"

# ╔═╡ 776d7b87-68c3-4e27-8d42-8b5278119e3d
"Removes the function argument list from the latex equation,
so equations are shorter and better match the source text."
function remove_arguments(s::LaTeXString)
    r = r"\\left\(.*?\\right\)"
    return LaTeXString(replace(s, r=>"", count=1))
end

# ╔═╡ 2d4427af-4d55-4d4a-820b-6c4068bc899c
remove_arguments(
	@latexrun σ_e(σ_1, σ_2, σ_3) = (
	    1 / sqrt(2) * (
	        (σ_1 - σ_2)^2
	        + (σ_2 - σ_3)^2
	        + (σ_3 - σ_1)^2
	    )^0.5
	)
)

# ╔═╡ 2d5b1763-22a1-42c1-96e5-2d00c0468616
remove_arguments(
	@latexrun ϵ_Lk(ϵ_Lu, m_5, m_2, σ_1k, σ_2k, σ_3k, σ_ek) = (
	    ϵ_Lu * (
	        exp(
	            -m_5 / (1 + m_2) * (
	                (σ_1k + σ_2k + σ_3k) / (3 * σ_ek) - 1 / 3
	            )
	        )
	    )
	)
)

# ╔═╡ 9a3dc937-431f-4a99-aa36-d14972f4ae0f
remove_arguments(
	@latexrun Δϵ_peqk(Δϵ_p11k, Δϵ_p22k, Δϵ_p33k, Δϵ_p12k, Δϵ_p23k, Δϵ_p31k) = (
	    sqrt(2) / 3 * (
	        (Δϵ_p11k - Δϵ_p22k)^2
	        + (Δϵ_p22k - Δϵ_p33k)^2
	        + (Δϵ_p33k - Δϵ_p11k)^2
	        + 1.5 * (Δϵ_p12k^2 + Δϵ_p23k^2 + Δϵ_p31k^2)
	    )^0.5
	)
)

# ╔═╡ 72142f97-bf9f-4d15-9be3-3a731ca9f41d
remove_arguments(
	@latexrun D_ϵk(Δϵ_peqk, ϵ_Lk) = Δϵ_peqk / ϵ_Lk
)

# ╔═╡ 944061a3-3d72-4142-b048-5335be880297
remove_arguments(
	@latexrun D_ϵform(ϵ_cf, ϵ_Lu, m_5, m_2) = (
	    ϵ_cf / (
	        ϵ_Lu * exp(
	            -(1/3) * ( # unclear if this should be * or /
	                m_5 / (1 + m_2)
	            )
	        )
	    )
	)
)

# ╔═╡ 96180b26-c4e1-41d9-a214-a7e22b2a6784
remove_arguments(
	@latexrun D_ϵt(D_ϵform, D_ϵ) = D_ϵform + D_ϵ
)

# ╔═╡ f0772607-5a23-447b-bad6-8dd948247a34
remove_arguments(
	@latexrun ϵ_Lu(m_2, m_3, m_4) = max(m_2, m_3, m_4)
)

# ╔═╡ 50fb3120-8a54-42c1-8cd6-ab940a7e8111
remove_arguments(
	@latexrun R(S_y, S_u) = S_y / S_u
)

# ╔═╡ Cell order:
# ╟─71449ab9-4daf-40b1-8972-15aa685adf43
# ╟─6c1243b4-3693-4e12-a0ee-00d7087776f9
# ╟─daf0d138-f63c-4ee7-ac27-5177abddff0f
# ╟─2d4427af-4d55-4d4a-820b-6c4068bc899c
# ╟─8e5b6daa-dce6-424f-9d65-3881991a6944
# ╟─2d5b1763-22a1-42c1-96e5-2d00c0468616
# ╟─22ac1256-f7f2-409d-a122-530f05b44eed
# ╟─9a3dc937-431f-4a99-aa36-d14972f4ae0f
# ╟─7673211f-024e-419d-8408-22c7be0fa219
# ╟─72142f97-bf9f-4d15-9be3-3a731ca9f41d
# ╟─a43cd49c-a389-4595-a8b8-ee7137d61296
# ╟─944061a3-3d72-4142-b048-5335be880297
# ╟─e76a9574-08c6-49b9-8f1b-4b3f7890dd89
# ╟─96180b26-c4e1-41d9-a214-a7e22b2a6784
# ╟─eeffaf6f-45ad-4161-b9d9-9b9cdead1c51
# ╟─f0772607-5a23-447b-bad6-8dd948247a34
# ╟─50fb3120-8a54-42c1-8cd6-ab940a7e8111
# ╟─8a9e035c-e722-42d7-be79-d963bdb86698
# ╟─97481830-55a3-4368-93a3-434a0cdf911a
# ╟─a6e742f1-6869-4770-a299-8a2d16f404f4
# ╟─2e6b3627-77ab-4758-bf45-324d9adb8868
# ╠═a268a8f0-a394-11ef-247d-2994c2d46cce
# ╟─776d7b87-68c3-4e27-8d42-8b5278119e3d
