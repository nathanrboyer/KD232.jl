#' ---
#' title : KD-232 Equations
#' ---
using Latexify, LaTeXStrings

#+ results="hidden"
"Removes the function argument list from the latex equation,
so equations are shorter and better match the source text."
function remove_arguments(s::LaTeXString)
    r = r"\\left\(.*?\\right\)"
    return LaTeXString(replace(s, r=>"", count=1))
end

#' # KD-232.1
s = @latexrun σ_e(σ_1, σ_2, σ_3) = (
    1 / sqrt(2) * (
        (σ_1 - σ_2)^2
        + (σ_2 - σ_3)^2
        + (σ_3 - σ_1)^2
    )^0.5
)
remove_arguments(s)

#' # KD-232.2
s = @latexrun ϵ_Lk(ϵ_Lu, m_5, m_2, σ_1k, σ_2k, σ_3k, σ_ek) = (
    ϵ_Lu * (
        exp(
            -m_5 / (1 + m_2) * (
                (σ_1k + σ_2k + σ_3k) / (3 * σ_ek) - 1 / 3
            )
        )
    )
)
remove_arguments(s)

#' # KD-232.3
s = @latexrun Δϵ_peqk(Δϵ_p11k, Δϵ_p22k, Δϵ_p33k, Δϵ_p12k, Δϵ_p23k, Δϵ_p31k) = (
    sqrt(2) / 3 * (
        (Δϵ_p11k - Δϵ_p22k)^2
        + (Δϵ_p22k - Δϵ_p33k)^2
        + (Δϵ_p33k - Δϵ_p11k)^2
        + 1.5 * (Δϵ_p12k^2 + Δϵ_p23k^2 + Δϵ_p31k^2)
    )^0.5
)
# KD-232.3 is too long to fit on one page, so it must be split for rendering.
(s1, s2) = split(remove_arguments(s), "= ")
s1 = LaTeXString(s1 * "=\$")

#'
s2 = LaTeXString("\$" * s2)

#' # KD-232.4
s = @latexrun D_ϵk(Δϵ_peqk, ϵ_Lk) = Δϵ_peqk / ϵ_Lk
remove_arguments(s)

#' # KD-232.5
s = @latexrun D_ϵform(ϵ_cf, ϵ_Lu, m_5, m_2) = (
    ϵ_cf / (
        ϵ_Lu * exp(
            -(1/3) * ( # unclear if this should be * or /
                m_5 / (1 + m_2)
            )
        )
    )
)
remove_arguments(s)

#' # KD-232.6
s = @latexrun D_ϵt(D_ϵform, D_ϵ) = D_ϵform + D_ϵ
remove_arguments(s)
