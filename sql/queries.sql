-- Preço médio/mediano por bairro (neighbourhood_group)
SELECT
    neighbourhood_group,
    ROUND(AVG(price), 2) AS avg_price,
    MEDIAN(price) AS median_price,
    COUNT(*) AS listings
FROM df
GROUP BY neighbourhood_group
ORDER BY median_price DESC;

-- Hosts com muitos imóveis (10+) vs demais: reviews e disponibilidade médias
-- Hipótese: hosts com muitos listings tem menos reviews e ficam disponíveis
-- a maior parte do ano, sinal de imóveis parados / possivel especulação
SELECT
    calculated_host_listings_count >= 10 AS is_multi_listing_host,
    ROUND(AVG(number_of_reviews), 2) AS avg_reviews,
    ROUND(AVG(availability_365), 2) AS avg_availability,
    COUNT(*) AS listings
FROM df
GROUP BY calculated_host_listings_count >= 10;
