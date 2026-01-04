using Plots
gr()

function deep_space_singularity()
    n_disk = 7000
    n_jets = 2000

    # Accretion Disk Initialization
    theta = rand(n_disk) .* 2π
    radius = 2.5 .+ rand(n_disk) .* 5.5
    pos_disk = [radius .* cos.(theta) radius .* sin.(theta) .* 0.4]
    vel_disk = [-sin.(theta) .* 0.12 cos.(theta) .* 0.12]

    # Relativistic Jets Initialization
    pos_jets = (rand(n_jets, 2) .- 0.5)
    pos_jets[:, 1] .*= 0.8
    pos_jets[:, 2] .*= 15.0
    vel_jets = zeros(n_jets, 2)
    vel_jets[:, 2] .= sign.(pos_jets[:, 2]) .* 0.3

    while true
        # Update Disk Physics
        for i in 1:n_disk
            r_sq = pos_disk[i, 1]^2 + pos_disk[i, 2]^2
            d = sqrt(r_sq)
            gravity = 0.1 / (r_sq + 0.05)
            vel_disk[i, 1] -= gravity * (pos_disk[i, 1] / d)
            vel_disk[i, 2] -= gravity * (pos_disk[i, 2] / d)
            pos_disk[i, 1] += vel_disk[i, 1]
            pos_disk[i, 2] += vel_disk[i, 2]

            if d < 0.7 || d > 12.0
                a = rand() * 2π
                new_r = 7.0 + rand() * 3.0
                pos_disk[i, :] = [cos(a) * new_r, sin(a) * new_r * 0.4]
                vel_disk[i, :] = [-sin(a) * 0.18, cos(a) * 0.18]
            end
        end

        # Update Jets Physics
        for j in 1:n_jets
            pos_jets[j, 2] += vel_jets[j, 2]
            pos_jets[j, 1] += (rand() - 0.5) * 0.05
            if abs(pos_jets[j, 2]) > 10.0
                pos_jets[j, :] = [(rand() - 0.5) * 0.5, (rand() - 0.5) * 1.0]
            end
        end

        # Final Render
        p = scatter(pos_disk[:, 1], pos_disk[:, 2],
            zcolor=1 ./ sqrt.(sum(pos_disk .^ 2, dims=2)),
            m=(:pixel, 1, 0.08),
            c=:heat,
            bg=:black,
            xlims=(-10, 10), ylims=(-10, 10),
            axis=false, legend=false, aspect_ratio=:equal)

        scatter!(pos_jets[:, 1], pos_jets[:, 2],
            m=(:pixel, 1, 0.05),
            c=:ice,
            alpha=0.2)

        scatter!([0], [0], markersize=55, color=:black, markerstrokewidth=0)

        display(p)
        sleep(0.0001)
    end
end

deep_space_singularity()