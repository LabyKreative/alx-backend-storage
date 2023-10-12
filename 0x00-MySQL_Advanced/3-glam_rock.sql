-- This SQL script lists all bands with Glam rock as their main style, ranked by their longevity.
SELECT band_name, 
       YEAR(2022) - CAST(SUBSTRING_INDEX(lifespan, '-', 1) AS INT) AS lifespan
FROM metal_bands
WHERE style = 'Glam rock'
ORDER BY lifespan DESC;
