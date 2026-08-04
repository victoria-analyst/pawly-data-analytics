-- Business Overview
-- Aggregates each business with service coverage, animal type support, emergency care level, and profile completeness score.
-- Powers the BigQuery insights on category distribution, service gaps, and emergency care coverage.

WITH services_cte AS (
    SELECT
        bs.business_id,
        COUNT(DISTINCT bs.service_id) AS services_count,

        -- Veterinary services
        CAST(LOGICAL_OR(s.name = 'Вакцинація') AS INT64) AS has_vaccination,
        CAST(LOGICAL_OR(s.name = 'Кастрація / стерилізація') AS INT64) AS has_neutering,
        CAST(LOGICAL_OR(s.name = 'Лабораторні аналізи') AS INT64) AS has_lab_tests,
        CAST(LOGICAL_OR(s.name = 'Огляд') AS INT64) AS has_examination,
        CAST(LOGICAL_OR(s.name = 'Рентген') AS INT64) AS has_xray,
        CAST(LOGICAL_OR(s.name = 'Стоматологія') AS INT64) AS has_dental,
        CAST(LOGICAL_OR(s.name = 'УЗД') AS INT64) AS has_ultrasound,
        CAST(LOGICAL_OR(s.name = 'Хірургія') AS INT64) AS has_surgery,

        -- Pet shop services
        CAST(LOGICAL_OR(s.name = 'Аксесуари') AS INT64) AS has_accessories,
        CAST(LOGICAL_OR(s.name = 'Ветаптека') AS INT64) AS has_pharmacy,
        CAST(LOGICAL_OR(s.name = 'Корм') AS INT64) AS has_pet_food,

        -- Grooming services
        CAST(LOGICAL_OR(s.name = 'Купання') AS INT64) AS has_bathing,
        CAST(LOGICAL_OR(s.name = 'Обрізання кігтів') AS INT64) AS has_nail_trimming,
        CAST(LOGICAL_OR(s.name = 'Стрижка') AS INT64) AS has_haircut,
        CAST(LOGICAL_OR(s.name = 'Чистка вух') AS INT64) AS has_ear_cleaning

    FROM `analytics-prod-499915.analytics.business_services` bs
    INNER JOIN `analytics-prod-499915.analytics.services` s
        ON bs.service_id = s.id
    GROUP BY bs.business_id
),

animals_cte AS (
    SELECT
        bat.business_id,
        COUNT(DISTINCT bat.animal_type_id) AS animal_types_count,

        CAST(
            LOGICAL_OR(ant.name IN ('Кіт', 'Собака'))
            AS INT64
        ) AS supports_common_pets,

        CAST(
            LOGICAL_OR(ant.name IN ('Гризун', 'Кролик', 'Птах', 'Рептилія', 'Риба'))
            AS INT64
        ) AS supports_exotic_animals

    FROM `analytics-prod-499915.analytics.business_animal_types` bat
    INNER JOIN `analytics-prod-499915.analytics.animal_types` ant
        ON bat.animal_type_id = ant.id
    GROUP BY bat.business_id
)

SELECT
    b.id AS business_id,
    b.name AS business_name,
    bc.name AS category,
    b.city,
    b.latitude,
    b.longitude,

    CASE
        WHEN b.emergency_24_7 THEN '24/7 Emergency'
        WHEN b.accepts_emergencies THEN 'Emergency'
        ELSE 'No Emergency'
    END AS emergency_level,

    DATE(b.created_at) AS registration_date,

    COALESCE(sc.services_count, 0) AS services_count,
    COALESCE(ac.animal_types_count, 0) AS animal_types_count,

    -- Veterinary services
    COALESCE(sc.has_vaccination, 0) AS has_vaccination,
    COALESCE(sc.has_neutering, 0) AS has_neutering,
    COALESCE(sc.has_lab_tests, 0) AS has_lab_tests,
    COALESCE(sc.has_examination, 0) AS has_examination,
    COALESCE(sc.has_xray, 0) AS has_xray,
    COALESCE(sc.has_dental, 0) AS has_dental,
    COALESCE(sc.has_ultrasound, 0) AS has_ultrasound,
    COALESCE(sc.has_surgery, 0) AS has_surgery,

    -- Pet shop services
    COALESCE(sc.has_accessories, 0) AS has_accessories,
    COALESCE(sc.has_pharmacy, 0) AS has_pharmacy,
    COALESCE(sc.has_pet_food, 0) AS has_pet_food,

    -- Grooming services
    COALESCE(sc.has_bathing, 0) AS has_bathing,
    COALESCE(sc.has_nail_trimming, 0) AS has_nail_trimming,
    COALESCE(sc.has_haircut, 0) AS has_haircut,
    COALESCE(sc.has_ear_cleaning, 0) AS has_ear_cleaning,

    COALESCE(ac.supports_common_pets, 0) AS supports_common_pets,
    COALESCE(ac.supports_exotic_animals, 0) AS supports_exotic_animals,

    (
        IF(b.description IS NOT NULL, 1, 0) +
        IF(b.phone IS NOT NULL, 1, 0) +
        IF(b.email IS NOT NULL, 1, 0) +
        IF(b.website IS NOT NULL, 1, 0) +
        IF(b.cover_image_url IS NOT NULL, 1, 0)
    ) AS profile_completeness

FROM `analytics-prod-499915.analytics.businesses` b
LEFT JOIN `analytics-prod-499915.analytics.business_categories` bc
    ON b.category_id = bc.id
LEFT JOIN services_cte sc
    ON b.id = sc.business_id
LEFT JOIN animals_cte ac
    ON b.id = ac.business_id;
